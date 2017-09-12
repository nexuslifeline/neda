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
AUTO_INCREMENT=2 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
AUTO_INCREMENT=3 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
  `is_deleted` BIT(1) DEFAULT 0,
  `is_active` BIT(1) DEFAULT 1,
  PRIMARY KEY USING BTREE (`category_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=12 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
  `is_active` BIT(1) DEFAULT 1,
  `is_deleted` BIT(1) DEFAULT 0,
  `is_paid` BIT(1) DEFAULT 0,
  `is_journal_posted` BIT(1) DEFAULT 0,
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
AUTO_INCREMENT=6 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
AUTO_INCREMENT=8 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
  `is_deleted` BIT(1) DEFAULT 0,
  `is_active` BIT(1) DEFAULT 1,
  PRIMARY KEY USING BTREE (`department_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=4 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `issuance_info` table : */

CREATE TABLE `issuance_info` (
  `issuance_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `slip_no` VARCHAR(75) COLLATE latin1_swedish_ci DEFAULT '',
  `issued_department_id` INTEGER(11) DEFAULT 0,
  `remarks` VARCHAR(755) COLLATE latin1_swedish_ci DEFAULT '',
  `issued_to_person` VARCHAR(155) COLLATE latin1_swedish_ci DEFAULT '',
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
  `is_active` BIT(1) DEFAULT 1,
  `is_deleted` BIT(1) DEFAULT 0,
  `customer_id` INTEGER(11) DEFAULT NULL,
  `address` VARCHAR(150) COLLATE latin1_swedish_ci DEFAULT NULL,
  `terms` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`issuance_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=3 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
AUTO_INCREMENT=3 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
AUTO_INCREMENT=4 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
  `is_journal_posted` BIT(1) DEFAULT 0,
  `is_active` BIT(1) DEFAULT 1,
  `is_deleted` BIT(1) DEFAULT 0,
  `is_posted` BIT(1) DEFAULT 0,
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
  `is_deleted` BIT(1) DEFAULT 0,
  PRIMARY KEY USING BTREE (`po_attachment_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=28 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `po_messages` table : */

CREATE TABLE `po_messages` (
  `po_message_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `purchase_order_id` BIGINT(20) DEFAULT 0,
  `user_id` INTEGER(11) DEFAULT 0,
  `message` TEXT COLLATE latin1_swedish_ci,
  `date_posted` DATETIME DEFAULT '0000-00-00 00:00:00',
  `date_deleted` DATETIME DEFAULT '0000-00-00 00:00:00',
  `is_deleted` BIT(1) DEFAULT 0,
  PRIMARY KEY USING BTREE (`po_message_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=112 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
  `is_inventory` BIT(1) DEFAULT 1,
  `is_tax_exempt` BIT(1) DEFAULT 0,
  `is_deleted` BIT(1) DEFAULT 0,
  `is_active` BIT(1) DEFAULT 1,
  PRIMARY KEY USING BTREE (`product_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=6 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
  `is_email_sent` BIT(1) DEFAULT 0,
  `is_active` BIT(1) DEFAULT 1,
  `is_deleted` BIT(1) DEFAULT 0,
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
AUTO_INCREMENT=5 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
AUTO_INCREMENT=8 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
AUTO_INCREMENT=8 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
  PRIMARY KEY USING BTREE (`req_item_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=17 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `rights_links` table : */

CREATE TABLE `rights_links` (
  `link_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `parent_code` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT '',
  `link_code` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `link_name` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT '',
  PRIMARY KEY USING BTREE (`link_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=52 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
  `is_deleted` BIT(1) DEFAULT 0,
  `is_active` BIT(1) DEFAULT 1,
  PRIMARY KEY USING BTREE (`supplier_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=4 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `tax_types` table : */

CREATE TABLE `tax_types` (
  `tax_type_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `tax_type` VARCHAR(155) COLLATE latin1_swedish_ci DEFAULT '',
  `tax_rate` DECIMAL(11,2) DEFAULT 0.00,
  `description` VARCHAR(555) COLLATE latin1_swedish_ci DEFAULT '',
  `is_default` BIT(1) DEFAULT 0,
  `is_deleted` BIT(1) DEFAULT 0,
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
  `is_deleted` BIT(1) DEFAULT 0,
  `is_active` BIT(1) DEFAULT 1,
  PRIMARY KEY USING BTREE (`unit_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=5 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
  `is_active` BIT(1) DEFAULT 1,
  `is_deleted` BIT(1) DEFAULT 0,
  `date_created` DATETIME DEFAULT '0000-00-00 00:00:00',
  `date_modified` TIMESTAMP NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `date_deleted` INTEGER(11) DEFAULT 0,
  `modified_by_user` INTEGER(11) DEFAULT 0,
  `posted_by_user` INTEGER(11) DEFAULT 0,
  `deleted_by_user` INTEGER(11) DEFAULT 0,
  `is_online` TINYINT(4) DEFAULT 0,
  PRIMARY KEY USING BTREE (`user_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=34 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `user_group_rights` table : */

CREATE TABLE `user_group_rights` (
  `user_rights_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `user_group_id` INTEGER(11) DEFAULT 0,
  `link_code` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT '',
  PRIMARY KEY USING BTREE (`user_rights_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=234 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `user_groups` table : */

CREATE TABLE `user_groups` (
  `user_group_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `user_group` VARCHAR(135) COLLATE latin1_swedish_ci DEFAULT '',
  `user_group_desc` VARCHAR(500) COLLATE latin1_swedish_ci DEFAULT '',
  `is_active` BIT(1) DEFAULT 1,
  `is_deleted` BIT(1) DEFAULT 0,
  `date_created` DATETIME DEFAULT '0000-00-00 00:00:00',
  `date_modified` TIMESTAMP NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY USING BTREE (`user_group_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=9 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Data for the `adjustment_info` table  (LIMIT 0,500) */

INSERT INTO `adjustment_info` (`adjustment_id`, `adjustment_code`, `department_id`, `remarks`, `adjustment_type`, `total_discount`, `total_before_tax`, `total_after_tax`, `total_tax_amount`, `date_adjusted`, `date_created`, `date_modified`, `date_deleted`, `posted_by_user`, `modified_by_user`, `deleted_by_user`, `is_active`, `is_deleted`) VALUES
  (1,'ADJ-20170817-1',1,'ddd','OUT',0.00,1000.00,1000.00,0.00,'2017-08-17','2017-08-17 21:27:44','2017-08-17 21:28:02',NULL,1,1,0,1,0);
COMMIT;

/* Data for the `adjustment_items` table  (LIMIT 0,500) */

INSERT INTO `adjustment_items` (`adjustment_item_id`, `adjustment_id`, `product_id`, `unit_id`, `adjust_qty`, `adjust_price`, `adjust_discount`, `adjust_tax_rate`, `adjust_line_total_price`, `adjust_line_total_discount`, `adjust_tax_amount`, `adjust_non_tax_amount`, `exp_date`, `batch_no`) VALUES
  (2,1,1,3,2,500.0000,0.0000,0.0000,1000.0000,0.0000,0.0000,1000.0000,'0000-00-00','');
COMMIT;

/* Data for the `approval_status` table  (LIMIT 0,500) */

INSERT INTO `approval_status` (`approval_id`, `approval_status`, `approval_description`, `is_active`, `is_deleted`) VALUES
  (1,'Approved','',1,0),
  (2,'Pending','',1,0);
COMMIT;

/* Data for the `categories` table  (LIMIT 0,500) */

INSERT INTO `categories` (`category_id`, `category_code`, `category_name`, `category_desc`, `date_created`, `date_modified`, `is_deleted`, `is_active`) VALUES
  (1,NULL,'Food Stock','',NULL,'0000-00-00 00:00:00',0,1),
  (2,NULL,'DESSERTS','',NULL,'0000-00-00 00:00:00',0,1),
  (3,NULL,'POULTRY','',NULL,'0000-00-00 00:00:00',0,1),
  (4,NULL,'NOODLES','',NULL,'0000-00-00 00:00:00',0,1),
  (5,NULL,'Machine','Machine',NULL,'0000-00-00 00:00:00',0,1),
  (6,NULL,'Test','',NULL,'0000-00-00 00:00:00',0,1),
  (7,NULL,'Office Supplies','',NULL,'0000-00-00 00:00:00',0,1),
  (8,NULL,'Computers','',NULL,'0000-00-00 00:00:00',0,1),
  (9,NULL,'xx','xx',NULL,'0000-00-00 00:00:00',0,1),
  (10,NULL,'xx','xx',NULL,'0000-00-00 00:00:00',0,1),
  (11,NULL,'category','1',NULL,'0000-00-00 00:00:00',0,1);
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

/* Data for the `delivery_invoice` table  (LIMIT 0,500) */

INSERT INTO `delivery_invoice` (`dr_invoice_id`, `dr_invoice_no`, `purchase_order_id`, `external_ref_no`, `contact_person`, `terms`, `duration`, `supplier_id`, `department_id`, `tax_type_id`, `journal_id`, `remarks`, `total_discount`, `total_before_tax`, `total_tax_amount`, `total_after_tax`, `is_active`, `is_deleted`, `is_paid`, `is_journal_posted`, `date_due`, `date_delivered`, `date_created`, `date_modified`, `date_deleted`, `posted_by_user`, `modified_by_user`, `deleted_by_user`, `batch_no`) VALUES
  (1,'P-INV-20170817-1',0,'','SH','','',2,1,1,0,'',0.0000,50000.0000,0.0000,50000.0000,1,0,0,0,'2017-08-17','2017-08-17','2017-08-17 21:17:09','2017-08-20 09:48:12','0000-00-00 00:00:00',1,1,0,NULL),
  (2,'P-INV-20170820-2',1,'','','','',1,1,NULL,0,'da',0.0000,1000.0000,0.0000,1000.0000,1,0,0,0,'2017-08-20','2017-08-20','2017-08-20 10:02:12','2017-08-20 10:02:13','0000-00-00 00:00:00',1,0,0,NULL),
  (3,'P-INV-20170824-3',4,'','','60','',3,2,NULL,0,'',0.0000,25.0000,0.0000,25.0000,1,0,0,0,'2017-08-24','2017-08-24','2017-08-24 19:34:15','2017-08-24 19:34:15','0000-00-00 00:00:00',1,0,0,NULL),
  (4,'P-INV-20170824-4',4,'','','60','',3,2,NULL,0,'',0.0000,25.0000,0.0000,25.0000,1,0,0,0,'2017-08-24','2017-08-24','2017-08-24 19:35:21','2017-08-24 19:35:21','0000-00-00 00:00:00',1,0,0,NULL),
  (5,'P-INV-20170824-5',0,'','na','','',3,3,2,0,'',0.0000,700.0000,0.0000,700.0000,1,0,0,0,'2017-08-24','2017-08-24','2017-08-24 20:01:12','2017-08-24 20:01:12','0000-00-00 00:00:00',1,0,0,NULL);
COMMIT;

/* Data for the `delivery_invoice_items` table  (LIMIT 0,500) */

INSERT INTO `delivery_invoice_items` (`dr_invoice_item_id`, `dr_invoice_id`, `product_id`, `unit_id`, `dr_qty`, `dr_discount`, `dr_price`, `dr_line_total_discount`, `dr_line_total_price`, `dr_tax_rate`, `dr_tax_amount`, `dr_non_tax_amount`, `exp_date`, `batch_no`) VALUES
  (2,1,1,3,99,0.0000,500.0000,0.0000,49500.0000,0.0000,0.0000,49500.0000,'1970-01-01',NULL),
  (3,1,1,3,1,0.0000,500.0000,0.0000,500.0000,0.0000,0.0000,500.0000,'1970-01-01',NULL),
  (4,2,1,3,2,0.0000,500.0000,0.0000,1000.0000,0.0000,0.0000,1000.0000,'1970-01-01',NULL),
  (5,3,2,4,5,0.0000,5.0000,0.0000,25.0000,0.0000,0.0000,25.0000,'1970-01-01',NULL),
  (6,4,2,4,5,0.0000,5.0000,0.0000,25.0000,0.0000,0.0000,25.0000,'1970-01-01',NULL),
  (7,5,1,3,2,0.0000,350.0000,0.0000,700.0000,0.0000,0.0000,700.0000,'1970-01-01',NULL);
COMMIT;

/* Data for the `departments` table  (LIMIT 0,500) */

INSERT INTO `departments` (`department_id`, `department_code`, `department_name`, `department_desc`, `delivery_address`, `default_cost`, `date_created`, `date_modified`, `is_deleted`, `is_active`) VALUES
  (1,'','Admin','',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,1),
  (2,'','IT Deparment','',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,1),
  (3,'','Kitchen','Kitchen',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,1);
COMMIT;

/* Data for the `issuance_info` table  (LIMIT 0,500) */

INSERT INTO `issuance_info` (`issuance_id`, `slip_no`, `issued_department_id`, `remarks`, `issued_to_person`, `total_discount`, `total_before_tax`, `total_tax_amount`, `total_after_tax`, `date_issued`, `date_created`, `date_modified`, `date_deleted`, `modified_by_user`, `posted_by_user`, `deleted_by_user`, `is_active`, `is_deleted`, `customer_id`, `address`, `terms`) VALUES
  (1,'SLP-20170817-1',1,'dd','',0.00,0.00,0.00,0.00,'2017-08-17','2017-08-17 21:19:20','2017-08-17 21:19:20','0000-00-00 00:00:00',0,1,0,1,0,NULL,NULL,'1111'),
  (2,'SLP-20170824-2',3,'','',0.00,0.00,0.00,0.00,'2017-08-24','2017-08-24 20:04:33','2017-08-24 20:04:33','0000-00-00 00:00:00',0,1,0,1,0,NULL,NULL,'g');
COMMIT;

/* Data for the `issuance_items` table  (LIMIT 0,500) */

INSERT INTO `issuance_items` (`issuance_item_id`, `issuance_id`, `product_id`, `unit_id`, `issue_qty`, `issue_price`, `issue_discount`, `issue_tax_rate`, `issue_line_total_price`, `issue_line_total_discount`, `issue_tax_amount`, `issue_non_tax_amount`, `dr_invoice_id`, `exp_date`, `batch_no`) VALUES
  (1,1,1,3,1.00,500.00,0.00,0.00,500.00,0.00,0.00,500.00,0,'0000-00-00',''),
  (2,2,1,3,2.00,500.00,0.00,0.00,1000.00,0.00,0.00,1000.00,0,'0000-00-00','');
COMMIT;

/* Data for the `item_types` table  (LIMIT 0,500) */

INSERT INTO `item_types` (`item_type_id`, `item_type`, `description`, `is_active`, `is_deleted`) VALUES
  (1,'Inventory','',1,0),
  (2,'Non-inventory','',1,0),
  (3,'Services','',1,0);
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

/* Data for the `po_attachments` table  (LIMIT 0,500) */

INSERT INTO `po_attachments` (`po_attachment_id`, `purchase_order_id`, `orig_file_name`, `server_file_directory`, `date_added`, `added_by_user`, `is_deleted`) VALUES
  (12,1,'Desert.jpg','assets/files/po/attachments/57a35f49a1d20.jpg','2016-08-04 15:29:13',1,0),
  (13,1,'desktop.ini','assets/files/po/attachments/57a35f595fa24.ini','2016-08-04 15:29:29',10,0),
  (14,1,'Koala.jpg','assets/files/po/attachments/57a36038bc160.jpg','2016-08-04 15:33:12',1,0),
  (15,1,'Desert.jpg','assets/files/po/attachments/57a36735f2623.jpg','2016-08-04 16:03:01',1,0),
  (16,1,'Hydrangeas.jpg','assets/files/po/attachments/57a3674c76975.jpg','2016-08-04 16:03:24',1,0),
  (17,2,'Chrysanthemum.jpg','assets/files/po/attachments/57a3efd452bb6.jpg','2016-08-05 01:45:56',1,0),
  (18,2,'Desert.jpg','assets/files/po/attachments/57a3efd460291.jpg','2016-08-05 01:45:56',1,0),
  (19,2,'Lighthouse.jpg','assets/files/po/attachments/57a3efd46e90c.jpg','2016-08-05 01:45:56',1,0),
  (20,2,'Penguins.jpg','assets/files/po/attachments/57a3efd47b42f.jpg','2016-08-05 01:45:56',1,0),
  (21,4,'desktop.ini','assets/files/po/attachments/57a3fc8a14119.ini','2016-08-05 02:40:10',1,0),
  (22,5,'Desert.jpg','assets/files/po/attachments/57a4b2fe12d70.jpg','2016-08-05 15:38:38',1,0),
  (23,6,'Desert.jpg','assets/files/po/attachments/57a5011cef3fc.jpg','2016-08-05 21:11:56',10,0),
  (24,1,'Tulips.jpg','assets/files/po/attachments/57acc3463da99.jpg','2016-08-11 18:26:14',1,0),
  (25,5,'Chrysanthemum.jpg','assets/files/po/attachments/57ad049e86444.jpg','2016-08-11 23:05:02',1,0),
  (26,1,'desktop.ini','assets/files/po/attachments/57af336b9a9ec.ini','2016-08-13 14:49:15',1,0),
  (27,1,'Tulips.jpg','assets/files/po/attachments/57e32f8d94f64.jpg','2016-09-22 01:10:37',10,0);
COMMIT;

/* Data for the `po_messages` table  (LIMIT 0,500) */

INSERT INTO `po_messages` (`po_message_id`, `purchase_order_id`, `user_id`, `message`, `date_posted`, `date_deleted`, `is_deleted`) VALUES
  (51,1,1,'hi','2016-08-04 08:28:55','2016-08-04 08:58:40',1),
  (52,1,10,'hello','2016-08-04 08:29:01','2016-08-04 09:27:35',1),
  (53,4,1,'please send me attachment.','2016-08-04 08:31:32','2016-08-04 19:40:42',1),
  (54,1,1,'ji','2016-08-04 08:44:39','2016-08-04 08:55:38',1),
  (55,1,1,'k','2016-08-04 08:46:24','2016-08-04 08:55:12',1),
  (56,1,1,'l','2016-08-04 08:47:39','2016-08-04 08:54:12',1),
  (57,1,1,'hi','2016-08-04 08:59:55','2016-08-04 08:59:58',1),
  (58,1,1,'k','2016-08-04 09:00:19','2016-08-04 09:00:22',1),
  (59,1,1,'love','2016-08-04 09:00:28','2016-08-04 09:00:30',1),
  (60,1,1,'hello','2016-08-04 09:14:28','0000-00-00 00:00:00',0),
  (61,1,1,'please send me new attachments.','2016-08-04 09:18:15','0000-00-00 00:00:00',0),
  (62,1,1,'kk\\','2016-08-04 09:25:32','2016-08-04 09:25:46',1),
  (63,1,1,'kk','2016-08-04 09:25:33','2016-08-04 09:25:43',1),
  (64,1,1,'hi','2016-08-04 09:26:46','0000-00-00 00:00:00',0),
  (65,1,10,'im busy.','2016-08-04 09:27:02','2016-08-04 09:27:30',1),
  (66,2,1,'hi','2016-08-04 18:48:42','0000-00-00 00:00:00',0),
  (67,2,1,'kindly send me attachment.','2016-08-04 18:49:41','2016-09-12 12:42:15',1),
  (68,4,1,'hello','2016-08-04 19:40:29','0000-00-00 00:00:00',0),
  (69,5,1,'please send me attachment.','2016-08-05 08:39:01','0000-00-00 00:00:00',0),
  (70,6,1,'please send attachment.','2016-08-05 14:10:48','0000-00-00 00:00:00',0),
  (71,6,10,'yes sir. already attached.','2016-08-05 14:12:24','0000-00-00 00:00:00',0),
  (72,6,10,'hi','2016-08-05 14:20:30','0000-00-00 00:00:00',0),
  (73,5,1,'please','2016-08-06 17:04:12','0000-00-00 00:00:00',0),
  (74,1,1,'testing','2016-08-11 11:24:13','0000-00-00 00:00:00',0),
  (75,1,1,'hello','2016-08-11 11:27:12','0000-00-00 00:00:00',0),
  (76,5,10,'please send me attachment.','2016-08-11 16:04:27','0000-00-00 00:00:00',0),
  (77,5,1,'yes sir.','2016-08-11 16:04:44','0000-00-00 00:00:00',0),
  (78,1,1,'hi','2016-08-13 07:49:02','0000-00-00 00:00:00',0),
  (79,2,1,'','2016-09-12 12:42:09','2016-09-12 12:42:13',1),
  (80,2,1,'please send me attachment.','2016-09-12 15:50:10','0000-00-00 00:00:00',0),
  (81,1,10,'hello','2016-09-21 18:10:13','0000-00-00 00:00:00',0),
  (82,28,1,'123456hello','2016-12-05 14:43:13','0000-00-00 00:00:00',0),
  (83,28,1,'123456hello','2016-12-05 14:43:14','0000-00-00 00:00:00',0),
  (84,28,1,'','2016-12-05 14:43:14','0000-00-00 00:00:00',0),
  (85,28,1,'','2016-12-05 14:43:14','0000-00-00 00:00:00',0),
  (86,28,1,'','2016-12-05 14:43:14','0000-00-00 00:00:00',0),
  (87,28,1,'','2016-12-05 14:43:14','0000-00-00 00:00:00',0),
  (88,28,1,'','2016-12-05 14:43:15','0000-00-00 00:00:00',0),
  (89,28,1,' ','2016-12-05 14:43:30','0000-00-00 00:00:00',0),
  (90,28,1,'','2016-12-05 14:43:31','0000-00-00 00:00:00',0),
  (91,28,1,'','2016-12-05 14:43:31','0000-00-00 00:00:00',0),
  (92,28,1,'','2016-12-05 14:43:31','0000-00-00 00:00:00',0),
  (93,28,1,'','2016-12-05 14:43:31','0000-00-00 00:00:00',0),
  (94,28,1,'','2016-12-05 14:43:31','0000-00-00 00:00:00',0),
  (95,28,1,'','2016-12-05 14:43:31','0000-00-00 00:00:00',0),
  (96,28,1,'','2016-12-05 14:43:32','0000-00-00 00:00:00',0),
  (97,28,1,'','2016-12-05 14:43:32','0000-00-00 00:00:00',0),
  (98,28,1,'','2016-12-05 14:43:32','0000-00-00 00:00:00',0),
  (99,28,1,'','2016-12-05 14:43:32','0000-00-00 00:00:00',0),
  (100,28,1,'','2016-12-05 14:43:32','0000-00-00 00:00:00',0),
  (101,28,1,'','2016-12-05 14:43:32','0000-00-00 00:00:00',0),
  (102,28,1,'','2016-12-05 14:43:32','0000-00-00 00:00:00',0),
  (103,28,1,'','2016-12-05 14:43:33','0000-00-00 00:00:00',0),
  (104,28,1,'','2016-12-05 14:43:33','0000-00-00 00:00:00',0),
  (105,28,1,'','2016-12-05 14:43:33','0000-00-00 00:00:00',0),
  (106,28,1,'','2016-12-05 14:43:33','0000-00-00 00:00:00',0),
  (107,28,1,'','2016-12-05 14:43:33','0000-00-00 00:00:00',0),
  (108,29,1,'Hello','2016-12-14 11:38:54','0000-00-00 00:00:00',0),
  (109,1,1,'hi','2017-04-26 16:43:25','0000-00-00 00:00:00',0),
  (110,1,1,'hello','2017-04-26 16:43:39','0000-00-00 00:00:00',0),
  (111,4,1,'hello','2017-08-24 20:10:44','0000-00-00 00:00:00',0);
COMMIT;

/* Data for the `products` table  (LIMIT 0,500) */

INSERT INTO `products` (`product_id`, `product_code`, `product_desc`, `product_desc1`, `unit`, `size`, `supplier_id`, `tax_type_id`, `refproduct_id`, `category_id`, `department_id`, `unit_id`, `equivalent_points`, `product_warn`, `product_ideal`, `purchase_cost`, `purchase_cost_2`, `markup_percent`, `sale_price`, `whole_sale`, `retailer_price`, `special_disc`, `discounted_price`, `dealer_price`, `distributor_price`, `public_price`, `valued_customer`, `income_account_id`, `expense_account_id`, `on_hand`, `item_type_id`, `date_created`, `date_modified`, `date_deleted`, `created_by_user`, `modified_by_user`, `deleted_by_user`, `is_inventory`, `is_tax_exempt`, `is_deleted`, `is_active`) VALUES
  (1,'1000','Bond Paper','','',NULL,NULL,1,NULL,7,0,3,0.00,0.00,0.00,500.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,99.00,1,'2017-08-13 13:57:49','2017-08-24 20:00:18','0000-00-00 00:00:00',1,1,0,1,0,0,1),
  (2,'1002','Ballpen','','',NULL,NULL,1,NULL,7,0,4,0.00,0.00,0.00,5.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,10.00,1,'2017-08-24 19:05:15','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,1,0,0,1),
  (3,'1002','Folder','','',NULL,NULL,1,NULL,7,0,4,0.00,0.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.00,1,'2017-08-24 19:07:06','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,1,0,0,1),
  (4,'1002','f','','',NULL,NULL,1,NULL,1,0,1,0.00,0.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.00,1,'2017-08-24 19:14:55','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,1,0,0,1),
  (5,'222','hhh','','',NULL,NULL,1,NULL,2,0,1,0.00,0.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.00,1,'2017-08-24 19:15:45','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,1,0,0,1);
COMMIT;

/* Data for the `purchase_order` table  (LIMIT 0,500) */

INSERT INTO `purchase_order` (`purchase_order_id`, `po_no`, `terms`, `duration`, `deliver_to_address`, `supplier_id`, `department_id`, `tax_type_id`, `contact_person`, `remarks`, `total_discount`, `total_before_tax`, `total_tax_amount`, `total_after_tax`, `approval_id`, `order_status_id`, `is_email_sent`, `is_active`, `is_deleted`, `date_created`, `date_modified`, `date_deleted`, `date_approved`, `approved_by_user`, `posted_by_user`, `deleted_by_user`, `modified_by_user`) VALUES
  (1,'PO-20170817-1','',NULL,'San Jose, San Simon, Pampanga',1,1,1,'','da',0.0000,1000.0000,0.0000,1000.0000,2,2,0,1,0,'2017-08-17 20:45:39','2017-08-20 10:02:13','0000-00-00 00:00:00','0000-00-00 00:00:00',0,1,0,0),
  (2,'PO-20170819-2','',NULL,'San Jose, San Simon, Pampanga',3,2,1,'','',0.0000,850000.0000,0.0000,850000.0000,2,1,0,1,0,'2017-08-19 09:05:24','2017-08-19 11:30:56','0000-00-00 00:00:00','0000-00-00 00:00:00',0,1,0,1),
  (3,'PO-20170819-3','',NULL,'San Fernando Pampanga',2,1,2,'','',0.0000,50000.0000,0.0000,50000.0000,2,1,0,1,0,'2017-08-19 11:00:59','2017-08-19 11:00:59','0000-00-00 00:00:00','0000-00-00 00:00:00',0,1,0,0),
  (4,'PO-20170824-4','60',NULL,'san fernando',3,2,2,'','',0.0000,50.0000,0.0000,50.0000,2,2,0,1,0,'2017-08-24 19:30:25','2017-08-24 19:35:21','0000-00-00 00:00:00','0000-00-00 00:00:00',0,1,0,0);
COMMIT;

/* Data for the `purchase_order_items` table  (LIMIT 0,500) */

INSERT INTO `purchase_order_items` (`po_item_id`, `purchase_order_id`, `product_id`, `unit_id`, `po_price`, `po_discount`, `po_line_total_discount`, `po_tax_rate`, `po_qty`, `po_line_total`, `tax_amount`, `non_tax_amount`) VALUES
  (1,1,1,3,500.0000,0.0000,0.0000,0.0000,2,1000.0000,0.0000,1000.0000),
  (4,3,1,3,500.0000,0.0000,0.0000,0.0000,100,50000.0000,0.0000,50000.0000),
  (5,2,1,3,500.0000,0.0000,0.0000,0.0000,1699,849500.0000,0.0000,849500.0000),
  (6,2,1,3,500.0000,0.0000,0.0000,0.0000,1,500.0000,0.0000,500.0000),
  (7,4,2,4,5.0000,0.0000,0.0000,0.0000,10,50.0000,0.0000,50.0000);
COMMIT;

/* Data for the `refproduct` table  (LIMIT 0,500) */

INSERT INTO `refproduct` (`refproduct_id`, `product_type`, `description`, `created_by_user_id`, `modified_by_user_id`, `date_created`, `date_modified`, `is_deleted`) VALUES
  (1,'Companion Animals','Common house pets',0,0,'2017-04-03 10:53:40','0000-00-00 00:00:00',0),
  (2,'Livestock Animals','Farm animals',0,0,'2017-04-03 10:53:40','0000-00-00 00:00:00',0),
  (3,'All Product type','',0,0,'2017-04-03 10:53:40','0000-00-00 00:00:00',0);
COMMIT;

/* Data for the `requisition_info` table  (LIMIT 0,500) */

INSERT INTO `requisition_info` (`requisition_id`, `requisition_no`, `department_id`, `purpose`, `center_code`, `fund_cluster`, `remarks`, `created_by_user`, `date_created`, `deleted_by_user`, `date_deleted`, `modified_by_user`, `date_modified`, `status`, `is_deleted`, `is_active`) VALUES
  (2,'PO-20170820-2',3,'p','a',NULL,'r',1,'2017-08-20 22:19:25',1,'2017-08-20 22:47:08',0,'0000-00-00 00:00:00',1,1,1),
  (3,'PO-20170820-3',2,'purpose','code',NULL,'remarks',1,'2017-08-20 22:19:45',1,'2017-08-20 22:47:14',1,'2017-08-20 22:21:06',0,1,1),
  (4,'PO-20170820-4',1,'dd','dd',NULL,'re',1,'2017-08-20 22:52:51',0,'0000-00-00 00:00:00',1,'2017-08-20 22:53:02',0,0,1),
  (5,'PO-20170820-5',1,'dd','ddd',NULL,'sdfsdf',1,'2017-08-20 22:52:59',0,'0000-00-00 00:00:00',1,'2017-08-20 22:53:05',0,0,1),
  (6,'REQ-20170823-6',2,'ddd','121',NULL,'dd',1,'2017-08-23 20:46:31',0,'0000-00-00 00:00:00',1,'2017-08-23 20:46:39',1,0,1),
  (7,'REQ-20170824-7',3,'gg','',NULL,'',1,'2017-08-24 19:43:35',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',1,0,1);
COMMIT;

/* Data for the `requisition_items` table  (LIMIT 0,500) */

INSERT INTO `requisition_items` (`req_item_id`, `requisition_id`, `product_id`, `unit_id`, `req_qty`, `req_cost`, `req_discount`, `req_line_total_discount`, `req_tax_rate`, `req_line_total`, `tax_amount`, `non_tax_amount`) VALUES
  (6,2,1,3,2,54,0,0,0,108,0,108),
  (8,3,1,3,1,500,0,0,0,500,0,500),
  (11,4,1,3,2,500,0,0,0,1000,0,1000),
  (12,5,1,3,2,500,0,0,0,1000,0,1000),
  (14,6,1,3,20,500,0,0,0,10000,0,10000),
  (15,7,2,4,1,5,0,0,0,5,0,5),
  (16,7,1,3,1,500,0,0,0,500,0,500);
COMMIT;

/* Data for the `rights_links` table  (LIMIT 0,500) */

INSERT INTO `rights_links` (`link_id`, `parent_code`, `link_code`, `link_name`) VALUES
  (1,'1','1-1','General Journal'),
  (2,'1','1-2','Cash Disbursement'),
  (3,'1','1-3','Purchase Journal'),
  (4,'1','1-4','Sales Journal'),
  (5,'1','1-5','Cash Receipt'),
  (6,'2','2-1','Purchase Order'),
  (7,'2','2-2','Purchase Invoice'),
  (8,'2','2-3','Account Payables'),
  (9,'2','2-4','Item Issuance'),
  (10,'2','2-5','Item Adjustment (In)'),
  (11,'3','3-1','Sales Order'),
  (12,'3','3-2','Sales Invoice'),
  (13,'3','3-3','Record Payment'),
  (14,'4','4-2','Category Management'),
  (15,'4','4-3','Department Management'),
  (16,'4','4-4','Unit Management'),
  (17,'5','5-1','Product Management'),
  (18,'5','5-2','Supplier Management'),
  (19,'5','5-3','Supplier Management'),
  (20,'6','6-1','Setup Tax'),
  (21,'6','6-2','Setup Chart of Accounts'),
  (22,'6','6-3','Account Integration'),
  (23,'6','6-4','Setup User Group'),
  (24,'6','6-5','Create User Account'),
  (25,'6','6-6','Setup Company Info'),
  (26,'7','7-1','Purchase Order for Approval'),
  (27,'9','9-1','Balance Sheet Report'),
  (28,'9','9-2','Income Statement'),
  (29,'4','4-4','Product Types'),
  (30,'8','8-1','Sales Report'),
  (31,'8','8-2','Batch Inventory Report'),
  (32,'5','5-4','Salesperson Management'),
  (33,'2','2-6','Item Adjustment (Out)'),
  (34,'8','8-3','Export Sales Summary'),
  (35,'9','9-3','Export Trial Balance'),
  (36,'6','6-7','Setup Check Layout'),
  (37,'9','9-4','AR Schedule'),
  (38,'9','9-6','Customer Subsidiary'),
  (39,'9','9-8','Account Subsidiary'),
  (40,'9','9-7','Supplier Subsidiary'),
  (41,'9','9-5','AP Schedule'),
  (42,'8','8-4','Purchase Invoice Report'),
  (43,'4','4-4','Locations Management'),
  (44,'10','10-1','Fixed Asset Management'),
  (45,'9','9-9','Depreciation Expense'),
  (46,'6','6-8','Recurring Template'),
  (47,'9','9-10','VAT Relief Report'),
  (48,'1','1-6','Petty Cash Journal'),
  (49,'9','9-13','Replenishment Report'),
  (50,'6','6-9','Backup Database'),
  (51,'2','2-6','Requisition');
COMMIT;

/* Data for the `salesperson` table  (LIMIT 0,500) */

INSERT INTO `salesperson` (`salesperson_id`, `salesperson_code`, `firstname`, `middlename`, `lastname`, `acr_name`, `contact_no`, `department_id`, `tin_no`, `is_active`, `is_deleted`, `date_created`, `date_modified`, `posted_by_user`) VALUES
  (1,'ssss','sss','sss','sss',NULL,'',2,'',1,0,'2017-06-16 13:59:40','0000-00-00 00:00:00',12),
  (2,'1211','d','d','d',NULL,'d',1,'121',1,0,'2017-06-16 15:34:56','0000-00-00 00:00:00',12);
COMMIT;

/* Data for the `suppliers` table  (LIMIT 0,500) */

INSERT INTO `suppliers` (`supplier_id`, `supplier_code`, `supplier_name`, `contact_name`, `contact_person`, `address`, `email_address`, `contact_no`, `tin_no`, `term`, `tax_type_id`, `photo_path`, `total_payable_amount`, `posted_by_user`, `date_created`, `date_modified`, `credit_limit`, `is_deleted`, `is_active`) VALUES
  (1,'N/A','N/A','','','','','','','',1,'',1000.00,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',NULL,0,1),
  (2,'','SH','SH','','SH','',NULL,'','',2,'assets/img/anonymous-icon.png',50000.00,12,'2017-06-16 17:13:35','0000-00-00 00:00:00',NULL,0,1),
  (3,'','National Bookstore','na','','na','',NULL,'','',2,'assets/img/anonymous-icon.png',750.00,1,'2017-08-19 09:05:55','0000-00-00 00:00:00',NULL,0,1);
COMMIT;

/* Data for the `tax_types` table  (LIMIT 0,500) */

INSERT INTO `tax_types` (`tax_type_id`, `tax_type`, `tax_rate`, `description`, `is_default`, `is_deleted`) VALUES
  (1,'Non-vat',0.00,'',0,0),
  (2,'Vatted',12.00,'',1,0);
COMMIT;

/* Data for the `units` table  (LIMIT 0,500) */

INSERT INTO `units` (`unit_id`, `unit_code`, `unit_name`, `unit_desc`, `date_created`, `date_modified`, `is_deleted`, `is_active`) VALUES
  (1,NULL,'Pack','',NULL,'0000-00-00 00:00:00',0,1),
  (2,NULL,'KG','',NULL,'0000-00-00 00:00:00',0,1),
  (3,NULL,'box','box',NULL,'0000-00-00 00:00:00',0,1),
  (4,NULL,'pc','',NULL,'0000-00-00 00:00:00',0,1);
COMMIT;

/* Data for the `user_accounts` table  (LIMIT 0,500) */

INSERT INTO `user_accounts` (`user_id`, `user_name`, `user_pword`, `user_lname`, `user_fname`, `user_mname`, `user_address`, `user_email`, `user_mobile`, `user_telephone`, `user_bdate`, `user_group_id`, `photo_path`, `file_directory`, `is_active`, `is_deleted`, `date_created`, `date_modified`, `date_deleted`, `modified_by_user`, `posted_by_user`, `deleted_by_user`, `is_online`) VALUES
  (1,'admin','d033e22ae348aeb5660fc2140aec35850c4da997','Flores','Liezel','','Mabalacat City, Pampanga','','0935-746-7601','','2016-08-01',1,'assets/img/user/59959d3648bf1.jpg',NULL,1,0,NULL,'2017-08-17 21:42:15',0,1,0,0,1),
  (10,'gelyn','356a192b7913b04c54574d18c28d46e6395428ab','Manalang','Gelyn Joy','','','joyeous_jhoye@yahoo.com','','','2016-08-04',2,'assets/img/user/57e17900670ab.jpg',NULL,1,1,NULL,'2017-01-27 17:07:08',2147483647,10,0,1,0),
  (11,'mario','356a192b7913b04c54574d18c28d46e6395428ab','FLores','Mario','','','','','','2016-09-23',2,'assets/img/anonymous-icon.png',NULL,1,1,'2016-09-22 16:47:04','2017-01-27 17:07:22',2147483647,0,1,1,0),
  (12,'alona','356a192b7913b04c54574d18c28d46e6395428ab','Faderon','Alona','','','','','','2016-12-19',1,'assets/img/user/59006af05888e.jpg',NULL,1,0,'2016-12-19 14:25:09','2017-08-06 21:36:06',0,1,1,0,1),
  (13,'Grace','a46e558d11cb2400bab09c1ca969e615142ef3d6','Grace','Grace','','','','','','2016-12-19',4,'assets/img/anonymous-icon.png',NULL,1,1,'2016-12-19 16:39:58','2017-01-12 10:30:27',2147483647,0,1,1,0),
  (14,'Arnel','c22171e9ccc3eaa1f43a19d86be801e0341c4999','Garcia','Arnel','Carlos','Bamban, Tarlac','acgarcia1720@yahoo.com','','','1972-06-17',4,'assets/img/anonymous-icon.png',NULL,1,1,'2016-12-19 17:09:22','2017-02-01 09:02:09',2147483647,0,1,1,0),
  (15,'lanie','39a89dd158c8e9747943b00f84be79fc33fbd405','L','Lanie','','','','','','2017-01-12',4,'assets/img/anonymous-icon.png',NULL,1,1,'2017-01-12 10:30:49','2017-08-06 21:36:13',2147483647,0,1,1,0),
  (16,'Lanie2','95438a383abe53ef9e00fe24590a3ea37f7ba85b','2','lanie','','','','','','2017-01-16',4,'assets/img/anonymous-icon.png',NULL,1,1,'2017-01-16 14:20:35','2017-08-06 21:36:16',2147483647,1,1,1,0),
  (17,'Grace2','077564fb04323d23b1f76da35a5c35b419711fa4','2','grace','','','','','','2017-01-17',4,'assets/img/anonymous-icon.png',NULL,1,1,'2017-01-17 17:02:52','2017-08-06 21:36:18',2147483647,0,1,1,0),
  (18,'Grace 3','e8032f26760bc5821bfa52d117f59d9c45803290','Kahitano','Grace','','','','','','2017-01-17',4,'assets/img/anonymous-icon.png',NULL,1,1,'2017-01-17 17:08:56','2017-08-06 21:36:21',2147483647,0,1,1,0),
  (19,'Lorena','bc57ef5f5bd9045c94f2d60996e0da27fb80db6c','Villanueva','Lorena','Galapate','','','','','1979-09-18',1,'assets/img/user/588050fb761c0.jpg',NULL,1,1,'2017-01-18 11:45:41','2017-08-06 21:36:23',2147483647,1,1,1,0),
  (20,'lanie3','c3b65c6048c8ddbd9422be4042b501b4049371d0','misalutsya','lanie','','','','','','2017-01-19',4,'assets/img/anonymous-icon.png',NULL,1,1,'2017-01-19 14:29:28','2017-08-06 21:36:26',2147483647,0,1,1,0),
  (21,'Emer','639f520f959371b6eea61334d4fbb558fc70673c','Nabayra','Emer','Rufino','Don Cornelio Subd. Dau, Mabalacat, Pampanga','evrvetoptionsemer@gmail.com','639326195529','','1984-10-17',4,'assets/img/anonymous-icon.png','',1,1,'2017-01-24 10:05:37','2017-08-06 21:36:29',2147483647,0,1,1,0),
  (22,'lanz','989b012f12c7dc9e17c56938699116e13705f66e','Pascua','Lanz','Pamintuan','Dau Mabt, Pamp','angelespetcarelani@gmail.com','09420968832','n/a','2017-07-24',1,'assets/img/anonymous-icon.png',NULL,1,1,'2017-01-26 09:15:53','2017-08-06 21:36:31',2147483647,22,1,1,0),
  (23,'gracey','2bb09f0d4a725048662c0efc2af65a2261b9106f','Diaz','Grace','Estacio','07 Manarang St., Telabastagan, CSFP','evrvetoptionsgrace@gmail.com','0922-877-8592','045-455-4978','1981-10-07',1,'assets/img/anonymous-icon.png','',1,1,'2017-01-30 08:55:24','2017-08-06 21:36:33',2147483647,1,1,1,0),
  (24,'lou','5fe2f28438a036ec293c537c9f345bb2ef3a083f','Dayrit','Lourdes','lgnacio','','evrvetoptionslou@gmail.com','','','2017-01-30',1,'assets/img/anonymous-icon.png','',1,1,'2017-01-30 17:03:53','2017-08-06 21:36:35',2147483647,1,1,1,0),
  (25,'apcaudit','1a6ca6fd77ba0e72de97f6d92a283d4c9303127d','gampoy','gilbert','salazar','tinang concepcion tarlac','gretaaudit@gmail.com','09430935482','','1989-09-13',1,'assets/img/user/58906b9ac52c9.jpg','',1,1,'2017-01-31 09:05:46','2017-08-06 21:36:38',2147483647,25,1,1,0),
  (26,'ARNEL GARCIA','9c3681b374b388106480eda7b8f258f68f5623ce','GARCIA','ARNEL','CARLOS','BAMBAN, TARLAC','evrvetoptionsarnel@gmail.com','09253012490','','1972-06-17',4,'assets/img/anonymous-icon.png','',1,1,'2017-02-01 09:09:15','2017-08-06 21:36:40',2147483647,0,1,1,0),
  (27,'Anita','92c8b10157e05856af182a643de7dcea14472f74','Lulu','Anita','Miranda','Don Cornelio Subd, Mabalacat Pampanga','','','','1966-08-04',5,'assets/img/anonymous-icon.png','',1,1,'2017-02-03 09:33:46','2017-08-06 21:36:42',2147483647,0,19,1,0),
  (28,'Nathalie','92c8b10157e05856af182a643de7dcea14472f74','Bognot','Nathalie','Fausto','Capas Tarlac','','','','1986-10-17',2,'assets/img/anonymous-icon.png','',1,1,'2017-02-03 10:09:09','2017-08-06 21:36:44',2147483647,0,19,1,0),
  (29,'elsa.isla','dbcb2310dfdb313a67cc49adcaf0a9c17bc1beef','Isla','Elsa','Valdez','5422 Dalandan St. Dau Homesite, Mabalacat, Pampanga','evrvetoptionselsa@gmail.com','09333198902','6241218','1973-01-27',4,'assets/img/anonymous-icon.png','',1,1,'2017-02-22 09:47:36','2017-08-06 21:36:46',2147483647,0,24,1,0),
  (30,'emil','84896d3e067884621c0f54334b8d840949665844','Aquinaldo','Emilio','','','','','','2017-04-04',6,'assets/img/anonymous-icon.png','',1,1,'2017-04-04 15:30:49','2017-08-06 21:36:49',2147483647,0,12,1,0),
  (31,'Paul','a027184a55211cd23e3f3094f1fdc728df5e0500','Rueda','Paul','','','','','','2017-04-26',1,'assets/img/user/59006d107c755.jpg','',1,1,'2017-04-26 17:49:06','2017-08-06 21:36:51',2147483647,0,12,1,0),
  (32,'june','356a192b7913b04c54574d18c28d46e6395428ab','June','June','','','','','','2017-08-17',7,'assets/img/user/59959c4c467e7.png','',1,0,'2017-08-17 21:40:01','0000-00-00 00:00:00',0,0,1,0,0),
  (33,'arvin','356a192b7913b04c54574d18c28d46e6395428ab','Pogi','Arvin','','','','','','2017-08-24',8,'assets/img/anonymous-icon.png','',1,0,'2017-08-24 18:29:38','0000-00-00 00:00:00',0,0,1,0,0);
COMMIT;

/* Data for the `user_group_rights` table  (LIMIT 0,500) */

INSERT INTO `user_group_rights` (`user_rights_id`, `user_group_id`, `link_code`) VALUES
  (1,1,'1-1'),
  (2,1,'1-2'),
  (3,1,'1-3'),
  (4,1,'1-4'),
  (5,1,'1-5'),
  (6,1,'2-1'),
  (7,1,'2-2'),
  (8,1,'2-3'),
  (9,1,'2-4'),
  (10,1,'2-5'),
  (11,1,'3-1'),
  (12,1,'3-2'),
  (13,1,'3-3'),
  (14,1,'4-2'),
  (15,1,'4-3'),
  (16,1,'4-4'),
  (17,1,'5-1'),
  (18,1,'5-2'),
  (19,1,'5-3'),
  (20,1,'6-1'),
  (21,1,'6-2'),
  (22,1,'6-3'),
  (23,1,'6-4'),
  (24,1,'6-5'),
  (25,1,'6-6'),
  (26,1,'7-1'),
  (27,1,'9-1'),
  (28,1,'9-2'),
  (29,1,'4-4'),
  (30,1,'8-1'),
  (31,1,'8-2'),
  (32,1,'5-4'),
  (33,1,'2-6'),
  (34,1,'8-3'),
  (35,1,'9-3'),
  (36,1,'6-7'),
  (37,1,'9-4'),
  (38,1,'9-6'),
  (39,1,'9-8'),
  (40,1,'9-7'),
  (41,1,'9-5'),
  (42,1,'8-4'),
  (43,1,'4-4'),
  (44,1,'10-1'),
  (45,1,'9-9'),
  (46,1,'6-8'),
  (47,1,'9-10'),
  (48,1,'1-6'),
  (49,1,'9-13'),
  (50,1,'6-9'),
  (51,1,'2-6'),
  (231,7,'2-1'),
  (232,8,'2-1'),
  (233,8,'2-2');
COMMIT;

/* Data for the `user_groups` table  (LIMIT 0,500) */

INSERT INTO `user_groups` (`user_group_id`, `user_group`, `user_group_desc`, `is_active`, `is_deleted`, `date_created`, `date_modified`) VALUES
  (1,'System Administrator','Can access all features.',1,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
  (7,'PO User','PO User',1,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
  (8,'Group 1','Receiving',1,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;