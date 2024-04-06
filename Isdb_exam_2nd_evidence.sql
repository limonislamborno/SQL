REM IsDB Scholarship Round 55,Evidence by Assessor	Module:   Database Development using Oracle 12c
REM	Full Marks: 50                                                    Duration: 45 Minutes

--Question 01
CREATE TABLE emp1277609 (
    eid       INT
        CONSTRAINT emp_609_pk PRIMARY KEY,
    ename     VARCHAR2(30),
    salary    NUMBER(8, 2),
    hire_date DATE,
    address   VARCHAR(20)
);

--Question_02

ALTER TABLE emp1277609 ADD (
    department_id NUMBER(4),
    dept_name     VARCHAR2(30)
);

--Question 03

INSERT INTO emp1277609 VALUES (
    98,
    'Fatema',
    568923.3,
    '08-Oct-2020',
    'Dhaka',
    40,
    'Administration'
);


INSERT INTO emp1277609 VALUES (
    99,
    'Arman',
    688923.3,
    '28-Jan-2022',
    'Dhaka',
    80,
    'Sales'
);

--Question 04

CREATE VIEW emp_vu80 AS
    SELECT
        ename,
        dept_name,
        salary
    FROM
        emp1277609
    WHERE
        department_id = 80;


--Question 05

CREATE SEQUENCE eid_609_seq 
    START WITH 100 
    INCREMENT BY 1 
    MAXVALUE 999999999999 
    NOCYCLE 
    NOCACHE;

--Question 06

INSERT INTO emp1277609
    SELECT
        e.employee_id,
        e.first_name,
        e.salary,
        e.hire_date,
        l.city,
        d.department_id,
        d.department_name
    FROM
        employees e
        JOIN departments d ON ( e.department_id = d.department_id )
        JOIN locations   l ON ( d.location_id = l.location_id )
    WHERE
        d.department_id = 80;


--Answer Check.

        SELECT
    *
FROM
    emp1277609;
    
    SELECT
    *
FROM
    emp_vu80;