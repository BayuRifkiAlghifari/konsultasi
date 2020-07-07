<?php
defined('BASEPATH') or exit('No direct script access allowed');

class DataModel extends Render_Model
{


    public function getAllData()
    {
        $exe                         = $this->db->get('program');

        return $exe->result_array();
    }

    public function getDataDetail($id)
    {
        $exe                         = $this->db->get_where('program', ['id_program' => $id]);
        return $exe->row_array();
    }


    public function insert($judul, $keterangan, $harga, $durasi)
    {
        $data['judul']               = $judul;
        $data['keterangan']          = $keterangan;
        $data['harga']               = $harga;
        $data['durasi']              = $durasi;
        $exe                         = $this->db->insert('program', $data);
        return $data;
    }


    public function update($id, $judul, $keterangan, $harga, $durasi)
    {
        $data['id_program']          = $id;
        $data['judul']               = $judul;
        $data['keterangan']          = $keterangan;
        $data['harga']               = $harga;
        $data['durasi']              = $durasi;

        $exe                         = $this->db->where('id_program', $id);
        $exe                         = $this->db->update('program', $data);
        return $data;
    }


    public function delete($id)
    {
        $exe                         = $this->db->where('id_program', $id);
        $exe                         = $this->db->delete('program');

        return $exe;
    }
}

/* End of file DataModel.php */
/* Location: ./application/models/gejala/DataModel.php */