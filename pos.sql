--DROP TABLE IF EXISTS pos.jan_receipts;
--DROP TABLE IF EXISTS pos.jan_transaction;
--DROP TABLE IF EXISTS pos.jan_transaction_type_master;
--DROP TABLE IF EXISTS pos.jan_item_misc_fields;
--DROP TABLE IF EXISTS pos.jan_item_details;
--DROP TABLE IF EXISTS pos.jan_item_unit_type_master;
--DROP TABLE IF EXISTS pos.jan_member;
--DROP TABLE IF EXISTS pos.jan_member_type_master;
--DROP TABLE IF EXISTS pos.shop_master;
--DROP TABLE IF EXISTS pos.jan_shop_membership_details;





-- ----------------------------------------------------------------
--  TABLE jan_shop_membership_details
-- ----------------------------------------------------------------

CREATE TABLE pos.jan_shop_membership_details
(
   shop_membership_type_id    INT(10) UNSIGNED AUTO_INCREMENT,
   shop_membership_type_display_name       VARCHAR(20)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NOT NULL,
   shop_membership_type       VARCHAR(20)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NOT NULL,
   max_accounts_allowed       DECIMAL(20, 0) NULL,
   max_items_allowed          DECIMAL(6, 0) NULL,
   `max_employee-allowed`     DECIMAL(5, 0) NULL,
   max_owner_allowed          DECIMAL(5, 0) NULL,
   notes                      VARCHAR(200)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NULL,
   created_date               TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
   updated_by                 INT(10) NULL,
   updated_date               TIMESTAMP(0) NULL ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(shop_membership_type_id)
)
ENGINE INNODB
COLLATE 'utf8mb4_0900_ai_ci'
ROW_FORMAT DEFAULT;


-- ----------------------------------------------------------------
--  TABLE shop_master
-- ----------------------------------------------------------------

CREATE TABLE pos.shop_master
(
   shop_id                    INT(10) UNSIGNED AUTO_INCREMENT,
                                
   shop_name                  VARCHAR(50)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NOT NULL,
   shop_display_name          VARCHAR(50)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NOT NULL
                                COMMENT '	',
   shop_logo                  VARCHAR(50)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NULL,
   address_line1              VARCHAR(50)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NOT NULL,
   tehsil                     VARCHAR(30)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NOT NULL,
   district                   VARCHAR(30)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NOT NULL,
   zip                        DECIMAL(10, 0) NOT NULL,
   mobile                     DECIMAL(12, 0) NOT NULL,
   email                      VARCHAR(70)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NULL,
   shop_membership_type_id    DECIMAL(20, 0) NULL,
   status                     VARCHAR(20)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NOT NULL
                                DEFAULT 'ACTIVE'
                                COMMENT 'Allowed values ACTIVE/INACTIVE',
   notes                      VARCHAR(200)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NULL
                                COMMENT 'General comments	',
   created_by                 VARCHAR(50)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NOT NULL,
   created_date               TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
   updated_by                 DECIMAL(10, 0) NULL,
   updated_date               TIMESTAMP(0) NULL ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(shop_id)
)
COMMENT 'Stores shop details'
ENGINE INNODB
COLLATE 'utf8mb4_0900_ai_ci'
ROW_FORMAT DEFAULT;



-- ----------------------------------------------------------------
--  TABLE jan_member_type_master
-- ----------------------------------------------------------------

CREATE TABLE pos.jan_member_type_master
(
   member_type_id              INT(10) UNSIGNED AUTO_INCREMENT,
   member_type                 VARCHAR(30)
                                 CHARACTER SET utf8mb4
                                 COLLATE utf8mb4_0900_ai_ci
                                 NOT NULL,
   member_type_display_name    VARCHAR(30)
                                 CHARACTER SET utf8mb4
                                 COLLATE utf8mb4_0900_ai_ci
                                 NOT NULL,
   notes                       VARCHAR(100)
                                 CHARACTER SET utf8mb4
                                 COLLATE utf8mb4_0900_ai_ci
                                 NULL,
   status                      VARCHAR(20)
                                 CHARACTER SET utf8mb4
                                 COLLATE utf8mb4_0900_ai_ci
                                 NULL
                                 DEFAULT 'ACTIVE',
   shop_id                     INT(10) UNSIGNED NOT NULL,
   created_date               TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
   updated_by                 INT(10) NULL,
   updated_date               TIMESTAMP(0) NULL ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(member_type_id),
   CONSTRAINT `FK_jan_member_type_master_1` FOREIGN KEY(shop_id)
      REFERENCES shop_master (shop_id) ON UPDATE RESTRICT ON DELETE RESTRICT
)
ENGINE INNODB
COLLATE 'utf8mb4_0900_ai_ci'
ROW_FORMAT DEFAULT;


-- ----------------------------------------------------------------
--  TABLE jan_member_type
-- ----------------------------------------------------------------

CREATE TABLE pos.jan_member
(
   member_id             INT(10) UNSIGNED AUTO_INCREMENT,
   member_first_name     VARCHAR(30)
                           CHARACTER SET utf8mb4
                           COLLATE utf8mb4_0900_ai_ci
                           NOT NULL,
   member_last_name      VARCHAR(30)
                           CHARACTER SET utf8mb4
                           COLLATE utf8mb4_0900_ai_ci
                           NOT NULL,
   member_middle_name    VARCHAR(30)
                           CHARACTER SET utf8mb4
                           COLLATE utf8mb4_0900_ai_ci
                           NULL,
   address_line_1        VARCHAR(50)
                           CHARACTER SET utf8mb4
                           COLLATE utf8mb4_0900_ai_ci
                           NULL,
   tehsil                VARCHAR(30)
                           CHARACTER SET utf8mb4
                           COLLATE utf8mb4_0900_ai_ci
                           NULL,
   district              VARCHAR(30)
                           CHARACTER SET utf8mb4
                           COLLATE utf8mb4_0900_ai_ci
                           NULL,
   state                 VARCHAR(30)
                           CHARACTER SET utf8mb4
                           COLLATE utf8mb4_0900_ai_ci
                           NULL,
   zip                   DECIMAL(10, 0) NULL,
   mobile                DECIMAL(12, 0) NULL,
   email                 VARCHAR(50)
                           CHARACTER SET utf8mb4
                           COLLATE utf8mb4_0900_ai_ci
                           NULL,
   notes                 VARCHAR(200)
                           CHARACTER SET utf8mb4
                           COLLATE utf8mb4_0900_ai_ci
                           NULL,
   member_type_id        INT(10) NOT NULL,
   shop_id               INT(10) UNSIGNED NOT NULL,
   created_date               TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
   updated_by                 INT(10) NULL,
   updated_date               TIMESTAMP(0) NULL ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(member_id)
)
ENGINE INNODB
COLLATE 'utf8mb4_0900_ai_ci'
ROW_FORMAT DEFAULT;


-- ----------------------------------------------------------------
--  TABLE jan_item_unit_type_master
-- ----------------------------------------------------------------

CREATE TABLE pos.jan_item_unit_type_master
(
   item_unit_type_id              INT(10) UNSIGNED AUTO_INCREMENT,
   item_unit_type                 VARCHAR(20)
                                    CHARACTER SET utf8mb4
                                    COLLATE utf8mb4_0900_ai_ci
                                    NOT NULL,
   item_unit_type_display_name    VARCHAR(30)
                                    CHARACTER SET utf8mb4
                                    COLLATE utf8mb4_0900_ai_ci
                                    NOT NULL,
   notes                          VARCHAR(100)
                                    CHARACTER SET utf8mb4
                                    COLLATE utf8mb4_0900_ai_ci
                                    NULL,
   status                         VARCHAR(20)
                                    CHARACTER SET utf8mb4
                                    COLLATE utf8mb4_0900_ai_ci
                                    NOT NULL
                                    DEFAULT 'ACTIVE',
   shop_id                        INT(10) UNSIGNED NOT NULL,
   created_date               TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
   updated_by                 INT(10) NULL,
   updated_date               TIMESTAMP(0) NULL ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(item_unit_type_id),
   CONSTRAINT `FK_jan_item_unit_type_master_1` FOREIGN KEY(shop_id)
      REFERENCES shop_master (shop_id) ON UPDATE RESTRICT ON DELETE RESTRICT
)
ENGINE INNODB
COLLATE 'utf8mb4_0900_ai_ci'
ROW_FORMAT DEFAULT;



-- ----------------------------------------------------------------
--  TABLE jan_item_details
-- ----------------------------------------------------------------

CREATE TABLE pos.jan_item_details
(
   item_id                   INT(10) UNSIGNED AUTO_INCREMENT,
   item_name                 VARCHAR(30)
                               CHARACTER SET utf8mb4
                               COLLATE utf8mb4_0900_ai_ci
                               NOT NULL,
   item_display_name         VARCHAR(20)
                               CHARACTER SET utf8mb4
                               COLLATE utf8mb4_0900_ai_ci
                               NOT NULL,
   item_warning_threshold    VARCHAR(20)
                               CHARACTER SET utf8mb4
                               COLLATE utf8mb4_0900_ai_ci
                               NOT NULL,
   barcode                   VARCHAR(30)
                               CHARACTER SET utf8mb4
                               COLLATE utf8mb4_0900_ai_ci
                               NULL,
   item_image                VARCHAR(50)
                               CHARACTER SET utf8mb4
                               COLLATE utf8mb4_0900_ai_ci
                               NULL,
   category                  VARCHAR(30)
                               CHARACTER SET utf8mb4
                               COLLATE utf8mb4_0900_ai_ci
                               NULL,
   quantity                  DECIMAL(10, 0) NOT NULL,
   sale_price                DECIMAL(10, 2) NOT NULL,
   notes                     VARCHAR(200)
                               CHARACTER SET utf8mb4
                               COLLATE utf8mb4_0900_ai_ci
                               NULL,
   min_sale_price            DECIMAL(6, 2) NULL,
   max_sale_price            VARCHAR(20)
                               CHARACTER SET utf8mb4
                               COLLATE utf8mb4_0900_ai_ci
                               NULL,
   purchase_price            DECIMAL(10, 2) NULL,
   status                    VARCHAR(10)
                               CHARACTER SET utf8mb4
                               COLLATE utf8mb4_0900_ai_ci
                               NOT NULL
                               DEFAULT 'ACTIVE',
   shop_id                   NUMERIC(10) UNSIGNED NOT NULL,
   item_unit_type_id         INT(10) UNSIGNED NOT NULL,
   created_date               TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
   updated_by                 INT(10) NULL,
   updated_date               TIMESTAMP(0) NULL ON UPDATE CURRENT_TIMESTAMP,
   CONSTRAINT `FK_jan_item_details_2` FOREIGN KEY(item_unit_type_id)
      REFERENCES jan_item_unit_type_master (item_unit_type_id)
         ON UPDATE RESTRICT
         ON DELETE RESTRICT,
   CONSTRAINT `FK_jan_item_details_1` FOREIGN KEY(shop_id)
      REFERENCES shop_master (shop_id) ON UPDATE RESTRICT ON DELETE RESTRICT,
   PRIMARY KEY(item_id)
)
ENGINE INNODB
COLLATE 'utf8mb4_0900_ai_ci'
ROW_FORMAT DEFAULT;



-- ----------------------------------------------------------------
--  TABLE jan_item_misc_fields
-- ----------------------------------------------------------------

CREATE TABLE pos.jan_item_misc_fields
(
   item_misc_fields_id            INT(10) UNSIGNED AUTO_INCREMENT,
   manufacturer                   VARCHAR(50)
                                    CHARACTER SET utf8mb4
                                    COLLATE utf8mb4_0900_ai_ci
                                    NULL,
   quantity                       DECIMAL(10, 0) NOT NULL,
   company_rate                   DECIMAL(5, 0) NULL,
   company_discount_percantage    DECIMAL(3, 0) NULL,
   discount_price                 DECIMAL(5, 0) NULL,
   total_purchase_price           DECIMAL(10, 0) NULL,
   toatal_sale_price              DECIMAL(5, 0) NULL,
   notes                          VARCHAR(200)
                                    CHARACTER SET utf8mb4
                                    COLLATE utf8mb4_0900_ai_ci
                                    NULL,
   item_id                        INT(10) NOT NULL,
   created_date               TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
   updated_by                 INT(10) NULL,
   updated_date               TIMESTAMP(0) NULL ON UPDATE CURRENT_TIMESTAMP,
   CONSTRAINT `FK_jan_item_misc_fields_1` FOREIGN KEY(item_id)
      REFERENCES jan_item_details (item_id)
         ON UPDATE RESTRICT
         ON DELETE RESTRICT,
   PRIMARY KEY(item_misc_fields_id)
)
ENGINE INNODB
COLLATE 'utf8mb4_0900_ai_ci'
ROW_FORMAT DEFAULT;


-- ----------------------------------------------------------------
--  TABLE jan_transaction_type_master
-- ----------------------------------------------------------------

CREATE TABLE pos.jan_transaction_type_master
(
   transaction_type_id    INT(10) UNSIGNED AUTO_INCREMENT,
   transaction_type       VARCHAR(20)
                            CHARACTER SET utf8mb4
                            COLLATE utf8mb4_0900_ai_ci
                            NOT NULL
                            COMMENT 'Purchase, Sale, Repair, Salary, Service consumed',
   transaction_nature     VARCHAR(20)
                            CHARACTER SET utf8mb4
                            COLLATE utf8mb4_0900_ai_ci
                            NULL,
   shop_id                INT(10) UNSIGNED NOT NULL,
   notes                  VARCHAR(200)
                            CHARACTER SET utf8mb4
                            COLLATE utf8mb4_0900_ai_ci
                            NULL,
   created_date               TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
   updated_by                 INT(10) NULL,
   updated_date               TIMESTAMP(0) NULL ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(transaction_type_id),
   CONSTRAINT `FK_jan_transaction_type_master_1` FOREIGN KEY(shop_id)
      REFERENCES shop_master (shop_id) ON UPDATE RESTRICT ON DELETE RESTRICT
)
ENGINE INNODB
COLLATE 'utf8mb4_0900_ai_ci'
ROW_FORMAT DEFAULT;



-- ----------------------------------------------------------------
--  TABLE jan_receipts
-- ----------------------------------------------------------------

CREATE TABLE pos.jan_receipts
(
   receipt_id                     INT(10) UNSIGNED AUTO_INCREMENT,
   total_receipt_amount           DECIMAL(10, 0) NOT NULL,
   cash                           DECIMAL(5, 0) NOT NULL,
   credit                         DECIMAL(5, 0) NULL,
   remark                         VARCHAR(200)
                                    CHARACTER SET utf8mb4
                                    COLLATE utf8mb4_0900_ai_ci
                                    NULL,
   total_actual_receipt_amount    VARCHAR(20)
                                    CHARACTER SET utf8mb4
                                    COLLATE utf8mb4_0900_ai_ci
                                    NULL,
   shop_id                        INT(10) UNSIGNED NOT NULL,
   transaction_type_id            INT(10) NOT NULL,
   created_date               TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
   updated_by                 INT(10) NULL,
   updated_date               TIMESTAMP(0) NULL ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(receipt_id),
   CONSTRAINT `FK_jan_receipts_2` FOREIGN KEY(transaction_type_id)
      REFERENCES jan_transaction_type_master (transaction_type_id)
         ON UPDATE RESTRICT
         ON DELETE RESTRICT,
   CONSTRAINT `FK_jan_receipts_1` FOREIGN KEY(shop_id)
      REFERENCES shop_master (shop_id) ON UPDATE RESTRICT ON DELETE RESTRICT
)
ENGINE INNODB
COLLATE 'utf8mb4_0900_ai_ci'
ROW_FORMAT DEFAULT;



-- ----------------------------------------------------------------
--  TABLE jan_transaction
-- ----------------------------------------------------------------

CREATE TABLE pos.jan_transaction
(
   transaction_id       INT(10) UNSIGNED AUTO_INCREMENT,
   item_actual_price    DECIMAL(10, 0) NOT NULL,
   item_sale_price      DECIMAL(5, 0) NOT NULL,
   quntity              DECIMAL(5, 0) NOT NULL,
   total_price          DECIMAL(10, 2) NULL,
   notes                VARCHAR(100)
                          CHARACTER SET utf8mb4
                          COLLATE utf8mb4_0900_ai_ci
                          NULL,
   created_date               TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
   updated_by                 INT(10) NULL,
   updated_date               TIMESTAMP(0) NULL ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(transaction_id)
)
ENGINE INNODB
COLLATE 'utf8mb4_0900_ai_ci'
ROW_FORMAT DEFAULT;

