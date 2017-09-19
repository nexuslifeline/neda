<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CORE_Controller {

    function __construct()
    {
        parent::__construct('');
        $this->validate_session();
        $this->load->model('Users_model');
        $this->load->model('Purchases_model');

    }

    public function index()
    {

        $data['_def_css_files']=$this->load->view('template/assets/css_files','',TRUE);
        $data['_def_js_files']=$this->load->view('template/assets/js_files','',TRUE);
        $data['_switcher_settings']=$this->load->view('template/elements/switcher','',TRUE);
        $data['_side_bar_navigation']=$this->load->view('template/elements/side_bar_navigation','',TRUE);
        $data['_top_navigation']=$this->load->view('template/elements/top_navigation','',TRUE);

        $data['title']='Dashboard';



        $data['purchases'] = $this->Purchases_model->get_purchases_this_month();
        $data['po_this_month'] = $this->Purchases_model->get_po_count_this_month();
        $data['issue_this_month'] = $this->Purchases_model->get_issue_count_this_month();
        $data['account_payables'] = array(
            $this->Purchases_model->get_current_ap('01'),
            $this->Purchases_model->get_current_ap('02'),
            $this->Purchases_model->get_current_ap('03'),
            $this->Purchases_model->get_current_ap('04'),
            $this->Purchases_model->get_current_ap('05'),
            $this->Purchases_model->get_current_ap('06'),
            $this->Purchases_model->get_current_ap('07'),
            $this->Purchases_model->get_current_ap('08'),
            $this->Purchases_model->get_current_ap('09'),
            $this->Purchases_model->get_current_ap('10'),
            $this->Purchases_model->get_current_ap('11'),
            $this->Purchases_model->get_current_ap('12')
        );

        $this->load->view('dashboard_view',$data);
    }


}
