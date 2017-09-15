<?php
class Rights_link_model extends CORE_Model{
    protected  $table="rights_links"; //table name
    protected  $pk_id="link_id"; //primary key id
    function __construct()
    {
        // Call the Model constructor
        parent::__construct();
    }
    function create_default_link_list(){
        $sql="INSERT INTO `rights_links` (`link_id`, `parent_code`, `link_code`, `link_name`,controller) VALUES                                         
                                          (6,'2','2-1','Purchase Order','Purchases'),
                                          (7,'2','2-2','Purchase Invoice','Deliveries'),
                                          (8,'2','2-3','Account Payables','Payable_payments'),
                                          (9,'2','2-4','Item Issuance','Issuances'),
                                          (10,'2','2-5','Item Adjustment (In)','Adjustments'),
                                          (14,'4','4-2','Category Management','Categories'),
                                          (15,'4','4-3','Department Management','Departments'),
                                          (16,'4','4-4','Unit Management','Units'),
                                          (17,'5','5-1','Product Management','Products'),                                        
                                          (19,'5','5-3','Supplier Management','Suppliers'),
                                          (20,'6','6-1','Setup Tax','Tax'),                                         
                                          (23,'6','6-4','Setup User Group','User_groups'),
                                          (24,'6','6-5','Create User Account','Users'),
                                          (25,'6','6-6','Setup Company Info','Company'),
                                          (26,'7','7-1','Purchase Order for Approval','Dashboard'),                      
                  
                                          
                                          (51,'2','2-6','Requisition','Requisition'),
                                          (52,'8','8-1','Inventory Report','Inventory'),
                                          (53,'8','8-2','Supplies and Materials Issued Report','Supplies_issued')

                                          ON DUPLICATE KEY UPDATE
                                          rights_links.parent_code=VALUES(rights_links.parent_code),
                                          rights_links.link_code=VALUES(rights_links.link_code),
                                          rights_links.link_name=VALUES(rights_links.link_name)
            ";
        $this->db->query($sql);
    }
}
?>