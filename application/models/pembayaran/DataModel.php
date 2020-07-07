<?php
defined('BASEPATH') or exit('No direct script access allowed');

class DataModel extends Render_Model
{
    public function getData()
    {
        return $this->db->get('pembayaran')->result_array();
    }

    public function acc($id, $data)
    {
        $exe = $this->db->where('id_pembayaran', $id);
        $exe  = $this->db->update('pembayaran', $data);
        
        return $exe;
    }

    public function reject($id, $data)
    {
        $exe = $this->db->where('id_pembayaran', $id);
        $exe  = $this->db->update('pembayaran', $data);
        
        return $exe;
    }
}
