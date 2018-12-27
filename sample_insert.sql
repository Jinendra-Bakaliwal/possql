INSERT INTO pos.`jan_shop_membership_details`(
               shop_membership_type_id,
               shop_membership_type_display_name,
               shop_membership_type,
               max_accounts_allowed,
               max_items_allowed,
               max_employee_allowed,
               max_owner_allowed,
               notes,
               created_date,
               updated_by,
               updated_date)
     VALUES (1,
             'Jan',
             'Default',
             1,
             1,
             1,
             1,
             'notes',
             '2018-12-17 21:43:09.0',
             NULL,
             NULL);

INSERT INTO pos.`jan_shop_membership_details`(
               shop_membership_type_id,
               shop_membership_type_display_name,
               shop_membership_type,
               max_accounts_allowed,
               max_items_allowed,
               max_employee_allowed,
               max_owner_allowed,
               notes,
               created_date,
               updated_by,
               updated_date)
     VALUES (2,
             'Jan',
             'Default',
             1,
             1,
             1,
             1,
             'notes',
             '2018-12-17 22:38:52.0',
             NULL,
             NULL);

INSERT INTO pos.`jan_shop_membership_details`(
               shop_membership_type_id,
               shop_membership_type_display_name,
               shop_membership_type,
               max_accounts_allowed,
               max_items_allowed,
               max_employee_allowed,
               max_owner_allowed,
               notes,
               created_date,
               updated_by,
               updated_date)
     VALUES (3,
             'Jan',
             'Default',
             1,
             1,
             1,
             1,
             'notes',
             '2018-12-17 22:43:52.0',
             NULL,
             NULL);

INSERT INTO pos.`role`(role_id, name)
     VALUES (4, 'ROLE_ADMIN');

INSERT INTO pos.`role`(role_id, name)
     VALUES (5, 'ROLE_USER');

INSERT INTO pos.`hibernate_sequence`(next_val)
     VALUES (89);


INSERT INTO pos.`verificationtoken`(id,
                                    `expiry_Date`,
                                    token,
                                    member_id)
     VALUES (88,
             NULL,
             'fe040eab-228f-48a3-87df-522584e92b50',
             87);



INSERT INTO pos.`privilege`(privilege_id, name)
     VALUES (1, 'READ_PRIVILEGE');

INSERT INTO pos.`privilege`(privilege_id, name)
     VALUES (2, 'WRITE_PRIVILEGE');

INSERT INTO pos.`privilege`(privilege_id, name)
     VALUES (3, 'CHANGE_PASSWORD_PRIVILEGE');

INSERT INTO pos.`roles_privileges`(role_id, privilege_id)
     VALUES (4, 1);

INSERT INTO pos.`roles_privileges`(role_id, privilege_id)
     VALUES (4, 2);

INSERT INTO pos.`roles_privileges`(role_id, privilege_id)
     VALUES (4, 3);

INSERT INTO pos.`roles_privileges`(role_id, privilege_id)
     VALUES (5, 1);

INSERT INTO pos.`roles_privileges`(role_id, privilege_id)
     VALUES (5, 3);


COMMIT;