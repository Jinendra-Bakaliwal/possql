-- ----------------------------------------------------------------
--  DATABASE pos
-- ----------------------------------------------------------------

CREATE DATABASE pos
   CHARACTER SET `utf8mb4`
   COLLATE `utf8mb4_0900_ai_ci`;
-- ----------------------------------------------------------------
--  TABLE hibernate_sequence
-- ----------------------------------------------------------------

CREATE TABLE pos.hibernate_sequence
(
   next_val    BIGINT(20) NULL
)
ENGINE INNODB
COLLATE 'utf8mb4_0900_ai_ci'
ROW_FORMAT DEFAULT;


-- ----------------------------------------------------------------
--  TABLE jan_item_details
-- ----------------------------------------------------------------

CREATE TABLE pos.jan_item_details
(
   item_id                   INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
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
   shop_id                   DECIMAL(10, 0) UNSIGNED NOT NULL,
   item_unit_type_id         INT(10) UNSIGNED NOT NULL,
   created_date              TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
   updated_by                INT(10) NULL,
   updated_date              TIMESTAMP(0) NULL ON UPDATE CURRENT_TIMESTAMP,
   CONSTRAINT jan_item_details_ibfk_1 FOREIGN KEY(item_unit_type_id)
      REFERENCES jan_item_unit_type_master (item_unit_type_id)
         ON UPDATE RESTRICT
         ON DELETE RESTRICT,
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
   item_misc_fields_id            INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
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
   created_date                   TIMESTAMP(0)
                                    NOT NULL
                                    DEFAULT CURRENT_TIMESTAMP,
   updated_by                     INT(10) NULL,
   updated_date                   TIMESTAMP(0)
                                    NULL
                                    ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(item_misc_fields_id)
)
ENGINE INNODB
COLLATE 'utf8mb4_0900_ai_ci'
ROW_FORMAT DEFAULT;


-- ----------------------------------------------------------------
--  TABLE jan_item_unit_type_master
-- ----------------------------------------------------------------

CREATE TABLE pos.jan_item_unit_type_master
(
   item_unit_type_id              INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
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
   created_date                   TIMESTAMP(0)
                                    NOT NULL
                                    DEFAULT CURRENT_TIMESTAMP,
   updated_by                     INT(10) NULL,
   updated_date                   TIMESTAMP(0)
                                    NULL
                                    ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(item_unit_type_id),
   CONSTRAINT `FK_jan_item_unit_type_master_1` FOREIGN KEY(shop_id)
      REFERENCES shop_master (shop_id) ON UPDATE RESTRICT ON DELETE RESTRICT
)
ENGINE INNODB
COLLATE 'utf8mb4_0900_ai_ci'
ROW_FORMAT DEFAULT;


-- ----------------------------------------------------------------
--  TABLE jan_member
-- ----------------------------------------------------------------

CREATE TABLE pos.jan_member
(
   member_id             BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
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
   mobile                VARCHAR(12)
                           CHARACTER SET utf8mb4
                           COLLATE utf8mb4_0900_ai_ci
                           NULL,
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
   created_date          TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
   updated_by            INT(10) NULL,
   updated_date          TIMESTAMP(0) NULL ON UPDATE CURRENT_TIMESTAMP,
   password              VARCHAR(100)
                           CHARACTER SET utf8mb4
                           COLLATE utf8mb4_0900_ai_ci
                           NULL,
   username              VARCHAR(50)
                           CHARACTER SET utf8mb4
                           COLLATE utf8mb4_0900_ai_ci
                           NULL,
   enabled               TINYINT(1) NOT NULL,
   `is_Using2FA`         TINYINT(1) NOT NULL,
   secret                VARCHAR(255)
                           CHARACTER SET utf8mb4
                           COLLATE utf8mb4_0900_ai_ci
                           NULL,
   CONSTRAINT `FK_SHOP_MASTER` FOREIGN KEY(shop_id)
      REFERENCES shop_master (shop_id) ON UPDATE RESTRICT ON DELETE RESTRICT,
   PRIMARY KEY(member_id)
)
ENGINE INNODB
COLLATE 'utf8mb4_0900_ai_ci'
ROW_FORMAT DEFAULT;


-- ----------------------------------------------------------------
--  TABLE jan_member_type_master
-- ----------------------------------------------------------------

CREATE TABLE pos.jan_member_type_master
(
   member_type_id              INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
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
   created_date                TIMESTAMP(0)
                                 NOT NULL
                                 DEFAULT CURRENT_TIMESTAMP,
   updated_by                  INT(10) NULL,
   updated_date                TIMESTAMP(0) NULL ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(member_type_id),
   CONSTRAINT `FK_jan_member_type_master_1` FOREIGN KEY(shop_id)
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
   receipt_id                     INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
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
   created_date                   TIMESTAMP(0)
                                    NOT NULL
                                    DEFAULT CURRENT_TIMESTAMP,
   updated_by                     INT(10) NULL,
   updated_date                   TIMESTAMP(0)
                                    NULL
                                    ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(receipt_id)
)
ENGINE INNODB
COLLATE 'utf8mb4_0900_ai_ci'
ROW_FORMAT DEFAULT;


-- ----------------------------------------------------------------
--  TABLE jan_shop_membership_details
-- ----------------------------------------------------------------

CREATE TABLE pos.jan_shop_membership_details
(
   shop_membership_type_id              INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
   shop_membership_type_display_name    VARCHAR(20)
                                          CHARACTER SET utf8mb4
                                          COLLATE utf8mb4_0900_ai_ci
                                          NOT NULL,
   shop_membership_type                 VARCHAR(20)
                                          CHARACTER SET utf8mb4
                                          COLLATE utf8mb4_0900_ai_ci
                                          NOT NULL,
   max_accounts_allowed                 DECIMAL(20, 0) NULL,
   max_items_allowed                    DECIMAL(6, 0) NULL,
   max_employee_allowed                 DECIMAL(5, 0) NULL,
   max_owner_allowed                    DECIMAL(5, 0) NULL,
   notes                                VARCHAR(200)
                                          CHARACTER SET utf8mb4
                                          COLLATE utf8mb4_0900_ai_ci
                                          NULL,
   created_date                         TIMESTAMP(0)
                                          NOT NULL
                                          DEFAULT CURRENT_TIMESTAMP,
   updated_by                           INT(10) NULL,
   updated_date                         TIMESTAMP(0)
                                          NULL
                                          ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(shop_membership_type_id)
)
ENGINE INNODB
COLLATE 'utf8mb4_0900_ai_ci'
ROW_FORMAT DEFAULT;


-- ----------------------------------------------------------------
--  TABLE jan_transaction
-- ----------------------------------------------------------------

CREATE TABLE pos.jan_transaction
(
   transaction_id       INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
   item_actual_price    DECIMAL(10, 0) NOT NULL,
   item_sale_price      DECIMAL(5, 0) NOT NULL,
   quntity              DECIMAL(5, 0) NOT NULL,
   total_price          DECIMAL(10, 2) NULL,
   notes                VARCHAR(100)
                          CHARACTER SET utf8mb4
                          COLLATE utf8mb4_0900_ai_ci
                          NULL,
   created_date         TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
   updated_by           INT(10) NULL,
   updated_date         TIMESTAMP(0) NULL ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(transaction_id)
)
ENGINE INNODB
COLLATE 'utf8mb4_0900_ai_ci'
ROW_FORMAT DEFAULT;


-- ----------------------------------------------------------------
--  TABLE jan_transaction_type_master
-- ----------------------------------------------------------------

CREATE TABLE pos.jan_transaction_type_master
(
   transaction_type_id    INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
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
   created_date           TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
   updated_by             INT(10) NULL,
   updated_date           TIMESTAMP(0) NULL ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(transaction_type_id)
)
ENGINE INNODB
COLLATE 'utf8mb4_0900_ai_ci'
ROW_FORMAT DEFAULT;


-- ----------------------------------------------------------------
--  TABLE persistent_logins
-- ----------------------------------------------------------------

CREATE TABLE pos.persistent_logins
(
   username     VARCHAR(64)
                  CHARACTER SET utf8mb4
                  COLLATE utf8mb4_0900_ai_ci
                  NOT NULL,
   series       VARCHAR(64)
                  CHARACTER SET utf8mb4
                  COLLATE utf8mb4_0900_ai_ci
                  NOT NULL,
   token        VARCHAR(64)
                  CHARACTER SET utf8mb4
                  COLLATE utf8mb4_0900_ai_ci
                  NOT NULL,
   last_used    TIMESTAMP(0) NOT NULL,
   PRIMARY KEY(series)
)
ENGINE INNODB
COLLATE 'utf8mb4_0900_ai_ci'
ROW_FORMAT DEFAULT;


-- ----------------------------------------------------------------
--  TABLE privilege
-- ----------------------------------------------------------------

CREATE TABLE pos.privilege
(
   privilege_id    BIGINT(20) NOT NULL,
   name            VARCHAR(255)
                     CHARACTER SET utf8mb4
                     COLLATE utf8mb4_0900_ai_ci
                     NULL,
   PRIMARY KEY(privilege_id)
)
ENGINE INNODB
COLLATE 'utf8mb4_0900_ai_ci'
ROW_FORMAT DEFAULT;


-- ----------------------------------------------------------------
--  TABLE role
-- ----------------------------------------------------------------

CREATE TABLE pos.role
(
   role_id    BIGINT(20) NOT NULL,
   name       VARCHAR(255)
                CHARACTER SET utf8mb4
                COLLATE utf8mb4_0900_ai_ci
                NULL,
   PRIMARY KEY(role_id)
)
ENGINE INNODB
COLLATE 'utf8mb4_0900_ai_ci'
ROW_FORMAT DEFAULT;


-- ----------------------------------------------------------------
--  TABLE roles_privileges
-- ----------------------------------------------------------------

CREATE TABLE pos.roles_privileges
(
   role_id         BIGINT(20) NOT NULL,
   privilege_id    BIGINT(20) NOT NULL,
   CONSTRAINT `FK2rfl694fu6ls2f2mqcxesqc6p` FOREIGN KEY(role_id)
      REFERENCES role (role_id) ON UPDATE RESTRICT ON DELETE RESTRICT,
   CONSTRAINT `FKp0x1d9k5aksyqd1akwwfkh0ki` FOREIGN KEY(privilege_id)
      REFERENCES privilege (privilege_id)
         ON UPDATE RESTRICT
         ON DELETE RESTRICT
)
ENGINE INNODB
COLLATE 'utf8mb4_0900_ai_ci'
ROW_FORMAT DEFAULT;


-- ----------------------------------------------------------------
--  TABLE shop_master
-- ----------------------------------------------------------------

CREATE TABLE pos.shop_master
(
   shop_id                    INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
   shop_name                  VARCHAR(50)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NOT NULL,
   shop_display_name          VARCHAR(50)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NULL
                                COMMENT '	',
   shop_logo                  VARCHAR(50)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NULL,
   address_line1              VARCHAR(50)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NULL,
   tehsil                     VARCHAR(30)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NULL,
   district                   VARCHAR(30)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NULL,
   zip                        DECIMAL(10, 0) NULL,
   mobile                     DECIMAL(12, 0) NULL,
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
                                NOT NULL
                                DEFAULT 'Jan',
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
--  TABLE verificationtoken
-- ----------------------------------------------------------------

CREATE TABLE pos.verificationtoken
(
   id               INT(20) NOT NULL,
   `expiry_Date`    DATETIME(6) NULL,
   token            VARCHAR(255)
                      CHARACTER SET utf8mb4
                      COLLATE utf8mb4_0900_ai_ci
                      NULL,
   member_id        INT(10) NOT NULL,
   PRIMARY KEY(id)
)
ENGINE INNODB
COLLATE 'utf8mb4_0900_ai_ci'
ROW_FORMAT DEFAULT;


