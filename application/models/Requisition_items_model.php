<?php

class Requisition_items_model extends CORE_Model
{
    protected $table = "requisition_items";
    protected $pk_id = "req_item_id";
    protected $fk_id = "requisition_id";

    function __construct()
    {
        parent::__construct();
    }
}


?>