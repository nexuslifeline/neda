<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Inventory extends CORE_Controller
{
    function __construct()
    {
        parent::__construct('');
        $this->validate_session();
        $this->load->model(
            array
            (
                'Departments_model',
                'Company_model',
                'Users_model',
                'Products_model'
            )
        );
    }

    public function index() {

        $data['_def_css_files'] = $this->load->view('template/assets/css_files', '', true);
        $data['_def_js_files'] = $this->load->view('template/assets/js_files', '', true);
        $data['_switcher_settings'] = $this->load->view('template/elements/switcher', '', true);
        $data['_side_bar_navigation'] = $this->load->view('template/elements/side_bar_navigation', '', true);
        $data['_top_navigation'] = $this->load->view('template/elements/top_navigation', '', true);
        $data['title'] = 'Inventory Report';

        $data['departments']=$this->Departments_model->get_list(array('is_deleted'=>FALSE,'is_active'=>TRUE));
        
        (in_array('8-1',$this->session->user_rights)?
        $this->load->view('inventory_report_view',$data)
        :redirect(base_url('profile')));
    }



    public function transaction($txn=null){
        switch($txn){
            case 'get-inventory':
                $m_products = $this->Products_model;
                $date = date('Y-m-d',strtotime($this->input->post('date',TRUE)));
                $depid = $this->input->post('depid',TRUE);

                $response['data'] = $m_products->get_product_list_inventory($date,$depid);
                echo json_encode($response);
                break;
            case 'preview-inventory':
                $m_products = $this->Products_model;
                $m_department = $this->Departments_model;

                $date = date('Y-m-d',strtotime($this->input->get('date',TRUE)));
                $depid = $this->input->get('depid',TRUE);
                $info = $m_department->get_list($depid);

                $data['products'] = $m_products->get_product_list_inventory($date,$depid);
                $data['date'] = date('m/d/Y',strtotime($date));
                $data['department'] =(count($info)>0?$info[0]->department_name:'');

                $m_company_info=$this->Company_model;
                $company_info=$m_company_info->get_list();
                $data['company_info']=$company_info[0];
                $this->load->view('template/batch_inventory_report',$data);
                break;
            case 'materials-issued':
                $m_products = $this->Products_model;

                $start = date('Y-m-d',strtotime($this->input->get('start')));
                $end = date('Y-m-d',strtotime($this->input->get('end')));

                $data['start'] = date('m/d/Y',strtotime($start));
                $data['end'] = date('m/d/Y',strtotime($end));
                $data['items'] = $m_products->get_supplies_materials_issued($start,$end);
                $this->load->view('template/rpt_materials_issued',$data);
                break;
        }
    }







}
?>