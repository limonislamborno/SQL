SELECT
    eid,
    ename,
    e_id,
    e_name
FROM
    emp_1277608 l
    LEFT OUTER JOIN emp_1277609 r ON ( a8.eid = a9.e_id );

SELECT 'Dear Customer'||' '||first_name||',' FROM employees;


SELECT 'Dear Customer' ||  first_name  || ',' FROM employees;

drop table emp_888 PURGE;

FLASHBACK table hr.emp_888 to BEFORE DROP;
/* hjdhf
dfhd
dfhdfj
djfkdj*/

REM

ALTER TABLE emp_777
Modify e_name constraint emp_777_nNull Not null;

ALTER TABLE emp_777
Modify constraint emp_778_nNull Not null (e_dob
);

CREATE VIEW emp34 AS
    SELECT
        department_id,
        AVG(salary) average,
        MAX(salary) maxsalary
    FROM
        employees
    GROUP BY
        department_id
    ORDER BY
        department_id;

select * from emp34;