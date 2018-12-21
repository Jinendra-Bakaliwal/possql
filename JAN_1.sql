- ----------------------------------------------------------------
--  DATABASE pos
-- ----------------------------------------------------------------

CREATE DATABASE pos
   CHARACTER SET `utf8mb4`
   COLLATE `utf8mb4_0900_ai_ci`;


-- ----------------------------------------------------------------
--  TABLE ITEM_DTL_MST
-- ----------------------------------------------------------------

CREATE TABLE pos.ITEM_DTL_MST
(
   IDM_ITEM_ID_PK                   DECIMAL(10, 0) NOT NULL,
   IDM_ITEM_NAME                 VARCHAR(30)
                               CHARACTER SET utf8mb4
                               COLLATE utf8mb4_0900_ai_ci
                               NOT NULL,
   IDM_ITEM_DISP_NAME         VARCHAR(20)
                               CHARACTER SET utf8mb4
                               COLLATE utf8mb4_0900_ai_ci
                               NOT NULL,
   IDM_ITEM_THRESHOLD    VARCHAR(20)
                               CHARACTER SET utf8mb4
                               COLLATE utf8mb4_0900_ai_ci
                               NOT NULL,
   IDM_BARCODE                   VARCHAR(30)
                               CHARACTER SET utf8mb4
                               COLLATE utf8mb4_0900_ai_ci
                               NULL,
   IDM_IMAGE                VARCHAR(50)
                               CHARACTER SET utf8mb4
                               COLLATE utf8mb4_0900_ai_ci
                               NULL,
   IDM_CATEGORY                  VARCHAR(30)
                               CHARACTER SET utf8mb4
                               COLLATE utf8mb4_0900_ai_ci
                               NULL,
   IDM_QUANTITY                  DECIMAL(10, 0) NOT NULL,
   IDM_SALE_PRICE                DECIMAL(10, 2) NOT NULL,
   IDM_NOTES                     VARCHAR(200)
                               CHARACTER SET utf8mb4
                               COLLATE utf8mb4_0900_ai_ci
                               NULL,
   IDM_MIN_SALE_PRICE            DECIMAL(6, 2) NULL,
   IDM_MA_SALE_PRICE            VARCHAR(20)
                               CHARACTER SET utf8mb4
                               COLLATE utf8mb4_0900_ai_ci
                               NULL,
   IDM_PURCHASE_PRICE            DECIMAL(10, 2) NULL,
   IDM_STATUS                    VARCHAR(10)
                               CHARACTER SET utf8mb4
                               COLLATE utf8mb4_0900_ai_ci
                               NOT NULL
                               DEFAULT 'ACTIVE',
   IDM_SHOP_ID_FK                   DECIMAL(20, 0) UNSIGNED NOT NULL,
   IDM_ITEM_UNIT_TYPE_FK         VARCHAR(20)
                               CHARACTER SET utf8mb4
                               COLLATE utf8mb4_0900_ai_ci
                               NOT NULL,
	IDM_CRTD_BY                 VARCHAR(50)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NOT NULL,
   IDM_CRTD_TMSTP               TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
   IDM_MODFD_BY                 DECIMAL(10, 0) NULL,
   IDM_MODFD_TMSTP               TIMESTAMP(0) NULL ON UPDATE CURRENT_TIMESTAMP,						   
   CONSTRAINT `FK_jan_item_details_2` FOREIGN KEY(IDM_ITEM_UNIT_TYPE_FK)
      REFERENCES jan_item_unit_type_master (item_unit_type_id)
         ON UPDATE RESTRICT
         ON DELETE RESTRICT,
   CONSTRAINT `FK_jan_item_details_1` FOREIGN KEY(IDM_SHOP_ID_FK)
      REFERENCES SHOP_MST (SM_SHOP_ID_PK) ON UPDATE RESTRICT ON DELETE RESTRICT,
   PRIMARY KEY(IDM_ITEM_ID_PK)
)
ENGINE INNODB
COLLATE 'utf8mb4_0900_ai_ci'
ROW_FORMAT DEFAULT;


-- ----------------------------------------------------------------
--  TABLE ITEM_MISC_FIELDS
-- ----------------------------------------------------------------

CREATE TABLE pos.ITEM_MISC_FIELDS
(
   IMF_ITEM_MISC_FIELDS_ID_PK           DECIMAL(20, 0) NOT NULL,
   IMF_MANUFACTURER                   VARCHAR(50)
                                    CHARACTER SET utf8mb4
                                    COLLATE utf8mb4_0900_ai_ci
                                    NULL,
   IMF_QUANTITY                       DECIMAL(10, 0) NOT NULL,
   IMF_COMPANY_RATE                   DECIMAL(5, 0) NULL,
   IMF_COMPANY_DISCOUNT_PERCANTAGE    DECIMAL(3, 0) NULL,
   IMF_DISCOUNT_PRICE                 DECIMAL(5, 0) NULL,
   IMF_TOTAL_PURCHASE_PRICE           DECIMAL(10, 0) NULL,
   IMF_TOATAL_SALE_PRICE              DECIMAL(5, 0) NULL,
   IMF_NOTES                          VARCHAR(200)
                                    CHARACTER SET utf8mb4
                                    COLLATE utf8mb4_0900_ai_ci
                                    NULL,
   IMF_ITEM_ID_FK                        DECIMAL(10, 0) NOT NULL,
   IMF_CRTD_BY                 VARCHAR(50)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NOT NULL,
   IMF_CRTD_TMSTP               TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
   IMF_MODFD_BY                 DECIMAL(10, 0) NULL,
   IMF_MODFD_TMSTP               TIMESTAMP(0) NULL ON UPDATE CURRENT_TIMESTAMP,
   CONSTRAINT `FK_jan_item_misc_fields_1` FOREIGN KEY(IMF_ITEM_ID_FK)
      REFERENCES ITEM_DTL_MST (IDM_ITEM_ID_PK)
         ON UPDATE RESTRICT
         ON DELETE RESTRICT,
   PRIMARY KEY(IMF_ITEM_MISC_FIELDS_ID_PK)
)
ENGINE INNODB
COLLATE 'utf8mb4_0900_ai_ci'
ROW_FORMAT DEFAULT;


-- ----------------------------------------------------------------
--  TABLE ITEM_UNIT_TYPE_MST
-- ----------------------------------------------------------------

CREATE TABLE POS.ITEM_UNIT_TYPE_MST
(
   IUTM_ITEM_UNIT_TYPE_ID_PK              VARCHAR(20)
                                    CHARACTER SET utf8mb4
                                    COLLATE utf8mb4_0900_ai_ci
                                    NOT NULL,
   IUTM_ITEM_UNIT_TYPE                 VARCHAR(20)
                                    CHARACTER SET utf8mb4
                                    COLLATE utf8mb4_0900_ai_ci
                                    NOT NULL,
   IUTM_ITEM_UNIT_TYPE_DISPLAY_NAME    VARCHAR(30)
                                    CHARACTER SET utf8mb4
                                    COLLATE utf8mb4_0900_ai_ci
                                    NOT NULL,
   IUTM_NOTES                          VARCHAR(100)
                                    CHARACTER SET utf8mb4
                                    COLLATE utf8mb4_0900_ai_ci
                                    NULL,
   IUTM_STATUS                         VARCHAR(20)
                                    CHARACTER SET utf8mb4
                                    COLLATE utf8mb4_0900_ai_ci
                                    NOT NULL
                                    DEFAULT 'ACTIVE',
   IUTM_SHOP_ID_FK                        DECIMAL(20, 0) UNSIGNED NOT NULL,
   IUTM_CRTD_BY                 VARCHAR(50)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NOT NULL,
   IUTM_CRTD_TMSTP               TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
   IUTM_MODFD_BY                 DECIMAL(10, 0) NULL,
   IUTM_MODFD_TMSTP               TIMESTAMP(0) NULL ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(IUTM_ITEM_UNIT_TYPE_ID_PK),
   CONSTRAINT `FK_jan_item_unit_type_master_1` FOREIGN KEY(IUTM_SHOP_ID_FK)
      REFERENCES SHOP_MST (SM_SHOP_ID_PK) ON UPDATE RESTRICT ON DELETE RESTRICT
)
ENGINE INNODB
COLLATE 'utf8mb4_0900_ai_ci'
ROW_FORMAT DEFAULT;


-- ----------------------------------------------------------------
--  TABLE MEM_DTL_MST
-- ----------------------------------------------------------------

CREATE TABLE pos.MEM_DTL_MST
(
   MDM_MEM_ID_PK             DECIMAL(10, 0) NOT NULL,
   MDM_FIRST_NAME     VARCHAR(30)
                           CHARACTER SET utf8mb4
                           COLLATE utf8mb4_0900_ai_ci
                           NOT NULL,
   MDM_LAST_NAME      VARCHAR(30)
                           CHARACTER SET utf8mb4
                           COLLATE utf8mb4_0900_ai_ci
                           NOT NULL,
   MDM_MID_NAME    VARCHAR(30)
                           CHARACTER SET utf8mb4
                           COLLATE utf8mb4_0900_ai_ci
                           NULL,
   MDM_ADDR1        VARCHAR(50)
                           CHARACTER SET utf8mb4
                           COLLATE utf8mb4_0900_ai_ci
                           NULL,
   MDM_TEHSIL                VARCHAR(30)
                           CHARACTER SET utf8mb4
                           COLLATE utf8mb4_0900_ai_ci
                           NULL,
   MDM_DISTICT              VARCHAR(30)
                           CHARACTER SET utf8mb4
                           COLLATE utf8mb4_0900_ai_ci
                           NULL,
   MDM_STATE                 VARCHAR(30)
                           CHARACTER SET utf8mb4
                           COLLATE utf8mb4_0900_ai_ci
                           NULL,
   MDM_PIN                   DECIMAL(10, 0) NULL,
   MDM_MOB_NO                DECIMAL(12, 0) NULL,
   MDM_EMAIL_ID                 VARCHAR(50)
                           CHARACTER SET utf8mb4
                           COLLATE utf8mb4_0900_ai_ci
                           NULL,
   MDM_NOTES                 VARCHAR(200)
                           CHARACTER SET utf8mb4
                           COLLATE utf8mb4_0900_ai_ci
                           NULL,
   MDM_MEM_TYPE_ID_FK        DECIMAL(4, 0) NOT NULL,
   MDM_SHOP_ID_FK               DECIMAL(20, 0) UNSIGNED NOT NULL,
   MDM_CRTD_BY                 VARCHAR(50)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NOT NULL,
   MDM_CRTD_TMSTP               TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
   MDM_MODFD_BY                 DECIMAL(10, 0) NULL,
   MDM_MODFD_TMSTP               TIMESTAMP(0) NULL ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(MDM_MEM_ID_PK),
   CONSTRAINT `FK_jan_member_type_2` FOREIGN KEY(MDM_SHOP_ID_FK)
      REFERENCES SHOP_MST (SM_SHOP_ID_PK) ON UPDATE RESTRICT ON DELETE RESTRICT,
   CONSTRAINT `FK_jan_member_type_1` FOREIGN KEY(MDM_MEM_TYPE_ID_FK)
      REFERENCES MEM_TYPE_MST (MTM_MEM_TYPE_ID_PK)
         ON UPDATE RESTRICT
         ON DELETE RESTRICT
)
ENGINE INNODB
COLLATE 'utf8mb4_0900_ai_ci'
ROW_FORMAT DEFAULT;


-- ----------------------------------------------------------------
--  TABLE MEM_TYPE_MST
-- ----------------------------------------------------------------

CREATE TABLE pos.MEM_TYPE_MST
(
   MTM_MEM_TYPE_ID_PK              DECIMAL(4, 0) NOT NULL,
   MTM_MEM_TYPE_NAME                 VARCHAR(30)
                                 CHARACTER SET utf8mb4
                                 COLLATE utf8mb4_0900_ai_ci
                                 NOT NULL,
   MTM_MEM_TYPE_DISP_NAME    VARCHAR(30)
                                 CHARACTER SET utf8mb4
                                 COLLATE utf8mb4_0900_ai_ci
                                 NOT NULL,
   MTM_NOTE                       VARCHAR(100)
                                 CHARACTER SET utf8mb4
                                 COLLATE utf8mb4_0900_ai_ci
                                 NULL,
   MTM_STATUS                      VARCHAR(20)
                                 CHARACTER SET utf8mb4
                                 COLLATE utf8mb4_0900_ai_ci
                                 NULL
                                 DEFAULT 'ACTIVE',
   MTM_SHOP_ID_FK                     DECIMAL(20, 0) UNSIGNED NOT NULL,
   MTM_CRTD_BY                 VARCHAR(50)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NOT NULL,
   MTM_CRTD_TMSTP               TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
   MTM_MODFD_BY                 DECIMAL(10, 0) NULL,
   MTM_MODFD_TMSTP               TIMESTAMP(0) NULL ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(MTM_MEM_TYPE_ID_PK),
   CONSTRAINT `FK_jan_member_type_master_1` FOREIGN KEY(MTM_SHOP_ID_FK)
      REFERENCES SHOP_MST (SM_SHOP_ID_PK) ON UPDATE RESTRICT ON DELETE RESTRICT
)
ENGINE INNODB
COLLATE 'utf8mb4_0900_ai_ci'
ROW_FORMAT DEFAULT;


-- ----------------------------------------------------------------
--  TABLE RECEIPT_MST
-- ----------------------------------------------------------------

CREATE TABLE pos.RECEIPT_MST
(
   RM_RECEIPT_ID_PK                     DECIMAL(10, 0) NOT NULL,
   RM_TOTAL_RECEIPT_AMOUNT           DECIMAL(10, 0) NOT NULL,
   RM_CASH                           DECIMAL(5, 0) NOT NULL,
   RM_CREDIT                         DECIMAL(5, 0) NULL,
   RM_REMARK                         VARCHAR(200)
                                    CHARACTER SET utf8mb4
                                    COLLATE utf8mb4_0900_ai_ci
                                    NULL,
   RM_TOTAL_ACTUAL_RECEIPT_AMOUNT    VARCHAR(20)
                                    CHARACTER SET utf8mb4
                                    COLLATE utf8mb4_0900_ai_ci
                                    NULL,
   RM_SHOP_ID_FK                        DECIMAL(20, 0) UNSIGNED NOT NULL,
   RM_TRANSACTION_TYPE_ID_FK            DECIMAL(10, 0) NOT NULL,
   RM_CRTD_BY                 VARCHAR(50)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NOT NULL,
   RM_CRTD_TMSTP               TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
   RM_MODFD_BY                 DECIMAL(10, 0) NULL,
   RM_MODFD_TMSTP               TIMESTAMP(0) NULL ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(RM_RECEIPT_ID_PK),
   CONSTRAINT `FK_jan_receipts_2` FOREIGN KEY(RM_TRANSACTION_TYPE_ID_FK)
      REFERENCES TRANSACTION_TYPE_MST (TTM_TRANSACTION_TYPE_ID_PK)
         ON UPDATE RESTRICT
         ON DELETE RESTRICT,
   CONSTRAINT `FK_jan_receipts_1` FOREIGN KEY(RM_SHOP_ID_FK)
      REFERENCES SHOP_MST (SM_SHOP_ID_PK) ON UPDATE RESTRICT ON DELETE RESTRICT
)
ENGINE INNODB
COLLATE 'utf8mb4_0900_ai_ci'
ROW_FORMAT DEFAULT;


-- ----------------------------------------------------------------
--  TABLE SHOP_MEMBERSHIP_MST
-- ----------------------------------------------------------------

CREATE TABLE pos.SHOP_MEMBERSHIP_MST
(
   SMM_SHOP_MEMBERSHIP_TYPE_ID_PK    VARCHAR(20)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NOT NULL,
   SMM_SHOP_MEMBERSHIP_TYPE       VARCHAR(20)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NOT NULL,
   SMM_MAX_ACCOUNTS_ALLOWED       DECIMAL(20, 0) NULL,
   SMM_MAX_ITEMS_ALLOWED          DECIMAL(6, 0) NULL,
   SMM_MAX_EMPLOYEE-ALLOWED     DECIMAL(5, 0) NULL,
   SMM_MAX_OWNER_ALLOWED          DECIMAL(5, 0) NULL,
   SMM_NOTES                      VARCHAR(200)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NULL,
   SMM_CRTD_BY                 VARCHAR(50)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NOT NULL,
   SMM_CRTD_TMSTP               TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
   SMM_MODFD_BY                 DECIMAL(10, 0) NULL,
   SMM_MODFD_TMSTP               TIMESTAMP(0) NULL ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(SMM_SHOP_MEMBERSHIP_TYPE_ID_PK)
)
ENGINE INNODB
COLLATE 'utf8mb4_0900_ai_ci'
ROW_FORMAT DEFAULT;


-- ----------------------------------------------------------------
--  TABLE TRANSACTION_MST
-- ----------------------------------------------------------------

CREATE TABLE pos.TRANSACTION_MST
(
   TM_TRANSACTION_ID_PK       DECIMAL(10, 0) NOT NULL,
   TM_ITEM_ACTUAL_PRICE    DECIMAL(10, 0) NOT NULL,
   TM_ITEM_SALE_PRICE      DECIMAL(5, 0) NOT NULL,
   TM_QUNTITY              DECIMAL(5, 0) NOT NULL,
   TM_TOTAL_PRICE          DECIMAL(10, 2) NULL,
   TM_NOTES                VARCHAR(100)
                          CHARACTER SET utf8mb4
                          COLLATE utf8mb4_0900_ai_ci
                          NULL,
   TM_CRTD_BY                 VARCHAR(50)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NOT NULL,
   TM_CRTD_TMSTP               TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
   TM_MODFD_BY                 DECIMAL(10, 0) NULL,
   TM_MODFD_TMSTP               TIMESTAMP(0) NULL ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(TM_TRANSACTION_ID_PK)
)
ENGINE INNODB
COLLATE 'utf8mb4_0900_ai_ci'
ROW_FORMAT DEFAULT;


-- ----------------------------------------------------------------
--  TABLE TRANSACTION_TYPE_MST
-- ----------------------------------------------------------------

CREATE TABLE pos.TRANSACTION_TYPE_MST
(
   TTM_TRANSACTION_TYPE_ID_PK   DECIMAL(10, 0) NOT NULL,
   TTM_TRANSACTION_TYPE       VARCHAR(20)
                            CHARACTER SET utf8mb4
                            COLLATE utf8mb4_0900_ai_ci
                            NOT NULL
                            COMMENT 'Purchase, Sale, Repair, Salary, Service consumed',
   TTM_TRANSACTION_NATURE     VARCHAR(20)
                            CHARACTER SET utf8mb4
                            COLLATE utf8mb4_0900_ai_ci
                            NULL,
   TTM_SHOP_ID_FK                DECIMAL(20, 0) UNSIGNED NOT NULL,
   TTM_NOTES                  VARCHAR(200)
                            CHARACTER SET utf8mb4
                            COLLATE utf8mb4_0900_ai_ci
                            NULL,
	TTM_CRTD_BY                 VARCHAR(50)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NOT NULL,
   TTM_CRTD_TMSTP               TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
   TTM_MODFD_BY                 DECIMAL(10, 0) NULL,
   TTM_MODFD_TMSTP               TIMESTAMP(0) NULL ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(TTM_TRANSACTION_TYPE_ID_PK),
   CONSTRAINT `FK_jan_transaction_type_master_1` FOREIGN KEY(TTM_SHOP_ID_FK)
      REFERENCES SHOP_MST (SM_SHOP_ID_PK) ON UPDATE RESTRICT ON DELETE RESTRICT
)
ENGINE INNODB
COLLATE 'utf8mb4_0900_ai_ci'
ROW_FORMAT DEFAULT;


-- ----------------------------------------------------------------
--  TABLE SHOP_MST
-- ----------------------------------------------------------------

CREATE TABLE pos.SHOP_MST
(
   SM_SHOP_ID_PK                    DECIMAL(20, 0) UNSIGNED
                                NOT NULL
                                COMMENT 'Primary key of shop master table',
   SM_SHOP_NAME                  VARCHAR(50)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NOT NULL,
   SM_SHOP_DISPLAY_NAME          VARCHAR(50)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NOT NULL
                                COMMENT '	',
   SM_SHOP_LOGO                  VARCHAR(50)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NULL,
   SM_ADDRESS_LINE1              VARCHAR(50)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NOT NULL,
   SM_TEHSIL                     VARCHAR(30)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NOT NULL,
   SM_DISTRICT                   VARCHAR(30)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NOT NULL,
   SM_ZIP                        DECIMAL(10, 0) NOT NULL,
   SM_MOBILE                     DECIMAL(12, 0) NOT NULL,
   SM_EMAIL                      VARCHAR(70)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NULL,
   SM_SHOP_MEMBERSHIP_TYPE_ID    DECIMAL(20, 0) NULL,
   SM_STATUS                     VARCHAR(20)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NOT NULL
                                DEFAULT 'ACTIVE'
                                COMMENT 'Allowed values ACTIVE/INACTIVE',
   SM_NOTES                      VARCHAR(200)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NULL
                                COMMENT 'General comments	',
   SM_CRTD_BY                 VARCHAR(50)
                                CHARACTER SET utf8mb4
                                COLLATE utf8mb4_0900_ai_ci
                                NOT NULL,
   SM_CRTD_TMSTP               TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
   SM_MODFD_BY                 DECIMAL(10, 0) NULL,
   SM_MODFD_TMSTP               TIMESTAMP(0) NULL ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(SM_SHOP_ID_PK)
)
COMMENT 'Stores shop details'
ENGINE INNODB
COLLATE 'utf8mb4_0900_ai_ci'
ROW_FORMAT DEFAULT;