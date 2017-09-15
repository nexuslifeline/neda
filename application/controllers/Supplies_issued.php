<?php
defined('BASEPATH') OR die('direct script access is not allowed');

class Supplies_issued extends CORE_Controller
{
    function __construct()
    {
        parent::__construct('');
        $this->validate_session();
        $this->load->model(
            ''
        );
    }

    function index(){
        $data['_def_css_files'] = $this->load->view('template/assets/css_files', '', TRUE);
        $data['_def_js_files'] = $this->load->view('template/assets/js_files', '', TRUE);
        $data['_switcher_settings'] = $this->load->view('template/elements/switcher', '', TRUE);
        $data['_side_bar_navigation'] = $this->load->view('template/elements/side_bar_navigation', '', TRUE);
        $data['_top_navigation'] = $this->load->view('template/elements/top_navigation', '', TRUE);
        $data['title'] = 'Supplies and Materials Issued';


        (in_array('8-2',$this->session->user_rights)?
            $this->load->view('supplies_materials_issued_view', $data)
            :redirect(base_url('profile')));
    }

    function transaction($txn=null) {
        switch ($txn) {

        }
    }
}
?>