<?php

class Purchases_model extends CORE_Model {
    protected  $table="purchase_order";
    protected  $pk_id="purchase_order_id";

    function __construct() {
        parent::__construct();
    }

    function get_purchases_this_month(){
        $result = $this->db->query("SELECT IFNULL(SUM(dii.dr_line_total_price),0) as purchases FROM `delivery_invoice_items` as dii
        INNER JOIN `delivery_invoice` as di ON di.`dr_invoice_id`=dii.dr_invoice_id
        WHERE di.date_delivered LIKE CONCAT(DATE_FORMAT(NOW(),'%Y-%m'),'%') AND di.is_deleted=0")->result();
        return (count($result)>0?$result[0]->purchases:0);
    }

    function get_po_count_this_month(){
        $result = $this->db->query("SELECT IFNULL(COUNT(po.purchase_order_id),0) as po_this_month FROM `purchase_order` as po WHERE po.date_created LIKE CONCAT(DATE_FORMAT(NOW(),'%Y-%m'),'%') AND po.is_deleted=0")->result();
        return (count($result)>0?$result[0]->po_this_month:0);
    }

    function get_issue_count_this_month(){
        $result = $this->db->query("SELECT IFNULL(COUNT(iss.issuance_id),0) as issue_this_month FROM `issuance_info` as iss WHERE iss.date_issued LIKE CONCAT(DATE_FORMAT(NOW(),'%Y-%m'),'%') AND iss.is_deleted=0")->result();
        return (count($result)>0?$result[0]->issue_this_month:0);
    }

    function get_current_ap($month){
        $result = $this->db->query("SELECT m.total_ap-m.total_payment as current_ap

            FROM
            
            (SELECT IFNULL(SUM(dii.dr_line_total_price),0)as total_ap,
            
            IFNULL((SELECT SUM(pp.total_paid_amount) FROM `payable_payments` as pp WHERE pp.is_active=1 
            AND pp.is_deleted=0 AND pp.date_paid LIKE CONCAT(DATE_FORMAT(NOW(),'%Y'),'-$month-%')),0)as total_payment
            
            FROM `delivery_invoice_items` as dii
            INNER JOIN `delivery_invoice` as di ON di.`dr_invoice_id`=dii.`dr_invoice_id` WHERE di.is_deleted=0
            AND di.date_delivered LIKE CONCAT(DATE_FORMAT(NOW(),'%Y'),'-$month-%')
        ) as m")->result();
        return (count($result)>0?$result[0]->current_ap:0);
    }


    function get_po_balance_qty($id){
        $sql="SELECT SUM(x.Balance)as Balance
        FROM
        (SELECT
        m.purchase_order_id,
        m.po_no,m.product_id,

        SUM(m.PoQty) as PoQty,
        SUM(m.DrQty)as DrQty,
        (SUM(m.PoQty)-SUM(m.DrQty))as Balance


        FROM

        (SELECT po.purchase_order_id,po.po_no,poi.product_id,SUM(poi.po_qty) as PoQty,0 as DrQty FROM purchase_order as po
        INNER JOIN purchase_order_items as poi ON po.purchase_order_id=poi.purchase_order_id
        WHERE po.purchase_order_id=$id AND po.is_active=TRUE AND po.is_deleted=FALSE
        GROUP BY po.po_no,poi.product_id


        UNION ALL

        SELECT po.purchase_order_id,po.po_no,dii.product_id,0 as PoQty,SUM(dii.dr_qty) as DrQty FROM (delivery_invoice as di
        INNER JOIN purchase_order as po ON di.purchase_order_id=po.purchase_order_id)
        INNER JOIN delivery_invoice_items as dii ON di.dr_invoice_id=dii.dr_invoice_id
        WHERE po.purchase_order_id=$id AND di.is_active=TRUE AND di.is_deleted=FALSE
        GROUP BY po.po_no,dii.product_id)as

        m GROUP BY m.po_no,m.product_id) as x";

        return $this->db->query($sql)->result();
    }

}



?>