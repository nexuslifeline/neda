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
        $sql = "SELECT ri.product_id,p.product_desc,p.product_code,
                SUM(ri.req_qty) as request_qty,p.on_hand,u.unit_name,ri.unit_id,ri.is_available
                
                FROM `requisition_items` as ri
                LEFT JOIN units as u ON ri.unit_id=u.unit_id
                LEFT JOIN products as p 
                ON p.`product_id`=ri.product_id
                WHERE ri.requisition_id = $requisition_id
                GROUP BY p.product_id";

        return $this->db->query($sql)->result();

    }


    function get_requisition_issuance($requisition_id){
        $sql = "SELECT p.product_desc,p.product_code,u.unit_name,ri.*,IFNULL(ii.issue_qty,0) as issue_qty,ii.remarks
                FROM
                (
                SELECT ri.product_id,ri.requisition_id,ri.unit_id,SUM(ri.req_qty) as request_qty,ri.is_available
                FROM `requisition_items` as ri WHERE ri.requisition_id = $requisition_id
                GROUP BY `ri`.product_id
                )as ri
                
                LEFT JOIN
                
                (
                SELECT 
                iss.product_id,SUM(iss.issue_qty) as issue_qty ,ii.remarks
                FROM `issuance_items` as `iss`
                INNER JOIN `issuance_info` as ii ON ii.issuance_id=iss.`issuance_id`
                WHERE ii.requisition_id = $requisition_id
                GROUP BY iss.`product_id`
                )as ii ON ii.product_id=ri.product_id
                
                LEFT JOIN products as p ON p.product_id=ri.product_id
                LEFT JOIN units as u ON u.unit_id=ri.unit_id";

        return $this->db->query($sql)->result();
    }



}


?>