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
        $sql="INSERT INTO `rights_links` (`link_id`, `parent_code`, `link_code`, `link_name`) VALUES                                         
                                          (6,'2','2-1','Purchase Order'),
                                          (7,'2','2-2','Purchase Invoice'),
                                          (8,'2','2-3','Account Payables'),
                                          (9,'2','2-4','Item Issuance'),
                                          (10,'2','2-5','Item Adjustment (In)'),
                                          (14,'4','4-2','Category Management'),
                                          (15,'4','4-3','Department Management'),
                                          (16,'4','4-4','Unit Management'),
                                          (17,'5','5-1','Product Management'),                                        
                                          (19,'5','5-3','Supplier Management'),
                                          (20,'6','6-1','Setup Tax'),                                         
                                          (23,'6','6-4','Setup User Group'),
                                          (24,'6','6-5','Create User Account'),
                                          (25,'6','6-6','Setup Company Info'),
                                          (26,'7','7-1','Purchase Order for Approval'),                         
                                          (49,'9','9-13','Replenishment Report'),
                                          (50,'6','6-9','Backup Database'),
                                          (51,'2','2-6','Requisition')

                                          ON DUPLICATE KEY UPDATE
                                          rights_links.parent_code=VALUES(rights_links.parent_code),
                                          rights_links.link_code=VALUES(rights_links.link_code),
                                          rights_links.link_name=VALUES(rights_links.link_name)
            ";
        $this->db->query($sql);
    }
}
?>