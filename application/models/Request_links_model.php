<?php

class Request_links_model extends CORE_Model{

    protected  $table="request_links"; //table name
    protected  $pk_id="request_link_id"; //primary key id


    function __construct()
    {
        // Call the Model constructor
        parent::__construct();
    }


}


?>