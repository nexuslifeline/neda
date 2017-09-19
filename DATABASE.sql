/* SQL Manager Lite for MySQL                              5.6.3.49012 */
/* ------------------------------------------------------------------- */
/* Host     : localhost                                                */
/* Port     : 3306                                                     */
/* Database : procure                                                  */


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES 'latin1' */;

SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE `procure`
    CHARACTER SET 'latin1'
    COLLATE 'latin1_swedish_ci';

USE `procure`;

/* Structure for the `adjustment_info` table : */

CREATE TABLE `adjustment_info` (
  `adjustment_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `adjustment_code` VARCHAR(75) COLLATE latin1_swedish_ci DEFAULT '',
  `department_id` INTEGER(11) DEFAULT 0,
  `remarks` VARCHAR(755) COLLATE latin1_swedish_ci DEFAULT '',
  `adjustment_type` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT 'IN',
  `total_discount` DECIMAL(20,2) DEFAULT 0.00,
  `total_before_tax` DECIMAL(20,2) DEFAULT 0.00,
  `total_after_tax` DECIMAL(20,2) DEFAULT 0.00,
  `total_tax_amount` DECIMAL(20,2) DEFAULT 0.00,
  `date_adjusted` DATE DEFAULT '0000-00-00',
  `date_created` DATETIME DEFAULT '0000-00-00 00:00:00',
  `date_modified` TIMESTAMP NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `date_deleted` DATETIME DEFAULT NULL,
  `posted_by_user` INTEGER(11) DEFAULT 0,
  `modified_by_user` INTEGER(11) DEFAULT 0,
  `deleted_by_user` INTEGER(11) DEFAULT 0,
  `is_active` BIT(1) DEFAULT 1,
  `is_deleted` BIT(1) DEFAULT 0,
  PRIMARY KEY USING BTREE (`adjustment_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `adjustment_items` table : */

CREATE TABLE `adjustment_items` (
  `adjustment_item_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `adjustment_id` INTEGER(11) DEFAULT 0,
  `product_id` INTEGER(11) DEFAULT 0,
  `unit_id` INTEGER(11) DEFAULT 0,
  `adjust_qty` DECIMAL(20,0) DEFAULT 0,
  `adjust_price` DECIMAL(20,4) DEFAULT 0.0000,
  `adjust_discount` DECIMAL(20,4) DEFAULT 0.0000,
  `adjust_tax_rate` DECIMAL(20,4) DEFAULT 0.0000,
  `adjust_line_total_price` DECIMAL(20,4) DEFAULT 0.0000,
  `adjust_line_total_discount` DECIMAL(20,4) DEFAULT 0.0000,
  `adjust_tax_amount` DECIMAL(20,4) DEFAULT 0.0000,
  `adjust_non_tax_amount` DECIMAL(20,4) DEFAULT 0.0000,
  `exp_date` DATE DEFAULT '0000-00-00',
  `batch_no` VARCHAR(55) COLLATE latin1_swedish_ci DEFAULT '',
  PRIMARY KEY USING BTREE (`adjustment_item_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `approval_status` table : */

CREATE TABLE `approval_status` (
  `approval_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `approval_status` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT '',
  `approval_description` VARCHAR(555) COLLATE latin1_swedish_ci DEFAULT '',
  `is_active` BIT(1) DEFAULT 1,
  `is_deleted` BIT(1) DEFAULT 0,
  PRIMARY KEY USING BTREE (`approval_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=3 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `categories` table : */

CREATE TABLE `categories` (
  `category_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `category_code` BIGINT(20) DEFAULT NULL,
  `category_name` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT NULL,
  `category_desc` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT NULL,
  `date_created` DATETIME DEFAULT NULL,
  `date_modified` TIMESTAMP NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` TINYINT(4) DEFAULT 0,
  `is_active` TINYINT(4) DEFAULT 1,
  PRIMARY KEY USING BTREE (`category_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `chat` table : */

CREATE TABLE `chat` (
  `chat_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `chat_code` VARCHAR(150) COLLATE latin1_swedish_ci DEFAULT '0',
  `message` VARCHAR(160) COLLATE latin1_swedish_ci DEFAULT NULL,
  `from_user_id` INTEGER(11) DEFAULT NULL,
  `date_created` DATETIME DEFAULT NULL,
  `date_deleted` DATETIME DEFAULT NULL,
  `is_deleted` TINYINT(4) DEFAULT 0,
  PRIMARY KEY USING BTREE (`chat_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=26 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `company_info` table : */

CREATE TABLE `company_info` (
  `company_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `company_name` VARCHAR(555) COLLATE latin1_swedish_ci DEFAULT '',
  `company_address` VARCHAR(755) COLLATE latin1_swedish_ci DEFAULT '',
  `email_address` VARCHAR(155) COLLATE latin1_swedish_ci DEFAULT '',
  `mobile_no` VARCHAR(125) COLLATE latin1_swedish_ci DEFAULT '',
  `landline` VARCHAR(125) COLLATE latin1_swedish_ci DEFAULT '',
  `tin_no` VARCHAR(55) COLLATE latin1_swedish_ci DEFAULT NULL,
  `tax_type_id` INTEGER(11) DEFAULT 0,
  `registered_to` VARCHAR(555) COLLATE latin1_swedish_ci DEFAULT '',
  `logo_path` VARCHAR(555) COLLATE latin1_swedish_ci DEFAULT '',
  PRIMARY KEY USING BTREE (`company_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=2 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `delivery_invoice` table : */

CREATE TABLE `delivery_invoice` (
  `dr_invoice_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `dr_invoice_no` VARCHAR(75) COLLATE latin1_swedish_ci DEFAULT '',
  `purchase_order_id` INTEGER(11) DEFAULT 0,
  `external_ref_no` VARCHAR(75) COLLATE latin1_swedish_ci DEFAULT '',
  `contact_person` VARCHAR(155) COLLATE latin1_swedish_ci DEFAULT '',
  `terms` VARCHAR(55) COLLATE latin1_swedish_ci DEFAULT '',
  `duration` VARCHAR(75) COLLATE latin1_swedish_ci DEFAULT '',
  `supplier_id` INTEGER(11) DEFAULT 0,
  `department_id` BIGINT(20) DEFAULT 0,
  `tax_type_id` INTEGER(11) DEFAULT 0,
  `journal_id` BIGINT(20) DEFAULT 0,
  `remarks` VARCHAR(555) COLLATE latin1_swedish_ci DEFAULT '',
  `total_discount` DECIMAL(20,4) DEFAULT 0.0000,
  `total_before_tax` DECIMAL(20,4) DEFAULT 0.0000,
  `total_tax_amount` DECIMAL(20,4) DEFAULT 0.0000,
  `total_after_tax` DECIMAL(20,4) DEFAULT 0.0000,
  `is_active` TINYINT(4) DEFAULT 1,
  `is_deleted` TINYINT(4) DEFAULT 0,
  `is_paid` TINYINT(4) DEFAULT 0,
  `is_journal_posted` TINYINT(4) DEFAULT 0,
  `date_due` DATE DEFAULT '0000-00-00',
  `date_delivered` DATE DEFAULT '0000-00-00',
  `date_created` DATETIME DEFAULT '0000-00-00 00:00:00',
  `date_modified` TIMESTAMP NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `date_deleted` DATETIME DEFAULT '0000-00-00 00:00:00',
  `posted_by_user` INTEGER(11) DEFAULT 0,
  `modified_by_user` INTEGER(11) DEFAULT 0,
  `deleted_by_user` INTEGER(11) DEFAULT 0,
  `batch_no` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`dr_invoice_id`),
  UNIQUE KEY `dr_invoice_no` USING BTREE (`dr_invoice_no`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `delivery_invoice_items` table : */

CREATE TABLE `delivery_invoice_items` (
  `dr_invoice_item_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `dr_invoice_id` BIGINT(20) DEFAULT 0,
  `product_id` INTEGER(11) DEFAULT 0,
  `unit_id` INTEGER(11) DEFAULT 0,
  `dr_qty` DECIMAL(20,0) DEFAULT 0,
  `dr_discount` DECIMAL(20,4) DEFAULT 0.0000,
  `dr_price` DECIMAL(20,4) DEFAULT 0.0000,
  `dr_line_total_discount` DECIMAL(20,4) DEFAULT 0.0000,
  `dr_line_total_price` DECIMAL(20,4) DEFAULT 0.0000,
  `dr_tax_rate` DECIMAL(20,4) DEFAULT 0.0000,
  `dr_tax_amount` DECIMAL(20,4) DEFAULT 0.0000,
  `dr_non_tax_amount` DECIMAL(20,4) DEFAULT 0.0000,
  `exp_date` DATE DEFAULT '0000-00-00',
  `batch_no` VARCHAR(55) COLLATE latin1_swedish_ci DEFAULT '',
  PRIMARY KEY USING BTREE (`dr_invoice_item_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `departments` table : */

CREATE TABLE `departments` (
  `department_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `department_code` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT '',
  `department_name` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT '',
  `department_desc` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT '',
  `delivery_address` VARCHAR(755) COLLATE latin1_swedish_ci DEFAULT '',
  `default_cost` TINYINT(4) DEFAULT 1 COMMENT '1=Purchase Cost 1, 2=Purchase Cost 2',
  `date_created` DATETIME DEFAULT '0000-00-00 00:00:00',
  `date_modified` TIMESTAMP NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` TINYINT(4) DEFAULT 0,
  `is_active` TINYINT(4) DEFAULT 1,
  PRIMARY KEY USING BTREE (`department_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `issuance_info` table : */

CREATE TABLE `issuance_info` (
  `issuance_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `slip_no` VARCHAR(75) COLLATE latin1_swedish_ci DEFAULT '',
  `requisition_id` BIGINT(20) DEFAULT 0,
  `issued_department_id` INTEGER(11) DEFAULT 0,
  `remarks` VARCHAR(755) COLLATE latin1_swedish_ci DEFAULT '',
  `total_discount` DECIMAL(20,2) DEFAULT 0.00,
  `total_before_tax` DECIMAL(20,2) DEFAULT 0.00,
  `total_tax_amount` DECIMAL(20,2) DEFAULT 0.00,
  `total_after_tax` DECIMAL(20,2) DEFAULT 0.00,
  `date_issued` DATE DEFAULT '0000-00-00',
  `date_created` DATETIME DEFAULT '0000-00-00 00:00:00',
  `date_modified` TIMESTAMP NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `date_deleted` DATETIME DEFAULT '0000-00-00 00:00:00',
  `modified_by_user` INTEGER(11) DEFAULT 0,
  `posted_by_user` INTEGER(11) DEFAULT 0,
  `deleted_by_user` INTEGER(11) DEFAULT 0,
  `is_active` TINYINT(4) DEFAULT 1,
  `is_deleted` TINYINT(4) DEFAULT 0,
  PRIMARY KEY USING BTREE (`issuance_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `issuance_items` table : */

CREATE TABLE `issuance_items` (
  `issuance_item_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `issuance_id` INTEGER(11) DEFAULT 0,
  `product_id` INTEGER(11) DEFAULT 0,
  `unit_id` INTEGER(11) DEFAULT 0,
  `issue_qty` DECIMAL(20,2) DEFAULT 0.00,
  `issue_price` DECIMAL(20,2) DEFAULT 0.00,
  `issue_discount` DECIMAL(20,2) DEFAULT 0.00,
  `issue_tax_rate` DECIMAL(11,2) DEFAULT 0.00,
  `issue_line_total_price` DECIMAL(20,2) DEFAULT 0.00,
  `issue_line_total_discount` DECIMAL(20,2) DEFAULT 0.00,
  `issue_tax_amount` DECIMAL(20,2) DEFAULT 0.00,
  `issue_non_tax_amount` DECIMAL(20,2) DEFAULT 0.00,
  `dr_invoice_id` BIGINT(20) DEFAULT 0,
  `exp_date` DATE DEFAULT '0000-00-00',
  `batch_no` VARCHAR(55) COLLATE latin1_swedish_ci DEFAULT '',
  PRIMARY KEY USING BTREE (`issuance_item_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `item_types` table : */

CREATE TABLE `item_types` (
  `item_type_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `item_type` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT '',
  `description` VARCHAR(1000) COLLATE latin1_swedish_ci DEFAULT '',
  `is_active` BIT(1) DEFAULT 1,
  `is_deleted` BIT(1) DEFAULT 0,
  PRIMARY KEY USING BTREE (`item_type_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=3 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `locations` table : */

CREATE TABLE `locations` (
  `location_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `location_name` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT NULL,
  `is_deleted` BIT(1) DEFAULT 0,
  `is_active` BIT(1) DEFAULT 1,
  PRIMARY KEY USING BTREE (`location_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=13 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `messages` table : */

CREATE TABLE `messages` (
  `chat_id` INTEGER(11) NOT NULL,
  `user_id` INTEGER(11) DEFAULT NULL,
  `message` INTEGER(11) DEFAULT NULL,
  `date_posted` DATETIME DEFAULT NULL,
  `is_deleted` TINYINT(4) DEFAULT 0,
  PRIMARY KEY USING BTREE (`chat_id`)
) ENGINE=InnoDB
CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `order_status` table : */

CREATE TABLE `order_status` (
  `order_status_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `order_status` VARCHAR(75) COLLATE latin1_swedish_ci DEFAULT '',
  `order_description` VARCHAR(555) COLLATE latin1_swedish_ci DEFAULT '',
  `is_active` BIT(1) DEFAULT 1,
  `is_deleted` BIT(1) DEFAULT 0,
  PRIMARY KEY USING BTREE (`order_status_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=4 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `payable_payments` table : */

CREATE TABLE `payable_payments` (
  `payment_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `receipt_no` VARCHAR(75) COLLATE latin1_swedish_ci DEFAULT '',
  `supplier_id` BIGINT(20) DEFAULT 0,
  `journal_id` BIGINT(20) DEFAULT 0,
  `receipt_type` VARCHAR(55) COLLATE latin1_swedish_ci DEFAULT '',
  `department_id` BIGINT(20) DEFAULT 0,
  `payment_method_id` INTEGER(11) DEFAULT 0,
  `check_date_type` TINYINT(4) DEFAULT 1 COMMENT '1 is Date, 2 is PDC',
  `check_date` DATE DEFAULT '0000-00-00',
  `check_no` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT '',
  `remarks` VARCHAR(755) COLLATE latin1_swedish_ci DEFAULT '',
  `total_paid_amount` DECIMAL(20,2) DEFAULT 0.00,
  `date_paid` DATE DEFAULT '0000-00-00',
  `date_created` DATETIME DEFAULT '0000-00-00 00:00:00',
  `date_deleted` DATETIME DEFAULT '0000-00-00 00:00:00',
  `date_cancelled` DATETIME DEFAULT '0000-00-00 00:00:00',
  `cancelled_by_user` INTEGER(11) DEFAULT 0,
  `created_by_user` INTEGER(11) DEFAULT 0,
  `deleted_by_user` INTEGER(11) DEFAULT 0,
  `is_journal_posted` TINYINT(4) DEFAULT 0,
  `is_active` TINYINT(4) DEFAULT 1,
  `is_deleted` TINYINT(4) DEFAULT 0,
  `is_posted` TINYINT(4) DEFAULT 0,
  PRIMARY KEY USING BTREE (`payment_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `payable_payments_list` table : */

CREATE TABLE `payable_payments_list` (
  `payment_list_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `payment_id` BIGINT(20) DEFAULT 0,
  `dr_invoice_id` BIGINT(20) DEFAULT 0,
  `payable_amount` DECIMAL(20,2) DEFAULT 0.00,
  `payment_amount` DECIMAL(20,2) DEFAULT 0.00,
  PRIMARY KEY USING BTREE (`payment_list_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `payment_methods` table : */

CREATE TABLE `payment_methods` (
  `payment_method_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `payment_method` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT '',
  `is_active` BIT(1) DEFAULT 1,
  `is_deleted` BIT(1) DEFAULT 0,
  PRIMARY KEY USING BTREE (`payment_method_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=4 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `po_attachments` table : */

CREATE TABLE `po_attachments` (
  `po_attachment_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `purchase_order_id` BIGINT(20) DEFAULT 0,
  `orig_file_name` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT '',
  `server_file_directory` VARCHAR(800) COLLATE latin1_swedish_ci DEFAULT '',
  `date_added` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `added_by_user` INTEGER(11) DEFAULT 0,
  `is_deleted` TINYINT(4) DEFAULT 0,
  PRIMARY KEY USING BTREE (`po_attachment_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `po_messages` table : */

CREATE TABLE `po_messages` (
  `po_message_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `purchase_order_id` BIGINT(20) DEFAULT 0,
  `user_id` INTEGER(11) DEFAULT 0,
  `message` TEXT COLLATE latin1_swedish_ci,
  `date_posted` DATETIME DEFAULT '0000-00-00 00:00:00',
  `date_deleted` DATETIME DEFAULT '0000-00-00 00:00:00',
  `is_deleted` TINYINT(4) DEFAULT 0,
  PRIMARY KEY USING BTREE (`po_message_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `products` table : */

CREATE TABLE `products` (
  `product_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `product_code` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT '',
  `product_desc` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT '',
  `product_desc1` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT '',
  `unit` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT '',
  `size` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT '',
  `supplier_id` BIGINT(20) DEFAULT 0,
  `tax_type_id` BIGINT(20) DEFAULT 0,
  `refproduct_id` INTEGER(10) DEFAULT 0,
  `category_id` INTEGER(11) DEFAULT 0,
  `department_id` INTEGER(11) DEFAULT 0,
  `unit_id` INTEGER(11) DEFAULT 0,
  `equivalent_points` DECIMAL(20,2) DEFAULT 0.00,
  `product_warn` DECIMAL(16,2) DEFAULT 0.00,
  `product_ideal` DECIMAL(16,2) DEFAULT 0.00,
  `purchase_cost` DECIMAL(20,4) DEFAULT 0.0000,
  `purchase_cost_2` DECIMAL(20,4) DEFAULT 0.0000,
  `markup_percent` DECIMAL(16,4) DEFAULT 0.0000,
  `sale_price` DECIMAL(16,4) DEFAULT 0.0000,
  `whole_sale` DECIMAL(16,4) DEFAULT 0.0000,
  `retailer_price` DECIMAL(16,4) DEFAULT 0.0000,
  `special_disc` DECIMAL(16,4) DEFAULT 0.0000,
  `discounted_price` DECIMAL(16,4) DEFAULT 0.0000,
  `dealer_price` DECIMAL(16,4) DEFAULT 0.0000,
  `distributor_price` DECIMAL(16,4) DEFAULT 0.0000,
  `public_price` DECIMAL(16,4) DEFAULT 0.0000,
  `valued_customer` DECIMAL(16,4) DEFAULT 0.0000,
  `income_account_id` BIGINT(20) DEFAULT 0,
  `expense_account_id` BIGINT(20) DEFAULT 0,
  `on_hand` DECIMAL(20,2) DEFAULT 0.00,
  `item_type_id` INTEGER(11) DEFAULT 0,
  `date_created` DATETIME DEFAULT '0000-00-00 00:00:00',
  `date_modified` DATETIME DEFAULT '0000-00-00 00:00:00',
  `date_deleted` DATETIME DEFAULT '0000-00-00 00:00:00',
  `created_by_user` INTEGER(11) DEFAULT 0,
  `modified_by_user` INTEGER(11) DEFAULT 0,
  `deleted_by_user` INTEGER(11) DEFAULT 0,
  `is_inventory` TINYINT(4) DEFAULT 1,
  `is_tax_exempt` TINYINT(4) DEFAULT 0,
  `is_deleted` TINYINT(4) DEFAULT 0,
  `is_active` TINYINT(4) DEFAULT 1,
  PRIMARY KEY USING BTREE (`product_id`),
  UNIQUE KEY `product_code` USING BTREE (`product_code`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `purchase_order` table : */

CREATE TABLE `purchase_order` (
  `purchase_order_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `po_no` VARCHAR(75) COLLATE latin1_swedish_ci DEFAULT '',
  `terms` VARCHAR(55) COLLATE latin1_swedish_ci DEFAULT '',
  `duration` VARCHAR(55) COLLATE latin1_swedish_ci DEFAULT '',
  `deliver_to_address` VARCHAR(755) COLLATE latin1_swedish_ci DEFAULT '',
  `supplier_id` INTEGER(11) DEFAULT 0,
  `department_id` BIGINT(20) DEFAULT 0,
  `tax_type_id` INTEGER(11) DEFAULT 0,
  `contact_person` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT '',
  `remarks` VARCHAR(155) COLLATE latin1_swedish_ci DEFAULT '',
  `total_discount` DECIMAL(20,4) DEFAULT 0.0000,
  `total_before_tax` DECIMAL(20,4) DEFAULT 0.0000,
  `total_tax_amount` DECIMAL(20,4) DEFAULT 0.0000,
  `total_after_tax` DECIMAL(20,4) DEFAULT 0.0000,
  `approval_id` INTEGER(11) DEFAULT 2,
  `order_status_id` INTEGER(11) DEFAULT 1,
  `is_email_sent` TINYINT(4) DEFAULT 0,
  `is_active` TINYINT(4) DEFAULT 1,
  `is_deleted` TINYINT(4) DEFAULT 0,
  `date_created` DATETIME DEFAULT '0000-00-00 00:00:00',
  `date_modified` TIMESTAMP NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `date_deleted` DATETIME DEFAULT '0000-00-00 00:00:00',
  `date_approved` DATETIME DEFAULT '0000-00-00 00:00:00',
  `approved_by_user` INTEGER(11) DEFAULT 0,
  `posted_by_user` INTEGER(11) DEFAULT 0,
  `deleted_by_user` INTEGER(11) DEFAULT 0,
  `modified_by_user` INTEGER(11) DEFAULT 0,
  PRIMARY KEY USING BTREE (`purchase_order_id`),
  UNIQUE KEY `po_no` USING BTREE (`po_no`),
  UNIQUE KEY `po_no_2` USING BTREE (`po_no`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `purchase_order_items` table : */

CREATE TABLE `purchase_order_items` (
  `po_item_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `purchase_order_id` INTEGER(11) DEFAULT 0,
  `product_id` INTEGER(11) DEFAULT 0,
  `unit_id` INTEGER(11) DEFAULT 0,
  `po_price` DECIMAL(20,4) DEFAULT 0.0000,
  `po_discount` DECIMAL(20,4) DEFAULT 0.0000,
  `po_line_total_discount` DECIMAL(20,4) DEFAULT 0.0000,
  `po_tax_rate` DECIMAL(11,4) DEFAULT 0.0000,
  `po_qty` DECIMAL(20,0) DEFAULT 0,
  `po_line_total` DECIMAL(20,4) DEFAULT 0.0000,
  `tax_amount` DECIMAL(20,4) DEFAULT 0.0000,
  `non_tax_amount` DECIMAL(20,4) DEFAULT 0.0000,
  PRIMARY KEY USING BTREE (`po_item_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `refproduct` table : */

CREATE TABLE `refproduct` (
  `refproduct_id` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `product_type` VARCHAR(255) COLLATE latin1_swedish_ci NOT NULL,
  `description` VARCHAR(255) COLLATE latin1_swedish_ci NOT NULL,
  `created_by_user_id` INTEGER(11) NOT NULL,
  `modified_by_user_id` INTEGER(10) NOT NULL,
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` TINYINT(1) NOT NULL,
  PRIMARY KEY USING BTREE (`refproduct_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=4 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `requisition_info` table : */

CREATE TABLE `requisition_info` (
  `requisition_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `requisition_no` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT '',
  `department_id` INTEGER(11) DEFAULT 0,
  `purpose` VARCHAR(755) COLLATE latin1_swedish_ci DEFAULT '',
  `center_code` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT '',
  `fund_cluster` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT '',
  `remarks` VARCHAR(555) COLLATE latin1_swedish_ci DEFAULT '',
  `created_by_user` INTEGER(11) DEFAULT 0,
  `date_created` DATETIME DEFAULT '0000-00-00 00:00:00',
  `deleted_by_user` INTEGER(11) DEFAULT 0,
  `date_deleted` DATETIME DEFAULT '0000-00-00 00:00:00',
  `modified_by_user` INTEGER(11) DEFAULT 0,
  `date_modified` DATETIME DEFAULT '0000-00-00 00:00:00',
  `status` TINYINT(4) DEFAULT 1 COMMENT '0-closed, 1-open',
  `is_deleted` TINYINT(4) DEFAULT 0,
  `is_active` TINYINT(4) DEFAULT 1,
  PRIMARY KEY USING BTREE (`requisition_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `requisition_items` table : */

CREATE TABLE `requisition_items` (
  `req_item_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `requisition_id` BIGINT(20) DEFAULT 0,
  `product_id` INTEGER(11) DEFAULT 0,
  `unit_id` INTEGER(11) DEFAULT 0,
  `req_qty` DECIMAL(10,0) DEFAULT 0,
  `req_cost` DECIMAL(10,0) DEFAULT 0,
  `req_discount` DECIMAL(10,0) DEFAULT 0,
  `req_line_total_discount` DECIMAL(10,0) DEFAULT 0,
  `req_tax_rate` DECIMAL(10,0) DEFAULT 0,
  `req_line_total` DECIMAL(10,0) DEFAULT 0,
  `tax_amount` DECIMAL(10,0) DEFAULT 0,
  `non_tax_amount` DECIMAL(10,0) DEFAULT 0,
  `is_available` TINYINT(4) DEFAULT 1,
  PRIMARY KEY USING BTREE (`req_item_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `rights_links` table : */

CREATE TABLE `rights_links` (
  `link_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `parent_code` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT '',
  `link_code` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `link_name` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT '',
  `controller` VARCHAR(155) COLLATE latin1_swedish_ci DEFAULT '',
  PRIMARY KEY USING BTREE (`link_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=54 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `salesperson` table : */

CREATE TABLE `salesperson` (
  `salesperson_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `salesperson_code` VARCHAR(55) COLLATE latin1_swedish_ci DEFAULT NULL,
  `firstname` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `middlename` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `lastname` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `acr_name` VARCHAR(10) COLLATE latin1_swedish_ci DEFAULT NULL,
  `contact_no` VARCHAR(100) COLLATE latin1_swedish_ci NOT NULL,
  `department_id` INTEGER(2) NOT NULL,
  `tin_no` VARCHAR(100) COLLATE latin1_swedish_ci NOT NULL,
  `is_active` BIT(1) DEFAULT 1,
  `is_deleted` BIT(1) DEFAULT 0,
  `date_created` DATETIME DEFAULT '0000-00-00 00:00:00',
  `date_modified` TIMESTAMP NULL DEFAULT '0000-00-00 00:00:00',
  `posted_by_user` INTEGER(11) DEFAULT 0,
  PRIMARY KEY USING BTREE (`salesperson_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=3 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `supplier_photos` table : */

CREATE TABLE `supplier_photos` (
  `photo_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` INTEGER(11) DEFAULT 0,
  `photo_path` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`photo_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `suppliers` table : */

CREATE TABLE `suppliers` (
  `supplier_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `supplier_code` VARCHAR(125) COLLATE latin1_swedish_ci DEFAULT '',
  `supplier_name` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT '',
  `contact_name` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT '',
  `contact_person` VARCHAR(155) COLLATE latin1_swedish_ci DEFAULT '',
  `address` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT '',
  `email_address` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT '',
  `contact_no` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT '',
  `tin_no` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT '',
  `term` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT '',
  `tax_type_id` INTEGER(11) DEFAULT 1,
  `photo_path` VARCHAR(500) COLLATE latin1_swedish_ci DEFAULT '',
  `total_payable_amount` DECIMAL(19,2) DEFAULT 0.00,
  `posted_by_user` INTEGER(11) DEFAULT 0,
  `date_created` DATETIME DEFAULT '0000-00-00 00:00:00',
  `date_modified` DATETIME DEFAULT '0000-00-00 00:00:00',
  `credit_limit` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT NULL,
  `is_deleted` TINYINT(4) DEFAULT 0,
  `is_active` TINYINT(4) DEFAULT 1,
  PRIMARY KEY USING BTREE (`supplier_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `tax_types` table : */

CREATE TABLE `tax_types` (
  `tax_type_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `tax_type` VARCHAR(155) COLLATE latin1_swedish_ci DEFAULT '',
  `tax_rate` DECIMAL(11,2) DEFAULT 0.00,
  `description` VARCHAR(555) COLLATE latin1_swedish_ci DEFAULT '',
  `is_default` TINYINT(4) DEFAULT 0,
  `is_deleted` TINYINT(4) DEFAULT 0,
  PRIMARY KEY USING BTREE (`tax_type_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=3 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `units` table : */

CREATE TABLE `units` (
  `unit_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `unit_code` BIGINT(20) DEFAULT NULL,
  `unit_name` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT NULL,
  `unit_desc` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT NULL,
  `date_created` DATETIME DEFAULT NULL,
  `date_modified` TIMESTAMP NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` TINYINT(4) DEFAULT 0,
  `is_active` TINYINT(4) DEFAULT 1,
  PRIMARY KEY USING BTREE (`unit_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `user_accounts` table : */

CREATE TABLE `user_accounts` (
  `user_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT '',
  `user_pword` VARCHAR(500) COLLATE latin1_swedish_ci DEFAULT '',
  `user_lname` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT '',
  `user_fname` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT '',
  `user_mname` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT '',
  `user_address` VARCHAR(155) COLLATE latin1_swedish_ci DEFAULT '',
  `user_email` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT '',
  `user_mobile` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT '',
  `user_telephone` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT '',
  `user_bdate` DATE DEFAULT '0000-00-00',
  `user_group_id` INTEGER(11) DEFAULT 0,
  `photo_path` VARCHAR(555) COLLATE latin1_swedish_ci DEFAULT '',
  `file_directory` VARCHAR(666) COLLATE latin1_swedish_ci DEFAULT '',
  `is_active` TINYINT(4) DEFAULT 1,
  `is_deleted` TINYINT(4) DEFAULT 0,
  `date_created` DATETIME DEFAULT '0000-00-00 00:00:00',
  `date_modified` TIMESTAMP NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `date_deleted` INTEGER(11) DEFAULT 0,
  `modified_by_user` INTEGER(11) DEFAULT 0,
  `posted_by_user` INTEGER(11) DEFAULT 0,
  `deleted_by_user` INTEGER(11) DEFAULT 0,
  `is_online` TINYINT(4) DEFAULT 0,
  PRIMARY KEY USING BTREE (`user_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `user_group_rights` table : */

CREATE TABLE `user_group_rights` (
  `user_rights_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `user_group_id` INTEGER(11) DEFAULT 0,
  `link_code` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT '',
  PRIMARY KEY USING BTREE (`user_rights_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `user_groups` table : */

CREATE TABLE `user_groups` (
  `user_group_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `user_group` VARCHAR(135) COLLATE latin1_swedish_ci DEFAULT '',
  `user_group_desc` VARCHAR(500) COLLATE latin1_swedish_ci DEFAULT '',
  `is_active` TINYINT(4) DEFAULT 1,
  `is_deleted` TINYINT(4) DEFAULT 0,
  `date_created` DATETIME DEFAULT '0000-00-00 00:00:00',
  `date_modified` TIMESTAMP NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY USING BTREE (`user_group_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Data for the `approval_status` table  (LIMIT 0,500) */

INSERT INTO `approval_status` (`approval_id`, `approval_status`, `approval_description`, `is_active`, `is_deleted`) VALUES
  (1,'Approved','',1,0),
  (2,'Pending','',1,0);
COMMIT;

/* Data for the `chat` table  (LIMIT 0,500) */

INSERT INTO `chat` (`chat_id`, `chat_code`, `message`, `from_user_id`, `date_created`, `date_deleted`, `is_deleted`) VALUES
  (1,'User1:User12','test',1,'2017-05-02 16:57:21',NULL,0),
  (2,'User1:User10','Hey !',1,'2017-05-02 16:58:06',NULL,0),
  (3,'User1:User12','I still tried',1,'2017-05-02 16:58:43',NULL,0),
  (4,'User12:User1','oy',12,'2017-05-02 18:01:37',NULL,0),
  (5,'User1:User12','nanu',1,'2017-05-02 18:01:57',NULL,0),
  (6,'User1:User12','hahaha',1,'2017-05-02 18:02:12',NULL,0),
  (7,'User12:User1',',,l,,',12,'2017-05-02 18:03:31',NULL,0),
  (8,'User12:User1','l',12,'2017-05-02 18:03:34',NULL,0),
  (9,'User12:User1','l',12,'2017-05-02 18:03:35',NULL,0),
  (10,'User1:User12','pakyu ka rin ',1,'2017-05-02 18:03:38',NULL,0),
  (11,'User1:User31','Hello',1,'2017-05-02 18:08:13',NULL,0),
  (12,'User31:User1','Hello also',31,'2017-05-02 18:08:58',NULL,0),
  (13,'User1:User12','h',1,'2017-05-02 21:12:59',NULL,0),
  (14,'User1:User12','h',1,'2017-05-02 21:13:01',NULL,0),
  (15,'User1:User12','h',1,'2017-05-02 21:13:03',NULL,0),
  (16,'User1:User12','f',1,'2017-05-02 21:13:05',NULL,0),
  (17,'User1:User12','f',1,'2017-05-02 21:13:05',NULL,0),
  (18,'User1:User12','f',1,'2017-05-02 21:13:07',NULL,0),
  (19,'User1:User12','f',1,'2017-05-02 21:13:09',NULL,0),
  (20,'User1:User12','f',1,'2017-05-02 21:13:09',NULL,0),
  (21,'User1:User12','a',1,'2017-05-02 21:13:13',NULL,0),
  (22,'User1:User12','a',1,'2017-05-02 21:13:15',NULL,0),
  (23,'User1:User12','a',1,'2017-05-02 21:13:17',NULL,0),
  (24,'User1:User30','Miyong !!!',1,'2017-05-02 21:14:27',NULL,0),
  (25,'User1:User12','hey',1,'2017-05-10 12:18:49',NULL,0);
COMMIT;

/* Data for the `company_info` table  (LIMIT 0,500) */

INSERT INTO `company_info` (`company_id`, `company_name`, `company_address`, `email_address`, `mobile_no`, `landline`, `tin_no`, `tax_type_id`, `registered_to`, `logo_path`) VALUES
  (1,'National Economic and Development Authority Regional Office III','Diosdado Macapagal Government Center, Maimpis, City of San Fernando, Pampanga','nedaregion3@gmail.com','0935-746-7611','(045) 322-3542','1234-5678-91112',2,'','assets/img/company/598fd89a4c6c1.jpg');
COMMIT;

/* Data for the `item_types` table  (LIMIT 0,500) */

INSERT INTO `item_types` (`item_type_id`, `item_type`, `description`, `is_active`, `is_deleted`) VALUES
  (1,'Inventory','',1,0),
  (2,'Non-inventory','',1,0);
COMMIT;

/* Data for the `locations` table  (LIMIT 0,500) */

INSERT INTO `locations` (`location_id`, `location_name`, `is_deleted`, `is_active`) VALUES
  (1,'DAU',0,1),
  (2,'ANGELES',0,1),
  (3,'Test',0,1),
  (4,'dddd',0,1),
  (5,'sss',0,1),
  (6,'zzz',0,1),
  (7,'bbb',0,1),
  (8,'sasss',0,1),
  (9,'vvvv',0,1),
  (10,'bbbb',0,1),
  (11,'nnn',0,1),
  (12,'Manila, Philippines',0,1);
COMMIT;

/* Data for the `order_status` table  (LIMIT 0,500) */

INSERT INTO `order_status` (`order_status_id`, `order_status`, `order_description`, `is_active`, `is_deleted`) VALUES
  (1,'Open','',1,0),
  (2,'Closed','',1,0),
  (3,'Partially received','',1,0);
COMMIT;

/* Data for the `payment_methods` table  (LIMIT 0,500) */

INSERT INTO `payment_methods` (`payment_method_id`, `payment_method`, `is_active`, `is_deleted`) VALUES
  (1,'Cash',1,0),
  (2,'Check',1,0),
  (3,'Card',1,0);
COMMIT;

/* Data for the `refproduct` table  (LIMIT 0,500) */

INSERT INTO `refproduct` (`refproduct_id`, `product_type`, `description`, `created_by_user_id`, `modified_by_user_id`, `date_created`, `date_modified`, `is_deleted`) VALUES
  (1,'Companion Animals','Common house pets',0,0,'2017-04-03 10:53:40','0000-00-00 00:00:00',0),
  (2,'Livestock Animals','Farm animals',0,0,'2017-04-03 10:53:40','0000-00-00 00:00:00',0),
  (3,'All Product type','',0,0,'2017-04-03 10:53:40','0000-00-00 00:00:00',0);
COMMIT;

/* Data for the `rights_links` table  (LIMIT 0,500) */

INSERT INTO `rights_links` (`link_id`, `parent_code`, `link_code`, `link_name`, `controller`) VALUES
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
  (53,'8','8-2','Supplies and Materials Issued Report','Supplies_issued');
COMMIT;

/* Data for the `salesperson` table  (LIMIT 0,500) */

INSERT INTO `salesperson` (`salesperson_id`, `salesperson_code`, `firstname`, `middlename`, `lastname`, `acr_name`, `contact_no`, `department_id`, `tin_no`, `is_active`, `is_deleted`, `date_created`, `date_modified`, `posted_by_user`) VALUES
  (1,'ssss','sss','sss','sss',NULL,'',2,'',1,0,'2017-06-16 13:59:40','0000-00-00 00:00:00',12),
  (2,'1211','d','d','d',NULL,'d',1,'121',1,0,'2017-06-16 15:34:56','0000-00-00 00:00:00',12);
COMMIT;

/* Data for the `tax_types` table  (LIMIT 0,500) */

INSERT INTO `tax_types` (`tax_type_id`, `tax_type`, `tax_rate`, `description`, `is_default`, `is_deleted`) VALUES
  (1,'Non-vat',0.00,'',0,0),
  (2,'Vatted',12.00,'',1,0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;