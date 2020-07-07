<?php
defined('BASEPATH') or exit('No direct script access allowed');

class DataModel extends Render_Model
{


	public function getPenyakit()
	{
		$exe 						= $this->db->get('penyakit');

		return $exe->result_array();
	}


	public function getGejala()
	{
		$exe 						= $this->db->get('gejala');

		return $exe->result_array();
	}


	public function insert_diagnosa()
	{
		$user_id 					= $this->session->userdata('data')['id'];

		$data['id_user'] 			= $user_id;
		$data['score'] 				= 0;
		$data['keterangan'] 		= '';
		$data['status'] 			= 'Aktif';

		$exe 						= $this->db->insert('diagnosa', $data);
		$exe 						= $this->db->insert_id();

		return $exe;
	}


	public function insert_diagnosa_detail($id, $optradio, $exedi, $penyakit)
	{
		$user_id 					= $this->session->userdata('data')['id'];
		$nilai 						= $this->db->get_where('gejala', ['id_gejala' => $id])->row_array()['nilai'];

		$data['id_diagnosa'] 		= $exedi;
		$data['id_penyakit'] 		= $penyakit;
		$data['id_gejala'] 			= $id;
		$data['jawaban'] 			= $optradio;
		$data['nilai'] 				= ($optradio > 0) ? $nilai : 0;

		$exe 						= $this->db->insert('diagnosa_detail', $data);

		return $exe;
	}


	public function update_diagnosa($exedi)
	{
		$nilai 						= $this->db->select('sum(nilai) as score')
												->get_where('diagnosa_detail', ['id_diagnosa' => $exedi])
												->row_array()['score'];

		$data['score'] 				= $nilai;

		$exe 						= $this->db->where('id_diagnosa', $exedi);
		$exe 						= $this->db->update('diagnosa', $data);

		return $exe;
	}


	public function cek_diagnosa($q)
	{
		// Array Penyakit
		$hasil 						= array();

		// Get Data Diagnosa Detail
		$diagnosa 					= $this->db->select('sum(nilai) as score, id_penyakit as penyakit')
												->where('id_diagnosa', $q)
												->group_by('id_penyakit')
												->order_by('score', 'desc')
												->get('diagnosa_detail')
												->result_array();


		// Cek Diagnosa per penyakit
		foreach($diagnosa as $r)
		{
			// Get Data Penyakit
			$penyakit 				= $this->db->get_where('penyakit', ['id_penyakit' => $r['penyakit']])->row_array();
											
			// Cek minimal diagnosa
			if ((int)$r['score']  >= (int)$penyakit['min_persentase'] || (int)$penyakit['max_persentase'] <= (int)$r['score']) 
			{
				$data['penyakit'] 	= $penyakit['nama'];
				$data['status'] 	= 1;
				$data['data'] 		= $this->db->select('users.*, saran.*, penyakit.nama as penyakit')
												->join('users', 'users.user_id = saran.id_user')
												->join('penyakit', 'penyakit.id_penyakit = saran.id_penyakit')
												->limit(1)
												->get_where('saran', ['saran.id_penyakit' => $r['penyakit']])
												->row_array();

				array_push($hasil, $data);
			} 
			else 
			{
				$data['penyakit'] 	= $penyakit['nama'];
				$data['status'] 	= 0;
				$data['data'] 		= null;
			
				array_push($hasil, $data);
			}
		}
		
		return $hasil;
	}
}

/* End of file DataModel.php */
/* Location: ./application/models/diagnosa/DataModel.php */