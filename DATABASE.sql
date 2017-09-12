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

/* Structure for the `account_classes` table : */

CREATE TABLE `account_classes` (
  `account_class_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `account_class` VARCHAR(755) COLLATE latin1_swedish_ci DEFAULT '',
  `description` VARCHAR(1000) COLLATE latin1_swedish_ci DEFAULT '',
  `account_type_id` INTEGER(11) DEFAULT 0,
  `date_created` DATETIME DEFAULT '0000-00-00 00:00:00',
  `date_modified` DATE DEFAULT '0000-00-00',
  `date_deleted` DATETIME DEFAULT '0000-00-00 00:00:00',
  `created_by_user` INTEGER(11) DEFAULT 0,
  `modified_by_user` INTEGER(11) DEFAULT 0,
  `deleted_by_user` INTEGER(11) DEFAULT 0,
  `is_active` BIT(1) DEFAULT 1,
  `is_deleted` BIT(1) DEFAULT 0,
  PRIMARY KEY USING BTREE (`account_class_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=35 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `account_integration` table : */

CREATE TABLE `account_integration` (
  `integration_id` INTEGER(11) NOT NULL,
  `input_tax_account_id` BIGINT(20) DEFAULT 0,
  `payable_account_id` BIGINT(20) DEFAULT 0,
  `payable_discount_account_id` BIGINT(20) DEFAULT 0,
  `payment_to_supplier_id` BIGINT(20) DEFAULT 0,
  `output_tax_account_id` BIGINT(20) DEFAULT 0,
  `receivable_account_id` BIGINT(20) DEFAULT 0,
  `receivable_discount_account_id` BIGINT(20) DEFAULT 0,
  `payment_from_customer_id` BIGINT(20) DEFAULT 0,
  `retained_earnings_id` BIGINT(20) DEFAULT 0,
  `petty_cash_account_id` INTEGER(11) DEFAULT 0,
  PRIMARY KEY USING BTREE (`integration_id`)
) ENGINE=InnoDB
CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `account_titles` table : */

CREATE TABLE `account_titles` (
  `account_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `account_no` VARCHAR(75) COLLATE latin1_swedish_ci DEFAULT '',
  `account_title` VARCHAR(755) COLLATE latin1_swedish_ci DEFAULT '',
  `account_class_id` INTEGER(11) DEFAULT 0,
  `parent_account_id` INTEGER(11) DEFAULT 0,
  `grand_parent_id` INTEGER(11) DEFAULT 0,
  `description` VARCHAR(1000) COLLATE latin1_swedish_ci DEFAULT '',
  `date_created` DATETIME DEFAULT '0000-00-00 00:00:00',
  `date_modified` DATETIME DEFAULT '0000-00-00 00:00:00',
  `date_deleted` DATETIME DEFAULT '0000-00-00 00:00:00',
  `created_by_user` INTEGER(11) DEFAULT 0,
  `modified_by_user` INTEGER(11) DEFAULT 0,
  `deleted_by_user` INTEGER(11) DEFAULT 0,
  `is_active` BIT(1) DEFAULT 1,
  `is_deleted` BIT(1) DEFAULT 0,
  PRIMARY KEY USING BTREE (`account_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=15 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `account_types` table : */

CREATE TABLE `account_types` (
  `account_type_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `account_type` VARCHAR(155) COLLATE latin1_swedish_ci DEFAULT '',
  `description` VARCHAR(1000) COLLATE latin1_swedish_ci DEFAULT '',
  PRIMARY KEY USING BTREE (`account_type_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=6 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `account_year` table : */

CREATE TABLE `account_year` (
  `account_year_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `account_year` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT '',
  `description` VARCHAR(755) COLLATE latin1_swedish_ci DEFAULT '',
  `status` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT NULL,
  `date_created` DATETIME DEFAULT '0000-00-00 00:00:00',
  `created_by_user` INTEGER(11) DEFAULT 0,
  `date_closed` DATETIME DEFAULT '0000-00-00 00:00:00',
  `closed_by_user` INTEGER(11) DEFAULT 0,
  PRIMARY KEY USING BTREE (`account_year_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=2 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `accounting_period` table : */

CREATE TABLE `accounting_period` (
  `accounting_period_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `period_start` DATE DEFAULT '0000-00-00',
  `period_end` DATE DEFAULT '0000-00-00',
  `closed_by_user` BIGINT(20) DEFAULT 0,
  `date_time_closed` DATETIME DEFAULT '0000-00-00 00:00:00',
  `remarks` VARCHAR(1000) COLLATE latin1_swedish_ci DEFAULT '',
  PRIMARY KEY USING BTREE (`accounting_period_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=2 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

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

/* Structure for the `asset_property_status` table : */

CREATE TABLE `asset_property_status` (
  `asset_status_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `asset_property_status` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `is_active` TINYINT(4) DEFAULT 1,
  `is_deleted` TINYINT(4) DEFAULT 0,
  PRIMARY KEY USING BTREE (`asset_status_id`),
  UNIQUE KEY `asset_property_id` USING BTREE (`asset_status_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=6 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `batch_info` table : */

CREATE TABLE `batch_info` (
  `batch_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `batch_no` VARCHAR(75) COLLATE latin1_swedish_ci DEFAULT '',
  `date_replenished` DATETIME DEFAULT '0000-00-00 00:00:00',
  `replenished_by` INTEGER(11) DEFAULT 0,
  PRIMARY KEY USING BTREE (`batch_id`),
  UNIQUE KEY `batch_id` USING BTREE (`batch_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=4 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `brands` table : */

CREATE TABLE `brands` (
  `brand_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `brand_name` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT NULL,
  `is_deleted` BIT(1) DEFAULT 0,
  `is_active` BIT(1) DEFAULT 1,
  PRIMARY KEY USING BTREE (`brand_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=4 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `cards` table : */

CREATE TABLE `cards` (
  `card_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `card_name` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT NULL,
  `is_deleted` BIT(1) DEFAULT 0,
  `is_active` BIT(1) DEFAULT 1,
  PRIMARY KEY USING BTREE (`card_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
AUTO_INCREMENT=11 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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

/* Structure for the `check_layout` table : */

CREATE TABLE `check_layout` (
  `check_layout_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `check_layout` VARCHAR(755) COLLATE latin1_swedish_ci DEFAULT '',
  `description` VARCHAR(1000) COLLATE latin1_swedish_ci DEFAULT '',
  `particular_pos_left` DECIMAL(20,0) DEFAULT 0,
  `particular_pos_top` DECIMAL(20,0) DEFAULT 0,
  `particular_font_family` VARCHAR(555) COLLATE latin1_swedish_ci DEFAULT 'Tahoma',
  `particular_font_size` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT '12pt',
  `particular_is_italic` VARCHAR(55) COLLATE latin1_swedish_ci DEFAULT 'normal',
  `particular_is_bold` VARCHAR(55) COLLATE latin1_swedish_ci DEFAULT 'bold',
  `words_pos_left` DECIMAL(20,4) DEFAULT 0.0000,
  `words_pos_top` DECIMAL(20,4) DEFAULT 0.0000,
  `words_font_family` VARCHAR(555) COLLATE latin1_swedish_ci DEFAULT 'Tahoma',
  `words_font_size` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT '12pt',
  `words_is_italic` VARCHAR(55) COLLATE latin1_swedish_ci DEFAULT 'normal',
  `words_is_bold` VARCHAR(55) COLLATE latin1_swedish_ci DEFAULT 'bold',
  `amount_pos_left` DECIMAL(20,4) DEFAULT 0.0000,
  `amount_pos_top` DECIMAL(20,4) DEFAULT 0.0000,
  `amount_font_family` VARCHAR(555) COLLATE latin1_swedish_ci DEFAULT '',
  `amount_font_size` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT '12pt',
  `amount_is_italic` VARCHAR(55) COLLATE latin1_swedish_ci DEFAULT 'normal',
  `amount_is_bold` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT 'bold',
  `date_pos_left` DECIMAL(20,4) DEFAULT 0.0000,
  `date_pos_top` DECIMAL(20,4) DEFAULT 0.0000,
  `date_font_family` VARCHAR(555) COLLATE latin1_swedish_ci DEFAULT '',
  `date_font_size` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT '12pt',
  `date_is_italic` VARCHAR(55) COLLATE latin1_swedish_ci DEFAULT 'normal',
  `date_is_bold` VARCHAR(55) COLLATE latin1_swedish_ci DEFAULT 'bold',
  `is_portrait` BIT(1) DEFAULT 1,
  `posted_by_user` BIGINT(20) DEFAULT 0,
  `date_posted` DATETIME DEFAULT '0000-00-00 00:00:00',
  `modified_by_user` BIGINT(20) DEFAULT 0,
  `date_modified` DATETIME DEFAULT '0000-00-00 00:00:00',
  `deleted_by_user` BIGINT(20) DEFAULT 0,
  `date_deleted` DATETIME DEFAULT '0000-00-00 00:00:00',
  `is_active` BIT(1) DEFAULT 1,
  `is_deleted` BIT(1) DEFAULT 0,
  PRIMARY KEY USING BTREE (`check_layout_id`)
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

/* Structure for the `customer_photos` table : */

CREATE TABLE `customer_photos` (
  `photo_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `customer_id` INTEGER(11) DEFAULT 0,
  `photo_path` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`photo_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=30 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `customers` table : */

CREATE TABLE `customers` (
  `customer_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `customer_code` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT '',
  `customer_name` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT '',
  `contact_name` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT '',
  `address` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT '',
  `email_address` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT '',
  `contact_no` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT '',
  `term` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT '',
  `department_id` BIGINT(20) DEFAULT 0,
  `link_department_id` INTEGER(11) DEFAULT 0,
  `refcustomertype_id` BIGINT(20) DEFAULT 0,
  `tin_no` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT '',
  `photo_path` VARCHAR(500) COLLATE latin1_swedish_ci DEFAULT '',
  `total_receivable_amount` DECIMAL(19,2) DEFAULT 0.00,
  `date_created` DATETIME DEFAULT '0000-00-00 00:00:00',
  `date_modified` DATETIME DEFAULT '0000-00-00 00:00:00',
  `date_deleted` DATETIME DEFAULT '0000-00-00 00:00:00',
  `posted_by_user` INTEGER(11) DEFAULT 0,
  `credit_limit` DECIMAL(20,4) DEFAULT 0.0000,
  `modified_by_user` INTEGER(11) DEFAULT 0,
  `deleted_by_user` INTEGER(11) DEFAULT 0,
  `is_paid` BIT(1) DEFAULT 0,
  `is_deleted` BIT(1) DEFAULT 0,
  `is_active` BIT(1) DEFAULT 1,
  PRIMARY KEY USING BTREE (`customer_id`)
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
AUTO_INCREMENT=3 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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

/* Structure for the `discounts` table : */

CREATE TABLE `discounts` (
  `discount_id` BIGINT(100) NOT NULL AUTO_INCREMENT,
  `discount_code` BIGINT(100) DEFAULT NULL,
  `discount_type` VARCHAR(200) COLLATE latin1_swedish_ci DEFAULT NULL,
  `discount_desc` VARCHAR(200) COLLATE latin1_swedish_ci DEFAULT NULL,
  `discount_percent` BIGINT(100) DEFAULT NULL,
  `discount_amount` BIGINT(100) DEFAULT NULL,
  `is_deleted` BIT(1) DEFAULT 0,
  `is_active` BIT(1) DEFAULT 1,
  PRIMARY KEY USING BTREE (`discount_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `fixed_assets` table : */

CREATE TABLE `fixed_assets` (
  `fixed_asset_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `asset_code` VARCHAR(55) COLLATE latin1_swedish_ci DEFAULT '',
  `asset_description` VARCHAR(555) COLLATE latin1_swedish_ci DEFAULT '',
  `serial_no` VARCHAR(155) COLLATE latin1_swedish_ci DEFAULT '',
  `location_id` INTEGER(11) DEFAULT 0,
  `department_id` INTEGER(11) DEFAULT 0,
  `category_id` INTEGER(11) DEFAULT 0,
  `acquisition_cost` DECIMAL(20,4) DEFAULT 0.0000,
  `salvage_value` DECIMAL(20,4) DEFAULT 0.0000,
  `life_years` INTEGER(11) DEFAULT 0,
  `asset_status_id` INTEGER(11) DEFAULT 0,
  `date_acquired` DATE DEFAULT '0000-00-00',
  `remarks` VARCHAR(1000) COLLATE latin1_swedish_ci DEFAULT NULL,
  `date_posted` DATETIME DEFAULT '0000-00-00 00:00:00',
  `posted_by_user` INTEGER(11) DEFAULT 0,
  `date_modified` DATETIME DEFAULT '0000-00-00 00:00:00',
  `modified_by_user` INTEGER(11) DEFAULT 0,
  `date_deleted` DATETIME DEFAULT '0000-00-00 00:00:00',
  `deleted_by_user` INTEGER(11) DEFAULT 0,
  `is_deleted` TINYINT(1) DEFAULT 0,
  `is_active` TINYINT(1) DEFAULT 1,
  PRIMARY KEY USING BTREE (`fixed_asset_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=12 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `generics` table : */

CREATE TABLE `generics` (
  `generic_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `generic_name` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT NULL,
  `is_deleted` BIT(1) DEFAULT 0,
  `is_active` BIT(1) DEFAULT 1,
  PRIMARY KEY USING BTREE (`generic_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `giftcards` table : */

CREATE TABLE `giftcards` (
  `giftcard_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `giftcard_name` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT NULL,
  `is_deleted` BIT(1) DEFAULT 0,
  `is_active` BIT(1) DEFAULT 1,
  PRIMARY KEY USING BTREE (`giftcard_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `invoice_counter` table : */

CREATE TABLE `invoice_counter` (
  `counter_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `user_id` INTEGER(11) DEFAULT NULL,
  `counter_start` BIGINT(20) DEFAULT 0,
  `counter_end` BIGINT(20) DEFAULT 0,
  `last_invoice` BIGINT(20) DEFAULT 0,
  PRIMARY KEY USING BTREE (`counter_id`),
  UNIQUE KEY `user_id` USING BTREE (`user_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=17 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
AUTO_INCREMENT=4 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `journal_accounts` table : */

CREATE TABLE `journal_accounts` (
  `journal_account_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `journal_id` BIGINT(20) DEFAULT 0,
  `account_id` INTEGER(11) DEFAULT 0,
  `memo` VARCHAR(700) COLLATE latin1_swedish_ci DEFAULT '',
  `dr_amount` DECIMAL(25,2) DEFAULT 0.00,
  `cr_amount` DECIMAL(25,2) DEFAULT 0.00,
  PRIMARY KEY USING BTREE (`journal_account_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=4 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `journal_entry_templates` table : */

CREATE TABLE `journal_entry_templates` (
  `entry_template_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `template_id` BIGINT(20) DEFAULT 0,
  `account_id` BIGINT(20) DEFAULT 0,
  `memo` VARCHAR(1000) COLLATE latin1_swedish_ci DEFAULT '',
  `dr_amount` DECIMAL(20,4) DEFAULT 0.0000,
  `cr_amount` DECIMAL(20,4) DEFAULT 0.0000,
  PRIMARY KEY USING BTREE (`entry_template_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=3 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `journal_info` table : */

CREATE TABLE `journal_info` (
  `journal_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `txn_no` VARCHAR(55) COLLATE latin1_swedish_ci DEFAULT '',
  `department_id` INTEGER(11) DEFAULT 0,
  `customer_id` INTEGER(11) DEFAULT 0,
  `supplier_id` INTEGER(11) DEFAULT 0,
  `remarks` VARCHAR(555) COLLATE latin1_swedish_ci DEFAULT '',
  `book_type` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT '',
  `date_txn` DATE DEFAULT '0000-00-00',
  `date_created` DATETIME DEFAULT '0000-00-00 00:00:00',
  `created_by_user` INTEGER(11) DEFAULT 0,
  `date_modified` DATETIME DEFAULT '0000-00-00 00:00:00',
  `modified_by_user` DATETIME DEFAULT '0000-00-00 00:00:00',
  `date_deleted` DATETIME DEFAULT '0000-00-00 00:00:00',
  `deleted_by_user` INTEGER(11) DEFAULT 0,
  `date_cancelled` DATETIME DEFAULT '0000-00-00 00:00:00',
  `cancelled_by_user` INTEGER(11) DEFAULT 0,
  `is_deleted` BIT(1) DEFAULT 0,
  `is_active` BIT(1) DEFAULT 1,
  `payment_method_id` INTEGER(11) DEFAULT 0,
  `bank` VARCHAR(10) COLLATE latin1_swedish_ci DEFAULT '',
  `check_no` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT '',
  `check_date` DATE DEFAULT '0000-00-00',
  `ref_type` VARCHAR(4) COLLATE latin1_swedish_ci DEFAULT '',
  `ref_no` VARCHAR(15) COLLATE latin1_swedish_ci DEFAULT '',
  `amount` DECIMAL(10,2) DEFAULT 0.00,
  `or_no` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT '',
  `check_status` TINYINT(4) DEFAULT 0,
  `accounting_period_id` BIGINT(20) DEFAULT 0,
  `is_replenished` TINYINT(1) DEFAULT 0,
  `batch_id` INTEGER(11) DEFAULT 0,
  PRIMARY KEY USING BTREE (`journal_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=2 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `journal_templates_info` table : */

CREATE TABLE `journal_templates_info` (
  `template_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `template_code` VARCHAR(155) COLLATE latin1_swedish_ci DEFAULT '',
  `payee` VARCHAR(1000) COLLATE latin1_swedish_ci DEFAULT '',
  `template_description` VARCHAR(1000) COLLATE latin1_swedish_ci DEFAULT '',
  `supplier_id` BIGINT(20) DEFAULT 0,
  `customer_id` BIGINT(20) DEFAULT 0,
  `method_id` BIGINT(20) DEFAULT 0,
  `amount` DECIMAL(20,4) DEFAULT 0.0000,
  `remarks` VARCHAR(1000) COLLATE latin1_swedish_ci DEFAULT '',
  `posted_by` INTEGER(11) DEFAULT NULL,
  `book_type` VARCHAR(5) COLLATE latin1_swedish_ci DEFAULT '',
  `is_active` TINYINT(1) DEFAULT 1,
  `is_deleted` TINYINT(1) DEFAULT 0,
  PRIMARY KEY USING BTREE (`template_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=2 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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

/* Structure for the `other_sales_invoice` table : */

CREATE TABLE `other_sales_invoice` (
  `sales_invoice_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sales_inv_no` VARCHAR(75) COLLATE latin1_swedish_ci DEFAULT '',
  `sales_order_id` BIGINT(20) DEFAULT 0,
  `sales_order_no` VARCHAR(75) COLLATE latin1_swedish_ci DEFAULT '',
  `department_id` INTEGER(11) DEFAULT 0,
  `customer_id` INTEGER(11) DEFAULT 0,
  `journal_id` BIGINT(20) DEFAULT 0,
  `remarks` VARCHAR(755) COLLATE latin1_swedish_ci DEFAULT '',
  `total_discount` DECIMAL(20,2) DEFAULT 0.00,
  `total_before_tax` DECIMAL(20,2) DEFAULT 0.00,
  `total_tax_amount` DECIMAL(20,2) DEFAULT 0.00,
  `total_after_tax` DECIMAL(20,2) DEFAULT 0.00,
  `date_due` DATE DEFAULT '0000-00-00',
  `date_invoice` DATE DEFAULT '0000-00-00',
  `date_created` DATETIME DEFAULT '0000-00-00 00:00:00',
  `date_deleted` DATETIME DEFAULT '0000-00-00 00:00:00',
  `date_modified` TIMESTAMP NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `posted_by_user` INTEGER(11) DEFAULT 0,
  `deleted_by_user` INTEGER(11) DEFAULT 0,
  `modified_by_user` INTEGER(11) DEFAULT 0,
  `is_paid` BIT(1) DEFAULT 0,
  `is_active` BIT(1) DEFAULT 1,
  `is_deleted` BIT(1) DEFAULT 0,
  `is_journal_posted` BIT(1) DEFAULT 0,
  `ref_product_type_id` INTEGER(11) DEFAULT NULL,
  PRIMARY KEY USING BTREE (`sales_invoice_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=2 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `other_sales_invoice_items` table : */

CREATE TABLE `other_sales_invoice_items` (
  `sales_item_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sales_invoice_id` BIGINT(20) DEFAULT 0,
  `product_id` INTEGER(11) DEFAULT 0,
  `unit_id` INTEGER(11) DEFAULT 0,
  `inv_price` DECIMAL(20,2) DEFAULT 0.00,
  `inv_discount` DECIMAL(20,2) DEFAULT 0.00,
  `inv_line_total_discount` DECIMAL(20,2) DEFAULT 0.00,
  `inv_tax_rate` DECIMAL(20,2) DEFAULT 0.00,
  `inv_qty` DECIMAL(20,0) DEFAULT 0,
  `inv_line_total_price` DECIMAL(20,2) DEFAULT 0.00,
  `inv_tax_amount` DECIMAL(20,2) DEFAULT 0.00,
  `inv_non_tax_amount` DECIMAL(20,2) DEFAULT 0.00,
  `inv_notes` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dr_invoice_id` INTEGER(11) DEFAULT NULL,
  `exp_date` DATE DEFAULT NULL,
  PRIMARY KEY USING BTREE (`sales_item_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=93 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
AUTO_INCREMENT=111 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `product_batch_inventory` table : */

CREATE TABLE `product_batch_inventory` (
  `product_key` VARCHAR(100) COLLATE latin1_swedish_ci NOT NULL,
  `product_id` BIGINT(20) DEFAULT 0,
  `batch_no` VARCHAR(55) COLLATE latin1_swedish_ci DEFAULT '',
  `exp_date` DATE DEFAULT '0000-00-00',
  `batch_exp_on_hand` DECIMAL(20,2) DEFAULT 0.00,
  PRIMARY KEY USING BTREE (`product_key`),
  UNIQUE KEY `product_key` USING BTREE (`product_key`)
) ENGINE=InnoDB
CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
AUTO_INCREMENT=2 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
AUTO_INCREMENT=2 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
AUTO_INCREMENT=2 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `receivable_payments` table : */

CREATE TABLE `receivable_payments` (
  `payment_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `receipt_no` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT '',
  `customer_id` INTEGER(11) DEFAULT 0,
  `journal_id` BIGINT(20) DEFAULT 0,
  `receipt_type` VARCHAR(55) COLLATE latin1_swedish_ci DEFAULT 'AR',
  `department_id` INTEGER(11) DEFAULT 0,
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
  `is_posted` BIT(1) DEFAULT 0,
  `is_active` BIT(1) DEFAULT 1,
  `is_deleted` BIT(1) DEFAULT 0,
  PRIMARY KEY USING BTREE (`payment_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `receivable_payments_list` table : */

CREATE TABLE `receivable_payments_list` (
  `payment_list_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `payment_id` BIGINT(20) DEFAULT 0,
  `sales_invoice_id` BIGINT(20) DEFAULT 0,
  `receivable_amount` DECIMAL(20,2) DEFAULT 0.00,
  `payment_amount` DECIMAL(20,2) DEFAULT 0.00,
  PRIMARY KEY USING BTREE (`payment_list_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `refcustomertype` table : */

CREATE TABLE `refcustomertype` (
  `refcustomertype_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `customer_type` VARCHAR(255) COLLATE latin1_swedish_ci NOT NULL,
  `description` VARCHAR(255) COLLATE latin1_swedish_ci NOT NULL,
  `created_by_user_id` INTEGER(11) NOT NULL,
  `modified_by_user_id` INTEGER(11) NOT NULL,
  `date_created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` TINYINT(1) NOT NULL,
  PRIMARY KEY USING BTREE (`refcustomertype_id`)
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

/* Structure for the `rights_links` table : */

CREATE TABLE `rights_links` (
  `link_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `parent_code` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT '',
  `link_code` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `link_name` VARCHAR(255) COLLATE latin1_swedish_ci DEFAULT '',
  PRIMARY KEY USING BTREE (`link_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=51 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `sales_invoice` table : */

CREATE TABLE `sales_invoice` (
  `sales_invoice_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sales_inv_no` VARCHAR(75) COLLATE latin1_swedish_ci DEFAULT '',
  `sales_order_id` BIGINT(20) DEFAULT 0,
  `sales_order_no` VARCHAR(75) COLLATE latin1_swedish_ci DEFAULT '',
  `department_id` INTEGER(11) DEFAULT 0,
  `issue_to_department` INTEGER(11) DEFAULT 0,
  `customer_id` INTEGER(11) DEFAULT 0,
  `journal_id` BIGINT(20) DEFAULT 0,
  `terms` INTEGER(11) DEFAULT 0,
  `remarks` VARCHAR(755) COLLATE latin1_swedish_ci DEFAULT '',
  `total_discount` DECIMAL(20,4) DEFAULT 0.0000,
  `total_before_tax` DECIMAL(20,4) DEFAULT 0.0000,
  `total_tax_amount` DECIMAL(20,4) DEFAULT 0.0000,
  `total_after_tax` DECIMAL(20,4) DEFAULT 0.0000,
  `date_due` DATE DEFAULT '0000-00-00',
  `date_invoice` DATE DEFAULT '0000-00-00',
  `date_created` DATETIME DEFAULT '0000-00-00 00:00:00',
  `date_deleted` DATETIME DEFAULT '0000-00-00 00:00:00',
  `date_modified` TIMESTAMP NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `posted_by_user` INTEGER(11) DEFAULT 0,
  `deleted_by_user` INTEGER(11) DEFAULT 0,
  `modified_by_user` INTEGER(11) DEFAULT 0,
  `is_paid` BIT(1) DEFAULT 0,
  `is_active` BIT(1) DEFAULT 1,
  `is_deleted` BIT(1) DEFAULT 0,
  `is_journal_posted` BIT(1) DEFAULT 0,
  `ref_product_type_id` INTEGER(11) DEFAULT 0,
  `inv_type` INTEGER(11) DEFAULT 1,
  `salesperson_id` INTEGER(11) DEFAULT 0,
  `address` VARCHAR(150) COLLATE latin1_swedish_ci DEFAULT '',
  PRIMARY KEY USING BTREE (`sales_invoice_id`),
  UNIQUE KEY `sales_inv_no` USING BTREE (`sales_inv_no`)
) ENGINE=InnoDB
AUTO_INCREMENT=2 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `sales_invoice_items` table : */

CREATE TABLE `sales_invoice_items` (
  `sales_item_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sales_invoice_id` BIGINT(20) DEFAULT 0,
  `product_id` INTEGER(11) DEFAULT 0,
  `unit_id` INTEGER(11) DEFAULT 0,
  `inv_price` DECIMAL(20,4) DEFAULT 0.0000,
  `orig_so_price` DECIMAL(20,4) DEFAULT 0.0000,
  `inv_discount` DECIMAL(20,4) DEFAULT 0.0000,
  `inv_line_total_discount` DECIMAL(20,4) DEFAULT 0.0000,
  `inv_tax_rate` DECIMAL(20,4) DEFAULT 0.0000,
  `cost_upon_invoice` DECIMAL(20,4) DEFAULT 0.0000,
  `inv_qty` DECIMAL(20,0) DEFAULT 0,
  `inv_line_total_price` DECIMAL(20,4) DEFAULT 0.0000,
  `inv_tax_amount` DECIMAL(20,4) DEFAULT 0.0000,
  `inv_non_tax_amount` DECIMAL(20,4) DEFAULT 0.0000,
  `inv_notes` VARCHAR(100) COLLATE latin1_swedish_ci DEFAULT NULL,
  `dr_invoice_id` INTEGER(11) DEFAULT NULL,
  `exp_date` DATE DEFAULT '0000-00-00',
  `batch_no` VARCHAR(55) COLLATE latin1_swedish_ci DEFAULT '',
  PRIMARY KEY USING BTREE (`sales_item_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=2 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `sales_order` table : */

CREATE TABLE `sales_order` (
  `sales_order_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `so_no` VARCHAR(75) COLLATE latin1_swedish_ci DEFAULT '',
  `customer_id` BIGINT(20) DEFAULT 0,
  `department_id` INTEGER(11) DEFAULT 0,
  `remarks` VARCHAR(755) COLLATE latin1_swedish_ci DEFAULT '',
  `total_discount` DECIMAL(20,2) DEFAULT 0.00,
  `total_before_tax` DECIMAL(20,2) DEFAULT 0.00,
  `total_after_tax` DECIMAL(20,2) DEFAULT 0.00,
  `total_tax_amount` DECIMAL(20,2) DEFAULT 0.00,
  `order_status_id` INTEGER(11) DEFAULT 1,
  `date_order` DATE DEFAULT '0000-00-00',
  `date_created` DATETIME DEFAULT '0000-00-00 00:00:00',
  `date_deleted` DATETIME DEFAULT NULL,
  `date_modified` DATETIME DEFAULT '0000-00-00 00:00:00',
  `posted_by_user` INTEGER(11) DEFAULT 0,
  `modified_by_user` INTEGER(11) DEFAULT 0,
  `deleted_by_user` INTEGER(11) DEFAULT 0,
  `is_active` BIT(1) DEFAULT 1,
  `is_deleted` BIT(1) DEFAULT 0,
  `salesperson_id` INTEGER(11) DEFAULT 0,
  PRIMARY KEY USING BTREE (`sales_order_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `sales_order_items` table : */

CREATE TABLE `sales_order_items` (
  `sales_order_item_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sales_order_id` BIGINT(20) DEFAULT NULL,
  `product_id` INTEGER(11) DEFAULT 0,
  `unit_id` INTEGER(11) DEFAULT NULL,
  `so_qty` DECIMAL(20,0) DEFAULT 0,
  `so_price` DECIMAL(20,4) DEFAULT 0.0000,
  `so_discount` DECIMAL(20,4) DEFAULT 0.0000,
  `so_line_total_discount` DECIMAL(20,4) DEFAULT 0.0000,
  `so_tax_rate` DECIMAL(20,4) DEFAULT 0.0000,
  `so_line_total_price` DECIMAL(20,4) DEFAULT 0.0000,
  `so_tax_amount` DECIMAL(20,4) DEFAULT 0.0000,
  `so_non_tax_amount` DECIMAL(20,4) DEFAULT 0.0000,
  `exp_date` DATE DEFAULT '0000-00-00',
  `dr_invoice_id` INTEGER(11) DEFAULT NULL,
  `batch_no` VARCHAR(55) COLLATE latin1_swedish_ci DEFAULT '',
  PRIMARY KEY USING BTREE (`sales_order_item_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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

/* Structure for the `sched_expense_integration` table : */

CREATE TABLE `sched_expense_integration` (
  `sched_expense_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `account_id` BIGINT(20) DEFAULT 0,
  `group_id` INTEGER(11) DEFAULT 0,
  PRIMARY KEY USING BTREE (`sched_expense_id`),
  UNIQUE KEY `account_id` USING BTREE (`account_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
AUTO_INCREMENT=3 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
AUTO_INCREMENT=32 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Structure for the `user_group_rights` table : */

CREATE TABLE `user_group_rights` (
  `user_rights_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `user_group_id` INTEGER(11) DEFAULT 0,
  `link_code` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT '',
  PRIMARY KEY USING BTREE (`user_rights_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=231 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
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
AUTO_INCREMENT=7 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Data for the `account_classes` table  (LIMIT 0,500) */

INSERT INTO `account_classes` (`account_class_id`, `account_class`, `description`, `account_type_id`, `date_created`, `date_modified`, `date_deleted`, `created_by_user`, `modified_by_user`, `deleted_by_user`, `is_active`, `is_deleted`) VALUES
  (1,'Current Assets','',1,'0000-00-00 00:00:00','0000-00-00','0000-00-00 00:00:00',0,0,0,1,0),
  (2,'Non-Current Assets','',1,'0000-00-00 00:00:00','0000-00-00','0000-00-00 00:00:00',0,0,0,1,0),
  (3,'Current Liabilities','',2,'0000-00-00 00:00:00','0000-00-00','0000-00-00 00:00:00',0,0,0,1,0),
  (4,'Long-term Liabilities','',2,'0000-00-00 00:00:00','0000-00-00','0000-00-00 00:00:00',0,0,0,1,0),
  (5,'Owners Equity','',3,'0000-00-00 00:00:00','0000-00-00','0000-00-00 00:00:00',0,0,0,1,0),
  (6,'Selling Expenses','',5,'0000-00-00 00:00:00','2017-02-04','0000-00-00 00:00:00',0,19,0,1,0),
  (7,'Income','',4,'0000-00-00 00:00:00','0000-00-00','0000-00-00 00:00:00',0,0,0,1,0),
  (8,'Non-Current Assets','',1,'2016-09-23 14:44:53','0000-00-00','0000-00-00 00:00:00',1,0,0,1,1),
  (9,'Property, Plant and Equipment','',1,'2016-11-29 10:23:07','2016-12-09','0000-00-00 00:00:00',1,1,0,1,0),
  (10,'Other Asset','',1,'2016-11-29 10:44:09','0000-00-00','0000-00-00 00:00:00',1,0,0,1,0),
  (11,'Contra Asset','',1,'2016-11-29 10:47:36','2016-12-09','0000-00-00 00:00:00',1,1,0,1,0),
  (12,'COS','',5,'2016-11-29 11:26:03','2016-12-15','0000-00-00 00:00:00',1,1,0,1,0),
  (13,'General and Administrative Expenses','',5,'2016-11-29 11:27:53','0000-00-00','0000-00-00 00:00:00',1,0,0,1,0),
  (14,'','',NULL,'2016-12-08 17:39:51','0000-00-00','0000-00-00 00:00:00',1,0,0,1,1),
  (15,'Test','test',3,'2016-12-09 11:31:27','0000-00-00','0000-00-00 00:00:00',1,0,0,1,1),
  (16,'test','test',4,'2016-12-09 11:36:27','0000-00-00','0000-00-00 00:00:00',1,0,0,1,1),
  (17,'Test','',NULL,'2016-12-09 12:23:18','0000-00-00','0000-00-00 00:00:00',1,0,0,1,1),
  (18,'Test Income','',4,'2016-12-09 12:29:15','0000-00-00','0000-00-00 00:00:00',1,0,0,1,1),
  (19,'Test Asset','',1,'2016-12-09 12:33:30','0000-00-00','0000-00-00 00:00:00',1,0,0,1,1),
  (20,'test','test',3,'2016-12-09 13:15:31','0000-00-00','0000-00-00 00:00:00',1,0,0,1,1),
  (21,'123','',3,'2016-12-09 13:16:10','0000-00-00','0000-00-00 00:00:00',1,0,0,1,1),
  (22,'test','',3,'2016-12-09 13:20:03','0000-00-00','0000-00-00 00:00:00',1,0,0,1,1),
  (23,'Test3','',3,'2016-12-09 13:21:59','0000-00-00','0000-00-00 00:00:00',1,0,0,1,1),
  (24,'test','',5,'2016-12-09 13:23:05','0000-00-00','0000-00-00 00:00:00',1,0,0,1,1),
  (25,'text','',3,'2016-12-09 13:36:48','0000-00-00','0000-00-00 00:00:00',1,0,0,1,1),
  (26,'gs','',1,'2016-12-09 13:37:35','0000-00-00','0000-00-00 00:00:00',1,0,0,1,1),
  (27,'asdsad','',3,'2016-12-09 13:38:17','0000-00-00','0000-00-00 00:00:00',1,0,0,1,1),
  (28,'test','',3,'2016-12-09 13:40:18','0000-00-00','0000-00-00 00:00:00',1,0,0,1,1),
  (29,'Test','',4,'2016-12-09 13:46:43','0000-00-00','0000-00-00 00:00:00',1,0,0,1,1),
  (30,'JK testst','',2,'2016-12-09 13:48:11','2016-12-09','0000-00-00 00:00:00',1,1,0,1,1),
  (31,'DamDam','',4,'2016-12-09 13:50:17','0000-00-00','0000-00-00 00:00:00',1,0,0,1,1),
  (32,'Ice Plant','',3,'2016-12-09 13:50:57','0000-00-00','0000-00-00 00:00:00',1,0,0,1,1),
  (33,'Operating Expenses','',5,'2017-02-14 16:17:49','2017-02-14','0000-00-00 00:00:00',19,19,0,1,0),
  (34,'c','c',1,'2017-06-16 15:27:08','0000-00-00','0000-00-00 00:00:00',12,0,0,1,0);
COMMIT;

/* Data for the `account_integration` table  (LIMIT 0,500) */

INSERT INTO `account_integration` (`integration_id`, `input_tax_account_id`, `payable_account_id`, `payable_discount_account_id`, `payment_to_supplier_id`, `output_tax_account_id`, `receivable_account_id`, `receivable_discount_account_id`, `payment_from_customer_id`, `retained_earnings_id`, `petty_cash_account_id`) VALUES
  (1,10,4,12,1,11,2,12,1,5,13);
COMMIT;

/* Data for the `account_titles` table  (LIMIT 0,500) */

INSERT INTO `account_titles` (`account_id`, `account_no`, `account_title`, `account_class_id`, `parent_account_id`, `grand_parent_id`, `description`, `date_created`, `date_modified`, `date_deleted`, `created_by_user`, `modified_by_user`, `deleted_by_user`, `is_active`, `is_deleted`) VALUES
  (1,'101','Cash',1,0,1,'','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,1,0),
  (2,'120','Account Receivable',1,0,2,'','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,1,0),
  (3,'140','Inventory',1,0,3,'','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,1,0),
  (4,'210','Accounts Payable',3,0,4,'','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,1,0),
  (5,'300','Capital',5,0,5,'','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,1,0),
  (6,'400','Sales Income',7,0,6,'','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,1,0),
  (7,'410','Service Income',7,0,7,'','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,1,0),
  (8,'500','Salaries Expense',6,0,8,'','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,1,0),
  (9,'510','Supplies Expense',6,0,9,'','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,1,0),
  (10,'150','Input Tax',1,0,10,'','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,1,0),
  (11,'220','Output Tax',3,0,4,'','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,1,0),
  (12,'510','Miscellaneous Expense',6,0,12,'','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,1,0),
  (13,'160','Petty Cash',1,0,13,'','2017-04-19 14:42:10','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,1,0),
  (14,'f','f',1,1,1,'','2017-06-16 15:36:37','0000-00-00 00:00:00','0000-00-00 00:00:00',12,0,0,1,0);
COMMIT;

/* Data for the `account_types` table  (LIMIT 0,500) */

INSERT INTO `account_types` (`account_type_id`, `account_type`, `description`) VALUES
  (1,'Asset',''),
  (2,'Liability',''),
  (3,'Capital',''),
  (4,'Income',''),
  (5,'Expense','');
COMMIT;

/* Data for the `account_year` table  (LIMIT 0,500) */

INSERT INTO `account_year` (`account_year_id`, `account_year`, `description`, `status`, `date_created`, `created_by_user`, `date_closed`, `closed_by_user`) VALUES
  (1,'2016','',NULL,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0);
COMMIT;

/* Data for the `accounting_period` table  (LIMIT 0,500) */

INSERT INTO `accounting_period` (`accounting_period_id`, `period_start`, `period_end`, `closed_by_user`, `date_time_closed`, `remarks`) VALUES
  (1,'2017-06-16','2017-06-19',12,'2017-06-19 09:40:45','test');
COMMIT;

/* Data for the `approval_status` table  (LIMIT 0,500) */

INSERT INTO `approval_status` (`approval_id`, `approval_status`, `approval_description`, `is_active`, `is_deleted`) VALUES
  (1,'Approved','',1,0),
  (2,'Pending','',1,0);
COMMIT;

/* Data for the `asset_property_status` table  (LIMIT 0,500) */

INSERT INTO `asset_property_status` (`asset_status_id`, `asset_property_status`, `is_active`, `is_deleted`) VALUES
  (1,'Active',1,0),
  (2,'Inactive',1,0),
  (3,'Obsolete',1,0),
  (4,'Lost',1,0),
  (5,'Damage',1,0);
COMMIT;

/* Data for the `batch_info` table  (LIMIT 0,500) */

INSERT INTO `batch_info` (`batch_id`, `batch_no`, `date_replenished`, `replenished_by`) VALUES
  (1,'PCVB-20170424-1','2017-04-24 12:33:40',1),
  (2,'PCVB-20170424-2','2017-04-24 12:42:12',1),
  (3,'PCVB-20170424-3','2017-04-24 12:55:24',1);
COMMIT;

/* Data for the `brands` table  (LIMIT 0,500) */

INSERT INTO `brands` (`brand_id`, `brand_name`, `is_deleted`, `is_active`) VALUES
  (2,'FFF',0,0),
  (3,'ddd',0,1);
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
  (10,NULL,'xx','xx',NULL,'0000-00-00 00:00:00',0,1);
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

/* Data for the `customer_photos` table  (LIMIT 0,500) */

INSERT INTO `customer_photos` (`photo_id`, `customer_id`, `photo_path`) VALUES
  (2,2,NULL),
  (4,2,NULL),
  (5,3,NULL),
  (6,4,NULL),
  (7,5,NULL),
  (8,6,NULL),
  (9,7,NULL),
  (10,8,NULL),
  (11,9,NULL),
  (13,2,NULL),
  (14,3,'assets/img/anonymous-icon.png'),
  (15,4,'assets/img/anonymous-icon.png'),
  (16,5,'assets/img/anonymous-icon.png'),
  (17,6,'assets/img/anonymous-icon.png'),
  (18,7,'assets/img/anonymous-icon.png'),
  (19,8,'assets/img/anonymous-icon.png'),
  (20,9,'assets/img/anonymous-icon.png'),
  (21,10,'assets/img/anonymous-icon.png'),
  (22,11,'assets/img/anonymous-icon.png'),
  (24,2,'assets/img/anonymous-icon.png'),
  (25,3,'assets/img/anonymous-icon.png'),
  (26,4,'assets/img/anonymous-icon.png'),
  (28,1,'assets/img/customer/5943883821785.png'),
  (29,1,NULL);
COMMIT;

/* Data for the `customers` table  (LIMIT 0,500) */

INSERT INTO `customers` (`customer_id`, `customer_code`, `customer_name`, `contact_name`, `address`, `email_address`, `contact_no`, `term`, `department_id`, `link_department_id`, `refcustomertype_id`, `tin_no`, `photo_path`, `total_receivable_amount`, `date_created`, `date_modified`, `date_deleted`, `posted_by_user`, `credit_limit`, `modified_by_user`, `deleted_by_user`, `is_paid`, `is_deleted`, `is_active`) VALUES
  (1,'','d','d','d','',NULL,NULL,NULL,0,NULL,NULL,NULL,0.00,'2017-06-19 14:08:48','0000-00-00 00:00:00','0000-00-00 00:00:00',12,NULL,0,0,0,0,1);
COMMIT;

/* Data for the `delivery_invoice` table  (LIMIT 0,500) */

INSERT INTO `delivery_invoice` (`dr_invoice_id`, `dr_invoice_no`, `purchase_order_id`, `external_ref_no`, `contact_person`, `terms`, `duration`, `supplier_id`, `department_id`, `tax_type_id`, `journal_id`, `remarks`, `total_discount`, `total_before_tax`, `total_tax_amount`, `total_after_tax`, `is_active`, `is_deleted`, `is_paid`, `is_journal_posted`, `date_due`, `date_delivered`, `date_created`, `date_modified`, `date_deleted`, `posted_by_user`, `modified_by_user`, `deleted_by_user`, `batch_no`) VALUES
  (1,'P-INV-20170616-1',0,'','','','',2,3,2,1,'remarks',0.0000,3928.5714,471.4286,4400.0000,1,0,0,1,'2017-06-16','2017-06-16','2017-06-16 17:14:00','2017-06-16 17:15:01','0000-00-00 00:00:00',12,0,0,NULL),
  (2,'P-INV-20170619-2',0,'','SH','','',2,2,1,0,'ddd',0.0000,1914.2900,85.7100,2000.0000,1,0,0,0,'2017-06-19','2017-06-19','2017-06-19 09:44:42','2017-06-19 09:47:12','0000-00-00 00:00:00',12,12,0,NULL);
COMMIT;

/* Data for the `delivery_invoice_items` table  (LIMIT 0,500) */

INSERT INTO `delivery_invoice_items` (`dr_invoice_item_id`, `dr_invoice_id`, `product_id`, `unit_id`, `dr_qty`, `dr_discount`, `dr_price`, `dr_line_total_discount`, `dr_line_total_price`, `dr_tax_rate`, `dr_tax_amount`, `dr_non_tax_amount`, `exp_date`, `batch_no`) VALUES
  (1,1,1,1,11,0.0000,400.0000,0.0000,4400.0000,12.0000,471.4286,3928.5714,'1970-01-01',NULL),
  (5,2,2,2,1,0.0000,1200.0000,0.0000,1200.0000,0.0000,0.0000,1200.0000,'1970-01-01',NULL),
  (6,2,1,1,2,0.0000,400.0000,0.0000,800.0000,12.0000,85.7100,714.2900,'1970-01-01',NULL);
COMMIT;

/* Data for the `departments` table  (LIMIT 0,500) */

INSERT INTO `departments` (`department_id`, `department_code`, `department_name`, `department_desc`, `delivery_address`, `default_cost`, `date_created`, `date_modified`, `is_deleted`, `is_active`) VALUES
  (1,'','Admin','',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,1),
  (2,'','IT Deparment','',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,1),
  (3,'','Kitchen','Kitchen',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,1);
COMMIT;

/* Data for the `fixed_assets` table  (LIMIT 0,500) */

INSERT INTO `fixed_assets` (`fixed_asset_id`, `asset_code`, `asset_description`, `serial_no`, `location_id`, `department_id`, `category_id`, `acquisition_cost`, `salvage_value`, `life_years`, `asset_status_id`, `date_acquired`, `remarks`, `date_posted`, `posted_by_user`, `date_modified`, `modified_by_user`, `date_deleted`, `deleted_by_user`, `is_deleted`, `is_active`) VALUES
  (5,'787465','Desktop Computer','795563',4,35,30,4500.0000,1222.0000,7,1,'2017-03-23','asdasd','2017-03-21 14:25:55',1,'2017-03-22 16:16:11',1,'0000-00-00 00:00:00',0,0,1),
  (6,'213123','ACER Laptop','1231241',8,1,1,8000.0000,2500.0000,12,2,'2017-03-21','aaa','2017-03-21 14:49:10',1,'2017-03-22 16:16:27',1,'0000-00-00 00:00:00',0,0,1),
  (7,'','','',NULL,NULL,NULL,1000.0000,5000.2500,0,NULL,'1970-01-01','','2017-03-21 15:37:42',1,'0000-00-00 00:00:00',0,'2017-03-21 15:46:11',1,1,1),
  (8,'12321','Electric Fan','899633',12,36,36,6000.0000,100.0000,10,1,'2017-03-24','','2017-03-21 16:03:14',1,'2017-03-22 11:35:04',1,'0000-00-00 00:00:00',0,0,1),
  (9,'112','Motor Vehicle','455',2,37,37,100000.0000,50.0000,10,1,'2016-12-01','Brought Last December','2017-03-22 11:54:34',1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,1),
  (10,'5222','Delivery Van','322-789-456',12,37,37,200000.0000,85000.0000,12,1,'2017-04-28','','2017-03-22 15:34:15',1,'2017-03-22 15:58:37',1,'0000-00-00 00:00:00',0,0,1),
  (11,'1001','Bike','123',1,1,5,10000.0000,1.0000,5,1,'2017-04-04','test','2017-04-04 15:37:57',12,'2017-04-04 15:38:16',12,'0000-00-00 00:00:00',0,0,1);
COMMIT;

/* Data for the `invoice_counter` table  (LIMIT 0,500) */

INSERT INTO `invoice_counter` (`counter_id`, `user_id`, `counter_start`, `counter_end`, `last_invoice`) VALUES
  (1,1,0,0,0),
  (2,10,0,0,0),
  (3,11,0,0,0),
  (4,12,0,0,0),
  (5,14,0,0,0),
  (6,13,25521,25530,25530),
  (7,15,26199,26210,26210),
  (8,16,26141,26150,26150),
  (9,17,222,225,222),
  (10,18,25286,25293,25293),
  (11,20,26111,26120,26120),
  (12,23,27201,27250,27234),
  (13,24,25651,25700,25700),
  (14,22,25974,25995,25995),
  (15,26,27301,27350,27347),
  (16,21,26551,26600,26600);
COMMIT;

/* Data for the `item_types` table  (LIMIT 0,500) */

INSERT INTO `item_types` (`item_type_id`, `item_type`, `description`, `is_active`, `is_deleted`) VALUES
  (1,'Inventory','',1,0),
  (2,'Non-inventory','',1,0),
  (3,'Services','',1,0);
COMMIT;

/* Data for the `journal_accounts` table  (LIMIT 0,500) */

INSERT INTO `journal_accounts` (`journal_account_id`, `journal_id`, `account_id`, `memo`, `dr_amount`, `cr_amount`) VALUES
  (1,1,9,'',3928.57,0.00),
  (2,1,10,'',471.43,0.00),
  (3,1,4,'',0.00,4400.00);
COMMIT;

/* Data for the `journal_entry_templates` table  (LIMIT 0,500) */

INSERT INTO `journal_entry_templates` (`entry_template_id`, `template_id`, `account_id`, `memo`, `dr_amount`, `cr_amount`) VALUES
  (1,1,3,'',22.0000,0.0000),
  (2,1,4,'',0.0000,22.0000);
COMMIT;

/* Data for the `journal_info` table  (LIMIT 0,500) */

INSERT INTO `journal_info` (`journal_id`, `txn_no`, `department_id`, `customer_id`, `supplier_id`, `remarks`, `book_type`, `date_txn`, `date_created`, `created_by_user`, `date_modified`, `modified_by_user`, `date_deleted`, `deleted_by_user`, `date_cancelled`, `cancelled_by_user`, `is_deleted`, `is_active`, `payment_method_id`, `bank`, `check_no`, `check_date`, `ref_type`, `ref_no`, `amount`, `or_no`, `check_status`, `accounting_period_id`, `is_replenished`, `batch_id`) VALUES
  (1,'TXN-20170616-1',3,0,2,'','PJE','2017-06-16','2017-06-16 17:15:01',12,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,1,0,'','','0000-00-00','','',0.00,'',0,1,0,0);
COMMIT;

/* Data for the `journal_templates_info` table  (LIMIT 0,500) */

INSERT INTO `journal_templates_info` (`template_id`, `template_code`, `payee`, `template_description`, `supplier_id`, `customer_id`, `method_id`, `amount`, `remarks`, `posted_by`, `book_type`, `is_active`, `is_deleted`) VALUES
  (1,'test','','test',1,0,0,0.0000,'',12,'GJE',1,0);
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

/* Data for the `other_sales_invoice` table  (LIMIT 0,500) */

INSERT INTO `other_sales_invoice` (`sales_invoice_id`, `sales_inv_no`, `sales_order_id`, `sales_order_no`, `department_id`, `customer_id`, `journal_id`, `remarks`, `total_discount`, `total_before_tax`, `total_tax_amount`, `total_after_tax`, `date_due`, `date_invoice`, `date_created`, `date_deleted`, `date_modified`, `posted_by_user`, `deleted_by_user`, `modified_by_user`, `is_paid`, `is_active`, `is_deleted`, `is_journal_posted`, `ref_product_type_id`) VALUES
  (1,'INV-20161209-1',0,'',0,1,0,'haha',0.00,1.00,0.00,1.00,'2016-12-09','2016-12-09','2016-12-09 12:04:08','0000-00-00 00:00:00','2016-12-09 04:04:08',1,0,0,0,1,0,0,NULL);
COMMIT;

/* Data for the `other_sales_invoice_items` table  (LIMIT 0,500) */

INSERT INTO `other_sales_invoice_items` (`sales_item_id`, `sales_invoice_id`, `product_id`, `unit_id`, `inv_price`, `inv_discount`, `inv_line_total_discount`, `inv_tax_rate`, `inv_qty`, `inv_line_total_price`, `inv_tax_amount`, `inv_non_tax_amount`, `inv_notes`, `dr_invoice_id`, `exp_date`) VALUES
  (91,28,41,0,3.00,0.00,0.00,0.00,1,3.00,0.00,3.00,NULL,NULL,NULL),
  (92,1,3,0,1.00,0.00,0.00,0.00,1,1.00,0.00,1.00,NULL,2,'2016-07-20');
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
  (110,1,1,'hello','2017-04-26 16:43:39','0000-00-00 00:00:00',0);
COMMIT;

/* Data for the `products` table  (LIMIT 0,500) */

INSERT INTO `products` (`product_id`, `product_code`, `product_desc`, `product_desc1`, `unit`, `size`, `supplier_id`, `tax_type_id`, `refproduct_id`, `category_id`, `department_id`, `unit_id`, `equivalent_points`, `product_warn`, `product_ideal`, `purchase_cost`, `purchase_cost_2`, `markup_percent`, `sale_price`, `whole_sale`, `retailer_price`, `special_disc`, `discounted_price`, `dealer_price`, `distributor_price`, `public_price`, `valued_customer`, `income_account_id`, `expense_account_id`, `on_hand`, `item_type_id`, `date_created`, `date_modified`, `date_deleted`, `created_by_user`, `modified_by_user`, `deleted_by_user`, `is_inventory`, `is_tax_exempt`, `is_deleted`, `is_active`) VALUES
  (1,'1000','Bond Paper1','','',NULL,NULL,1,NULL,7,0,3,0.00,0.00,0.00,500.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,0.00,1,'2017-08-13 13:57:49','2017-08-13 15:16:48','0000-00-00 00:00:00',1,1,0,1,0,0,1);
COMMIT;

/* Data for the `purchase_order` table  (LIMIT 0,500) */

INSERT INTO `purchase_order` (`purchase_order_id`, `po_no`, `terms`, `duration`, `deliver_to_address`, `supplier_id`, `department_id`, `tax_type_id`, `contact_person`, `remarks`, `total_discount`, `total_before_tax`, `total_tax_amount`, `total_after_tax`, `approval_id`, `order_status_id`, `is_email_sent`, `is_active`, `is_deleted`, `date_created`, `date_modified`, `date_deleted`, `date_approved`, `approved_by_user`, `posted_by_user`, `deleted_by_user`, `modified_by_user`) VALUES
  (1,'PO-20170806-1','',NULL,'ddd',1,2,1,'',NULL,0.0000,714.2857,85.7143,800.0000,2,1,0,1,0,'2017-08-06 21:24:13','2017-08-06 21:24:13','0000-00-00 00:00:00','0000-00-00 00:00:00',0,1,0,0);
COMMIT;

/* Data for the `purchase_order_items` table  (LIMIT 0,500) */

INSERT INTO `purchase_order_items` (`po_item_id`, `purchase_order_id`, `product_id`, `unit_id`, `po_price`, `po_discount`, `po_line_total_discount`, `po_tax_rate`, `po_qty`, `po_line_total`, `tax_amount`, `non_tax_amount`) VALUES
  (1,1,1,1,400.0000,0.0000,0.0000,12.0000,2,800.0000,85.7143,714.2857);
COMMIT;

/* Data for the `refproduct` table  (LIMIT 0,500) */

INSERT INTO `refproduct` (`refproduct_id`, `product_type`, `description`, `created_by_user_id`, `modified_by_user_id`, `date_created`, `date_modified`, `is_deleted`) VALUES
  (1,'Companion Animals','Common house pets',0,0,'2017-04-03 10:53:40','0000-00-00 00:00:00',0),
  (2,'Livestock Animals','Farm animals',0,0,'2017-04-03 10:53:40','0000-00-00 00:00:00',0),
  (3,'All Product type','',0,0,'2017-04-03 10:53:40','0000-00-00 00:00:00',0);
COMMIT;

/* Data for the `rights_links` table  (LIMIT 0,500) */

INSERT INTO `rights_links` (`link_id`, `parent_code`, `link_code`, `link_name`) VALUES
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
  (50,'6','6-9','Backup Database');
COMMIT;

/* Data for the `sales_invoice` table  (LIMIT 0,500) */

INSERT INTO `sales_invoice` (`sales_invoice_id`, `sales_inv_no`, `sales_order_id`, `sales_order_no`, `department_id`, `issue_to_department`, `customer_id`, `journal_id`, `terms`, `remarks`, `total_discount`, `total_before_tax`, `total_tax_amount`, `total_after_tax`, `date_due`, `date_invoice`, `date_created`, `date_deleted`, `date_modified`, `posted_by_user`, `deleted_by_user`, `modified_by_user`, `is_paid`, `is_active`, `is_deleted`, `is_journal_posted`, `ref_product_type_id`, `inv_type`, `salesperson_id`, `address`) VALUES
  (1,'INV-20170619-1',0,'',1,NULL,1,0,0,'',0.0000,0.0000,0.0000,0.0000,'2017-06-19','2017-06-19','2017-06-19 14:08:55','0000-00-00 00:00:00','2017-06-19 14:08:55',12,0,0,0,1,0,0,0,1,NULL,'d');
COMMIT;

/* Data for the `sales_invoice_items` table  (LIMIT 0,500) */

INSERT INTO `sales_invoice_items` (`sales_item_id`, `sales_invoice_id`, `product_id`, `unit_id`, `inv_price`, `orig_so_price`, `inv_discount`, `inv_line_total_discount`, `inv_tax_rate`, `cost_upon_invoice`, `inv_qty`, `inv_line_total_price`, `inv_tax_amount`, `inv_non_tax_amount`, `inv_notes`, `dr_invoice_id`, `exp_date`, `batch_no`) VALUES
  (1,1,2,2,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,2,0.0000,0.0000,0.0000,NULL,NULL,'0000-00-00','');
COMMIT;

/* Data for the `salesperson` table  (LIMIT 0,500) */

INSERT INTO `salesperson` (`salesperson_id`, `salesperson_code`, `firstname`, `middlename`, `lastname`, `acr_name`, `contact_no`, `department_id`, `tin_no`, `is_active`, `is_deleted`, `date_created`, `date_modified`, `posted_by_user`) VALUES
  (1,'ssss','sss','sss','sss',NULL,'',2,'',1,0,'2017-06-16 13:59:40','0000-00-00 00:00:00',12),
  (2,'1211','d','d','d',NULL,'d',1,'121',1,0,'2017-06-16 15:34:56','0000-00-00 00:00:00',12);
COMMIT;

/* Data for the `suppliers` table  (LIMIT 0,500) */

INSERT INTO `suppliers` (`supplier_id`, `supplier_code`, `supplier_name`, `contact_name`, `contact_person`, `address`, `email_address`, `contact_no`, `tin_no`, `term`, `tax_type_id`, `photo_path`, `total_payable_amount`, `posted_by_user`, `date_created`, `date_modified`, `credit_limit`, `is_deleted`, `is_active`) VALUES
  (1,'N/A','N/A','','','','','','','',1,'',0.00,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',NULL,0,1),
  (2,'','SH','SH','','SH','',NULL,'','',2,'assets/img/anonymous-icon.png',6400.00,12,'2017-06-16 17:13:35','0000-00-00 00:00:00',NULL,0,1);
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
  (1,'admin','d033e22ae348aeb5660fc2140aec35850c4da997','Flores','Liezel','','Mabalacat City, Pampanga','','0935-746-7601','','2016-08-01',1,'assets/img/user/5902dd0367504.jpg',NULL,1,0,NULL,'2017-08-07 17:43:06',0,1,0,0,1),
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
  (31,'Paul','a027184a55211cd23e3f3094f1fdc728df5e0500','Rueda','Paul','','','','','','2017-04-26',1,'assets/img/user/59006d107c755.jpg','',1,1,'2017-04-26 17:49:06','2017-08-06 21:36:51',2147483647,0,12,1,0);
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
  (29,1,'4-1'),
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
  (43,1,'4-5'),
  (44,1,'10-1'),
  (45,1,'9-9'),
  (46,1,'6-8'),
  (47,1,'9-10'),
  (48,1,'1-6'),
  (49,1,'9-13'),
  (50,1,'6-9'),
  (51,1,'9-14'),
  (52,1,'9-16'),
  (53,1,'4-6'),
  (54,1,'10-2'),
  (55,1,'11-1'),
  (57,1,'12-1'),
  (58,1,'12-2'),
  (59,1,'12-3'),
  (60,1,'12-4'),
  (61,1,'12-5'),
  (62,1,'9-11'),
  (63,1,'9-15'),
  (64,1,'9-12'),
  (67,1,'1-1'),
  (68,1,'1-2'),
  (69,1,'1-3'),
  (70,1,'1-4'),
  (71,1,'1-5'),
  (72,1,'2-1'),
  (73,1,'2-2'),
  (74,1,'2-3'),
  (75,1,'2-4'),
  (76,1,'2-5'),
  (77,1,'3-1'),
  (78,1,'3-2'),
  (79,1,'3-3'),
  (80,1,'4-1'),
  (81,1,'4-2'),
  (82,1,'4-3'),
  (83,1,'5-1'),
  (84,1,'5-2'),
  (85,1,'5-3'),
  (86,1,'6-1'),
  (87,1,'6-2'),
  (88,1,'6-3'),
  (89,1,'6-4'),
  (90,1,'6-5'),
  (91,1,'6-6'),
  (92,1,'7-1'),
  (93,1,'8-1'),
  (94,1,'8-2'),
  (95,1,'1-1'),
  (96,1,'1-2'),
  (97,1,'1-3'),
  (98,1,'1-4'),
  (99,1,'1-5'),
  (100,1,'2-1'),
  (101,1,'2-2'),
  (102,1,'2-3'),
  (103,1,'2-4'),
  (104,1,'2-5'),
  (105,1,'3-1'),
  (106,1,'3-2'),
  (107,1,'3-3'),
  (108,1,'4-1'),
  (109,1,'4-2'),
  (110,1,'4-3'),
  (111,1,'5-1'),
  (112,1,'5-2'),
  (113,1,'5-3'),
  (114,1,'6-1'),
  (115,1,'6-2'),
  (116,1,'6-3'),
  (117,1,'6-4'),
  (118,1,'6-5'),
  (119,1,'6-6'),
  (120,1,'7-1'),
  (121,1,'8-1'),
  (122,1,'8-2'),
  (123,1,'4-4'),
  (124,1,'4-4'),
  (125,1,'8-3'),
  (179,2,'1-1'),
  (180,2,'1-2'),
  (181,2,'1-3'),
  (182,2,'1-4'),
  (183,2,'1-5'),
  (184,2,'8-1'),
  (185,2,'8-2'),
  (186,2,'8-3'),
  (187,2,'8-5'),
  (188,2,'8-6'),
  (189,2,'8-10'),
  (190,2,'8-11'),
  (202,5,'1-2'),
  (203,5,'3-3'),
  (204,5,'5-2'),
  (205,5,'1-3'),
  (206,5,'6-1'),
  (207,5,'8-10'),
  (208,5,'8-11'),
  (209,4,'3-1'),
  (210,4,'3-2'),
  (211,4,'2-1'),
  (212,4,'2-2'),
  (213,4,'2-3'),
  (214,4,'2-4'),
  (215,4,'4-1'),
  (216,4,'4-2'),
  (217,4,'4-3'),
  (218,4,'5-1'),
  (219,4,'5-2'),
  (220,4,'5-3'),
  (221,4,'6-1'),
  (222,4,'7-1'),
  (223,4,'4-4'),
  (224,4,'8-3'),
  (225,4,'8-4'),
  (226,4,'5-4'),
  (227,6,'2-1'),
  (228,6,'2-2'),
  (229,6,'3-1'),
  (230,6,'3-2');
COMMIT;

/* Data for the `user_groups` table  (LIMIT 0,500) */

INSERT INTO `user_groups` (`user_group_id`, `user_group`, `user_group_desc`, `is_active`, `is_deleted`, `date_created`, `date_modified`) VALUES
  (1,'System Administrator','Can access all features.',1,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
  (2,'Financing','',1,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
  (3,'wee','wee',1,1,'0000-00-00 00:00:00','2016-12-14 01:10:30'),
  (4,'Sales Invoice User','',1,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
  (5,'Disbursement','',1,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
  (6,'Encoder','Encoders',1,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;