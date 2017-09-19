<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Reset extends CORE_Controller
{

    function __construct() {
        parent::__construct('');
        $this->validate_session();
        $this->load->model('Tax_types_model');
        $this->load->model('Products_model');
        $this->load->model('Departments_model');
        $this->load->model('Requisition_info_model');
        $this->load->model('Requisition_items_model');
        $this->load->model('Issuance_model');
        $this->load->model('Issuance_item_model');
        $this->load->library('email');

    }

    public function index() {

        $this->db->query('TRUNCATE products');
        $this->db->query('TRUNCATE suppliers');
        $this->db->query('TRUNCATE categories');
        $this->db->query('TRUNCATE departments');
        $this->db->query('TRUNCATE units');

        $this->db->query('TRUNCATE purchase_order');
        $this->db->query('TRUNCATE purchase_order_items');

        $this->db->query('TRUNCATE delivery_invoice');
        $this->db->query('TRUNCATE delivery_invoice_items');

        $this->db->query('TRUNCATE requisition_info');
        $this->db->query('TRUNCATE requisition_items');

        $this->db->query('TRUNCATE issuance_info');
        $this->db->query('TRUNCATE issuance_items');

        $this->db->query('TRUNCATE adjustment_info');
        $this->db->query('TRUNCATE adjustment_items');

        $this->db->query('TRUNCATE payable_payments');
        $this->db->query('TRUNCATE payable_payments_list');

        $this->db->query('TRUNCATE po_attachments');
        $this->db->query('TRUNCATE po_messages');

        echo "Database successfully truncated. ";

    }


    function  sendTest(){

        $config = Array(
            'protocol' => 'smtp',
            'smtp_host' => 'ssl://smtp.googlemail.com',
            'smtp_port' => 465,
            'smtp_user' => 'chris14rueda18@gmail.com',
            'smtp_pass' => '09141991',
            'smtp_timeout' => 30,
            'mailtype' => 'html'
        );
        $this->load->library('email', $config);
        $this->email->set_newline("\r\n");

//Add file directory if you need to attach a file
       // $this->email->attach($file_dir_name);

        $this->email->from('SYSTEM', 'LIEZEL');
        $this->email->to('chrisrueda14@yahoo.com');

        $this->email->subject('Email Subject');
        $this->email->message('Email Message');

        if($this->email->send()){
            //Success email Sent
            echo $this->email->print_debugger();
        }else{
            //Email Failed To Send
            echo $this->email->print_debugger();
        }
    }


    function datamine(){
        $referrer = 'http://www.google.com/search?hl=en&q=learn111+php+2&client=firefox';

        // Parse the URL into an array
        $parsed = parse_url( $referrer, PHP_URL_QUERY );

    // Parse the query string into an array
        parse_str( $parsed, $query );

    // Output the result
        echo $query['q'];
    }



}
