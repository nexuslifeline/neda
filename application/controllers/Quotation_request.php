<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Quotation_request extends CORE_Controller
{

    function __construct() {
        parent::__construct('');
        $this->validate_session();


    }

    public function index() {
        $data['title'] = 'Invitation';
        $this->load->view('quotation_request_view', $data);

    }

}
