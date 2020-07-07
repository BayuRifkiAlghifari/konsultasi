<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class DataModel extends Render_Model {


	public function getPenyakit()
	{
		$exe 						= $this->db->get('penyakit');

		return $exe->result_array();
	}


	public function getGejala($q)
	{
		$exe 						= $this->db->get_where('gejala', ['id_penyakit' => $q]);

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
		$diagnosa 					= $this->db->select('diagnosa.score as score, diagnosa_detail.id_penyakit as penyakit')
												->join('diagnosa_detail', 'diagnosa_detail.id_diagnosa = diagnosa.id_diagnosa', 'left')
												->limit(1)
												->get_where('diagnosa', ['diagnosa.id_diagnosa' => $q])
												->row_array();

		$penyakit 					= $this->db->get_where('penyakit', ['id_penyakit' => $diagnosa['penyakit']])->row_array();

		// Cek minimal diagnosa
		if($diagnosa['score']  >= $penyakit['min_persentase'] || $diagnosa['score'] <= $penyakit['max_persentase'])
		{
			$return['status'] 	= 1;
			$return['data'] 	= $this->db->select('users.*, saran.*, penyakit.nama as penyakit')
											->join('users', 'users.user_id = saran.id_user')
											->join('penyakit', 'penyakit.id_penyakit = saran.id_penyakit')
											->limit(1)
											->get_where('saran', ['saran.id_penyakit' => $diagnosa['penyakit']])
											->row_array();

			return $return;
		}
		else
		{
			$return['status'] 	= 0;
			$return['data'] 	= null;

			return $return;
		}
	}


}

/* End of file DataModel.php */
/* Location: ./application/models/diagnosa/DataModel.php */