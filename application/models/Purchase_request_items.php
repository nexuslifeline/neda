<?php

class Purchase_request_items extends CORE_Model {
    protected  $table="pr_items";
    protected  $pk_id="pr_item_id";

    function __construct() {
        parent::__construct();
    }

}

?>