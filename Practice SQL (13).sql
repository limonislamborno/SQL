select * from departments;

describe departments;

select * from SYS.role_sys_privs;

select * from SYS.role_tab_privs;

select * from SYS.user_role_privs;

select *
  FROM user_tab_cols;
--w2_2.1_1

select table_name, owner
    FROM all_tables
    where owner <> 'HR';
--2
select * from dictionary;
select * from SYS.user_objects;
where table_name like '%USERS%';

select * from cat;
  