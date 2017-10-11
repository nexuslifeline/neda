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
AUTO_INCREMENT=2 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
AUTO_INCREMENT=5 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
AUTO_INCREMENT=7 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
  `is_active` BIT(1) DEFAULT 1,
  `is_deleted` BIT(1) DEFAULT 0,
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
AUTO_INCREMENT=6 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
  `is_deleted` BIT(1) DEFAULT 0,
  PRIMARY KEY USING BTREE (`po_message_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `pr_info` table : */

CREATE TABLE `pr_info` (
  `pr_info_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `pr_no` VARCHAR(55) COLLATE latin1_swedish_ci DEFAULT '',
  `remarks` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT '',
  `is_active` TINYINT(4) DEFAULT 1,
  `is_deleted` TINYINT(4) DEFAULT 0,
  `posted_by_user` INTEGER(11) DEFAULT 0,
  `date_posted` DATETIME DEFAULT '0000-00-00 00:00:00',
  `modified_by_user` INTEGER(11) DEFAULT 0,
  `date_modified` DATETIME DEFAULT '0000-00-00 00:00:00',
  `deleted_by_user` INTEGER(11) DEFAULT 0,
  `date_deleted` DATE DEFAULT '0000-00-00',
  `reason` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT '',
  `is_approved` TINYINT(4) DEFAULT 0,
  PRIMARY KEY USING BTREE (`pr_info_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=9 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `pr_items` table : */

CREATE TABLE `pr_items` (
  `pr_item_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `pr_info_id` INTEGER(11) DEFAULT 0,
  `product_id` INTEGER(11) DEFAULT 0,
  `unit_id` INTEGER(11) DEFAULT 0,
  `pr_price` DECIMAL(20,4) DEFAULT 0.0000,
  `pr_discount` DECIMAL(20,4) DEFAULT 0.0000,
  `pr_line_total_discount` DECIMAL(20,4) DEFAULT 0.0000,
  `pr_tax_rate` DECIMAL(11,4) DEFAULT 0.0000,
  `pr_qty` DECIMAL(20,0) DEFAULT 0,
  `pr_line_total` DECIMAL(20,4) DEFAULT 0.0000,
  `pr_tax_amount` DECIMAL(20,4) DEFAULT 0.0000,
  `pr_non_tax_amount` DECIMAL(20,4) DEFAULT 0.0000,
  PRIMARY KEY USING BTREE (`pr_item_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=15 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
AUTO_INCREMENT=3 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `purchase_order` table : */

CREATE TABLE `purchase_order` (
  `purchase_order_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `po_no` VARCHAR(75) COLLATE latin1_swedish_ci DEFAULT '',
  `quote_id` INTEGER(11) DEFAULT 0,
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
AUTO_INCREMENT=6 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
AUTO_INCREMENT=7 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `quotation_info` table : */

CREATE TABLE `quotation_info` (
  `quote_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `quote_no` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT '',
  `request_link_key` VARCHAR(755) COLLATE latin1_swedish_ci DEFAULT '',
  `pr_info_id` INTEGER(11) DEFAULT 0,
  `supplier_id` INTEGER(11) DEFAULT 0,
  `total_price` DECIMAL(20,2) DEFAULT 0.00,
  `date_quoted` DATETIME DEFAULT NULL,
  `is_approved` TINYINT(4) DEFAULT 0,
  `is_active` TINYINT(4) DEFAULT 1,
  `is_po_created` TINYINT(4) DEFAULT 0,
  PRIMARY KEY USING BTREE (`quote_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=23 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `quotation_items` table : */

CREATE TABLE `quotation_items` (
  `quote_item_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `quote_id` INTEGER(11) DEFAULT 0,
  `product_id` INTEGER(11) DEFAULT 0,
  `quote_qty` DECIMAL(11,2) DEFAULT 9.00,
  `qoute_price` DECIMAL(11,2) DEFAULT 0.00,
  `quote_total_price` DECIMAL(11,2) DEFAULT 0.00,
  PRIMARY KEY USING BTREE (`quote_item_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=10 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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

/* Structure for the `request_links` table : */

CREATE TABLE `request_links` (
  `request_link_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` INTEGER(11) DEFAULT 0,
  `pr_info_id` INTEGER(11) DEFAULT 0,
  `key` VARCHAR(1000) COLLATE latin1_swedish_ci DEFAULT '',
  `sent_to_email` VARCHAR(155) COLLATE latin1_swedish_ci DEFAULT '',
  `date_sent` DATETIME DEFAULT '0000-00-00 00:00:00',
  `sent_by_user` INTEGER(11) DEFAULT 0,
  `date_replied` DATETIME DEFAULT '0000-00-00 00:00:00',
  `is_supplier_replied` TINYINT(4) DEFAULT 0,
  PRIMARY KEY USING BTREE (`request_link_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=13 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
AUTO_INCREMENT=3 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
AUTO_INCREMENT=4 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
AUTO_INCREMENT=57 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
AUTO_INCREMENT=5 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
AUTO_INCREMENT=236 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
  (1,'ADJ-20170915-1',2,'ff','IN',0.00,0.00,0.00,0.00,'2017-09-15','2017-09-15 21:28:39','2017-09-15 21:28:39',NULL,1,0,0,1,0);
COMMIT;

/* Data for the `adjustment_items` table  (LIMIT 0,500) */

INSERT INTO `adjustment_items` (`adjustment_item_id`, `adjustment_id`, `product_id`, `unit_id`, `adjust_qty`, `adjust_price`, `adjust_discount`, `adjust_tax_rate`, `adjust_line_total_price`, `adjust_line_total_discount`, `adjust_tax_amount`, `adjust_non_tax_amount`, `exp_date`, `batch_no`) VALUES
  (1,1,1,3,1,0.0000,0.0000,12.0000,0.0000,0.0000,0.0000,0.0000,'0000-00-00','');
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
  (11,NULL,'category','category',NULL,'0000-00-00 00:00:00',0,1);
COMMIT;

/* Data for the `company_info` table  (LIMIT 0,500) */

INSERT INTO `company_info` (`company_id`, `company_name`, `company_address`, `email_address`, `mobile_no`, `landline`, `tin_no`, `tax_type_id`, `registered_to`, `logo_path`) VALUES
  (1,'National Economic and Development Authority Regional Office III','Diosdado Macapagal Government Center, Maimpis, City of San Fernando, Pampanga','nedaregion3@gmail.com','0935-746-7611','(045) 322-3542','1234-5678-91112',2,'','assets/img/company/598fd89a4c6c1.jpg');
COMMIT;

/* Data for the `delivery_invoice` table  (LIMIT 0,500) */

INSERT INTO `delivery_invoice` (`dr_invoice_id`, `dr_invoice_no`, `purchase_order_id`, `external_ref_no`, `contact_person`, `terms`, `duration`, `supplier_id`, `department_id`, `tax_type_id`, `journal_id`, `remarks`, `total_discount`, `total_before_tax`, `total_tax_amount`, `total_after_tax`, `is_active`, `is_deleted`, `is_paid`, `is_journal_posted`, `date_due`, `date_delivered`, `date_created`, `date_modified`, `date_deleted`, `posted_by_user`, `modified_by_user`, `deleted_by_user`, `batch_no`) VALUES
  (1,'P-INV-20170912-1',1,'','','','',1,2,NULL,0,'',0.0000,0.0000,0.0000,0.0000,1,0,0,0,'2017-09-12','2017-09-12','2017-09-12 21:41:25','2017-09-12 21:41:25','0000-00-00 00:00:00',1,0,0,NULL),
  (2,'P-INV-20170915-2',0,'','na','','',1,2,NULL,0,'',0.0000,0.0000,0.0000,0.0000,1,0,0,0,'2017-09-15','2017-09-11','2017-09-15 22:41:10','2017-09-15 22:41:10','0000-00-00 00:00:00',12,0,0,NULL),
  (3,'P-INV-20170916-3',2,'','','','',1,NULL,NULL,0,'san jose, san simon, pampanga',0.0000,0.0000,0.0000,0.0000,1,0,0,0,'2017-09-16','2017-09-16','2017-09-16 11:53:40','2017-09-16 11:53:48','0000-00-00 00:00:00',1,1,0,NULL),
  (4,'P-INV-20170918-4',0,'','na','','',1,NULL,NULL,0,'',0.0000,0.0000,0.0000,0.0000,1,0,0,0,'2017-09-18','2017-08-31','2017-09-18 17:35:36','2017-09-18 17:35:36','0000-00-00 00:00:00',1,0,0,NULL);
COMMIT;

/* Data for the `delivery_invoice_items` table  (LIMIT 0,500) */

INSERT INTO `delivery_invoice_items` (`dr_invoice_item_id`, `dr_invoice_id`, `product_id`, `unit_id`, `dr_qty`, `dr_discount`, `dr_price`, `dr_line_total_discount`, `dr_line_total_price`, `dr_tax_rate`, `dr_tax_amount`, `dr_non_tax_amount`, `exp_date`, `batch_no`) VALUES
  (1,1,1,3,50,0.0000,0.0000,0.0000,0.0000,12.0000,0.0000,0.0000,'1970-01-01',NULL),
  (2,1,2,4,300,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,'1970-01-01',NULL),
  (3,2,1,3,55,0.0000,0.0000,0.0000,0.0000,12.0000,0.0000,0.0000,'1970-01-01',NULL),
  (5,3,1,3,3,0.0000,0.0000,0.0000,0.0000,12.0000,0.0000,0.0000,'1970-01-01',NULL),
  (6,4,1,3,130,0.0000,0.0000,0.0000,0.0000,12.0000,0.0000,0.0000,'1970-01-01',NULL);
COMMIT;

/* Data for the `departments` table  (LIMIT 0,500) */

INSERT INTO `departments` (`department_id`, `department_code`, `department_name`, `department_desc`, `delivery_address`, `default_cost`, `date_created`, `date_modified`, `is_deleted`, `is_active`) VALUES
  (1,'','Admin','',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,1),
  (2,'','IT Deparment','',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,1),
  (3,'','Kitchen','Kitchen',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,1);
COMMIT;

/* Data for the `issuance_info` table  (LIMIT 0,500) */

INSERT INTO `issuance_info` (`issuance_id`, `slip_no`, `requisition_id`, `issued_department_id`, `remarks`, `total_discount`, `total_before_tax`, `total_tax_amount`, `total_after_tax`, `date_issued`, `date_created`, `date_modified`, `date_deleted`, `modified_by_user`, `posted_by_user`, `deleted_by_user`, `is_active`, `is_deleted`) VALUES
  (1,'SLP-20170912-1',1,1,'na',0.00,0.00,0.00,0.00,'2017-09-12','2017-09-12 21:42:47','2017-09-16 12:03:55','0000-00-00 00:00:00',1,1,0,1,0),
  (2,'SLP-20170916-2',2,3,'ff',0.00,0.00,0.00,0.00,'2017-09-16','2017-09-16 12:08:14','2017-09-16 12:08:14','0000-00-00 00:00:00',0,1,0,1,0);
COMMIT;

/* Data for the `issuance_items` table  (LIMIT 0,500) */

INSERT INTO `issuance_items` (`issuance_item_id`, `issuance_id`, `product_id`, `unit_id`, `issue_qty`, `issue_price`, `issue_discount`, `issue_tax_rate`, `issue_line_total_price`, `issue_line_total_discount`, `issue_tax_amount`, `issue_non_tax_amount`, `dr_invoice_id`, `exp_date`, `batch_no`) VALUES
  (3,1,1,3,2.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0,'0000-00-00',''),
  (4,1,2,4,1.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0,'0000-00-00',''),
  (5,2,2,4,2.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0,'0000-00-00','');
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

/* Data for the `pr_info` table  (LIMIT 0,500) */

INSERT INTO `pr_info` (`pr_info_id`, `pr_no`, `remarks`, `is_active`, `is_deleted`, `posted_by_user`, `date_posted`, `modified_by_user`, `date_modified`, `deleted_by_user`, `date_deleted`, `reason`, `is_approved`) VALUES
  (3,'PO-20171004-3','dd',1,1,1,'2017-10-04 23:15:43',1,'0000-00-00 00:00:00',1,'2017-10-04','sddsfs',0),
  (4,'PR-20171004-4','s',1,0,1,'2017-10-04 23:16:59',1,'0000-00-00 00:00:00',0,'0000-00-00','sfsdf',1),
  (5,'PR-20171004-5','',1,0,1,'2017-10-04 23:22:08',0,'0000-00-00 00:00:00',0,'0000-00-00','sdfs',1),
  (6,'PR-20171004-6','remarks',1,1,1,'2017-10-04 23:23:39',0,'0000-00-00 00:00:00',1,'2017-10-04','purpose',0),
  (7,'PR-20171004-7','sdfsdf',1,0,1,'2017-10-04 23:28:15',0,'0000-00-00 00:00:00',0,'0000-00-00','sdsf',1),
  (8,'PR-20171010-8','',1,0,1,'2017-10-10 22:45:10',0,'0000-00-00 00:00:00',0,'0000-00-00','d',1);
COMMIT;

/* Data for the `pr_items` table  (LIMIT 0,500) */

INSERT INTO `pr_items` (`pr_item_id`, `pr_info_id`, `product_id`, `unit_id`, `pr_price`, `pr_discount`, `pr_line_total_discount`, `pr_tax_rate`, `pr_qty`, `pr_line_total`, `pr_tax_amount`, `pr_non_tax_amount`) VALUES
  (6,4,2,4,0.0000,0.0000,0.0000,0.0000,3,0.0000,0.0000,0.0000),
  (10,3,1,3,0.0000,0.0000,0.0000,0.0000,2,0.0000,0.0000,0.0000),
  (11,5,2,4,0.0000,0.0000,0.0000,0.0000,10,0.0000,0.0000,0.0000),
  (12,6,2,4,0.0000,0.0000,0.0000,0.0000,12,0.0000,0.0000,0.0000),
  (13,7,1,3,0.0000,0.0000,0.0000,12.0000,12,0.0000,0.0000,0.0000),
  (14,8,1,3,0.0000,0.0000,0.0000,12.0000,1,0.0000,0.0000,0.0000);
COMMIT;

/* Data for the `products` table  (LIMIT 0,500) */

INSERT INTO `products` (`product_id`, `product_code`, `product_desc`, `product_desc1`, `unit`, `size`, `supplier_id`, `tax_type_id`, `refproduct_id`, `category_id`, `department_id`, `unit_id`, `equivalent_points`, `product_warn`, `product_ideal`, `purchase_cost`, `purchase_cost_2`, `markup_percent`, `sale_price`, `whole_sale`, `retailer_price`, `special_disc`, `discounted_price`, `dealer_price`, `distributor_price`, `public_price`, `valued_customer`, `income_account_id`, `expense_account_id`, `on_hand`, `item_type_id`, `date_created`, `date_modified`, `date_deleted`, `created_by_user`, `modified_by_user`, `deleted_by_user`, `is_inventory`, `is_tax_exempt`, `is_deleted`, `is_active`) VALUES
  (1,'121','Bond Paper','','',NULL,NULL,2,NULL,7,0,3,0.00,0.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,237.00,1,'2017-09-12 21:39:31','2017-09-15 23:21:53','0000-00-00 00:00:00',1,1,0,1,0,0,1),
  (2,'122','Ballpen','','',NULL,NULL,1,NULL,7,0,4,0.00,0.00,0.00,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,297.00,1,'2017-09-12 21:40:28','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,1,0,0,1);
COMMIT;

/* Data for the `purchase_order` table  (LIMIT 0,500) */

INSERT INTO `purchase_order` (`purchase_order_id`, `po_no`, `quote_id`, `terms`, `duration`, `deliver_to_address`, `supplier_id`, `department_id`, `tax_type_id`, `contact_person`, `remarks`, `total_discount`, `total_before_tax`, `total_tax_amount`, `total_after_tax`, `approval_id`, `order_status_id`, `is_email_sent`, `is_active`, `is_deleted`, `date_created`, `date_modified`, `date_deleted`, `date_approved`, `approved_by_user`, `posted_by_user`, `deleted_by_user`, `modified_by_user`) VALUES
  (1,'PO-20170912-1',0,'',NULL,'San Fernando Pampanga',1,2,NULL,'','',0.0000,0.0000,0.0000,0.0000,2,2,0,1,0,'2017-09-12 21:41:16','2017-09-12 21:41:25','0000-00-00 00:00:00','0000-00-00 00:00:00',0,1,0,0),
  (2,'PO-20170916-2',0,'',NULL,'San Jose, San Simon, Pampanga',1,NULL,NULL,'','san jose, san simon, pampanga',0.0000,0.0000,0.0000,0.0000,2,2,0,1,0,'2017-09-16 11:37:57','2017-09-16 11:53:40','0000-00-00 00:00:00','0000-00-00 00:00:00',0,1,0,0),
  (3,'PO-20171011-3',0,'',NULL,'jj',4,NULL,NULL,'','',0.0000,168.0000,0.0000,168.0000,2,1,0,1,0,'2017-10-11 11:54:49','2017-10-11 11:54:49','0000-00-00 00:00:00','0000-00-00 00:00:00',0,1,0,0),
  (4,'PO-20171011-4',21,'',NULL,'San Jose',4,NULL,NULL,'','',0.0000,168.0000,0.0000,168.0000,2,1,0,1,0,'2017-10-11 12:03:08','2017-10-11 12:03:08','0000-00-00 00:00:00','0000-00-00 00:00:00',0,1,0,0),
  (5,'PO-20171011-5',21,'',NULL,'San Jose, San Simon',4,NULL,NULL,'','',0.0000,168.0000,0.0000,168.0000,2,1,0,1,0,'2017-10-11 12:04:21','2017-10-11 12:04:21','0000-00-00 00:00:00','0000-00-00 00:00:00',0,1,0,0);
COMMIT;

/* Data for the `purchase_order_items` table  (LIMIT 0,500) */

INSERT INTO `purchase_order_items` (`po_item_id`, `purchase_order_id`, `product_id`, `unit_id`, `po_price`, `po_discount`, `po_line_total_discount`, `po_tax_rate`, `po_qty`, `po_line_total`, `tax_amount`, `non_tax_amount`) VALUES
  (1,1,1,3,0.0000,0.0000,0.0000,12.0000,50,0.0000,0.0000,0.0000),
  (2,1,2,4,0.0000,0.0000,0.0000,0.0000,300,0.0000,0.0000,0.0000),
  (3,2,1,3,0.0000,0.0000,0.0000,12.0000,2,0.0000,0.0000,0.0000),
  (4,3,2,4,56.0000,0.0000,0.0000,0.0000,3,168.0000,0.0000,168.0000),
  (5,4,2,4,56.0000,0.0000,0.0000,0.0000,3,168.0000,0.0000,168.0000),
  (6,5,2,4,56.0000,0.0000,0.0000,0.0000,3,168.0000,0.0000,168.0000);
COMMIT;

/* Data for the `quotation_info` table  (LIMIT 0,500) */

INSERT INTO `quotation_info` (`quote_id`, `quote_no`, `request_link_key`, `pr_info_id`, `supplier_id`, `total_price`, `date_quoted`, `is_approved`, `is_active`, `is_po_created`) VALUES
  (21,'Q-000000021','623',4,4,168.00,'2017-10-10 21:28:53',1,1,1),
  (22,'Q-000000022','623a7ad5495f67b68978bcbb7f9e3608',4,4,1800.00,'2017-10-11 15:54:07',0,1,0);
COMMIT;

/* Data for the `quotation_items` table  (LIMIT 0,500) */

INSERT INTO `quotation_items` (`quote_item_id`, `quote_id`, `product_id`, `quote_qty`, `qoute_price`, `quote_total_price`) VALUES
  (8,21,2,3.00,56.00,168.00),
  (9,22,2,3.00,600.00,1800.00);
COMMIT;

/* Data for the `refproduct` table  (LIMIT 0,500) */

INSERT INTO `refproduct` (`refproduct_id`, `product_type`, `description`, `created_by_user_id`, `modified_by_user_id`, `date_created`, `date_modified`, `is_deleted`) VALUES
  (1,'Companion Animals','Common house pets',0,0,'2017-04-03 10:53:40','0000-00-00 00:00:00',0),
  (2,'Livestock Animals','Farm animals',0,0,'2017-04-03 10:53:40','0000-00-00 00:00:00',0),
  (3,'All Product type','',0,0,'2017-04-03 10:53:40','0000-00-00 00:00:00',0);
COMMIT;

/* Data for the `request_links` table  (LIMIT 0,500) */

INSERT INTO `request_links` (`request_link_id`, `supplier_id`, `pr_info_id`, `key`, `sent_to_email`, `date_sent`, `sent_by_user`, `date_replied`, `is_supplier_replied`) VALUES
  (7,1,4,'2c19eff1b47eb0ca8ef7aeb539db32d6','','2017-10-07 21:46:38',1,'0000-00-00 00:00:00',0),
  (8,2,4,'0276fcaf8d08de5fd4560430e3361f37','','2017-10-07 21:46:38',1,'0000-00-00 00:00:00',0),
  (9,1,5,'9ac575b2bbc578af0fef9a141358dfdf','','2017-10-07 21:48:40',1,'0000-00-00 00:00:00',0),
  (10,2,5,'90ed5f3120441cb43acfd6b1c1a16420','','2017-10-07 21:48:40',1,'0000-00-00 00:00:00',0),
  (11,3,4,'d8973d58b88cec30fb9c613a74c3a96c','','2017-10-07 22:16:21',1,'0000-00-00 00:00:00',0),
  (12,4,4,'623a7ad5495f67b68978bcbb7f9e3608','Orchids@yahoo.com','2017-10-07 22:16:21',1,'2017-10-11 15:54:07',1);
COMMIT;

/* Data for the `requisition_info` table  (LIMIT 0,500) */

INSERT INTO `requisition_info` (`requisition_id`, `requisition_no`, `department_id`, `purpose`, `center_code`, `fund_cluster`, `remarks`, `created_by_user`, `date_created`, `deleted_by_user`, `date_deleted`, `modified_by_user`, `date_modified`, `status`, `is_deleted`, `is_active`) VALUES
  (1,'REQ-20170912-1',1,'na','',NULL,'',1,'2017-09-12 21:42:14',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,1),
  (2,'REQ-20170916-2',3,'ff','','','',1,'2017-09-16 11:55:39',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,1);
COMMIT;

/* Data for the `requisition_items` table  (LIMIT 0,500) */

INSERT INTO `requisition_items` (`req_item_id`, `requisition_id`, `product_id`, `unit_id`, `req_qty`, `req_cost`, `req_discount`, `req_line_total_discount`, `req_tax_rate`, `req_line_total`, `tax_amount`, `non_tax_amount`, `is_available`) VALUES
  (1,1,1,3,2,0,0,0,12,0,0,0,1),
  (2,1,2,4,1,0,0,0,0,0,0,0,1),
  (3,2,2,4,2,0,0,0,0,0,0,0,1);
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
  (53,'8','8-2','Supplies and Materials Issued Report','Supplies_issued'),
  (54,'2','2-7','Purchase Request','Purchase_request'),
  (55,'7','7-2','Purchase Request for Approval','Dashboard'),
  (56,'7','7-3','Quotation for Approval','Dashboard');
COMMIT;

/* Data for the `salesperson` table  (LIMIT 0,500) */

INSERT INTO `salesperson` (`salesperson_id`, `salesperson_code`, `firstname`, `middlename`, `lastname`, `acr_name`, `contact_no`, `department_id`, `tin_no`, `is_active`, `is_deleted`, `date_created`, `date_modified`, `posted_by_user`) VALUES
  (1,'ssss','sss','sss','sss',NULL,'',2,'',1,0,'2017-06-16 13:59:40','0000-00-00 00:00:00',12),
  (2,'1211','d','d','d',NULL,'d',1,'121',1,0,'2017-06-16 15:34:56','0000-00-00 00:00:00',12);
COMMIT;

/* Data for the `suppliers` table  (LIMIT 0,500) */

INSERT INTO `suppliers` (`supplier_id`, `supplier_code`, `supplier_name`, `contact_name`, `contact_person`, `address`, `email_address`, `contact_no`, `tin_no`, `term`, `tax_type_id`, `photo_path`, `total_payable_amount`, `posted_by_user`, `date_created`, `date_modified`, `credit_limit`, `is_deleted`, `is_active`) VALUES
  (3,'','National Bookstore','National Bookstore','','National Bookstore','','','','',2,'assets/img/anonymous-icon.png',0.00,1,'2017-10-07 22:15:54','0000-00-00 00:00:00',NULL,0,1),
  (4,'','Orchids','Orchids','','Orchids','Orchids@yahoo.com','','','',1,'assets/img/anonymous-icon.png',0.00,1,'2017-10-07 22:16:08','0000-00-00 00:00:00',NULL,0,1);
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
  (1,'admin','7c4a8d09ca3762af61e59520943dc26494f8941b','Flores','Liezel','','Mabalacat City, Pampanga','','0935-746-7601','','2016-08-01',1,'assets/img/user/59959d3648bf1.jpg',NULL,1,0,NULL,'2017-09-17 21:43:02',0,1,0,0,1),
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
  (32,'june','356a192b7913b04c54574d18c28d46e6395428ab','June','June','','','','','','2017-08-17',7,'assets/img/user/59959c4c467e7.png','',1,0,'2017-08-17 21:40:01','2017-09-12 22:23:53',0,1,1,0,0),
  (33,'arvin','7c4a8d09ca3762af61e59520943dc26494f8941b','Pogi','Arvin','','','','','','2017-08-24',8,'assets/img/anonymous-icon.png','',1,0,'2017-08-24 18:29:38','2017-09-17 21:41:29',0,1,1,0,0);
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
  (52,1,'8-1'),
  (53,1,'8-2'),
  (54,1,'2-7'),
  (55,1,'7-2'),
  (56,1,'7-3'),
  (234,8,'2-2'),
  (235,8,'2-3');
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