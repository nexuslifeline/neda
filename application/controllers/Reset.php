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



}
