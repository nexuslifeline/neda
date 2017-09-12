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


    function get_requisition_items( $requisition_id ){
        $sql = "SELECT ri.product_id,p.product_desc,
                SUM(ri.req_qty) as request_qty,p.on_hand,u.unit_name
                
                FROM `requisition_items` as ri
                LEFT JOIN units as u ON ri.unit_id=u.unit_id
                LEFT JOIN products as p 
                ON p.`product_id`=ri.product_id
                WHERE ri.requisition_id = $requisition_id
                GROUP BY p.product_id";

        return $this->db->query($sql)->result();

    }



}


?>