SELECT  job_id,employees.manager_id
FROM employees
WHERE department_id = 80
MINUS
SELECT job_id, retired_employees.manager_id
FROM retired_employees
WHERE department_id = 90;
--Minus operator

SELECT location_id, department_name "Department",
TO_CHAR(NULL) "Warehouse location"
FROM departments
UNION 
SELECT location_id, TO_CHAR(NULL) "Department",
state_province
FROM locations;
-- match number of columns for set operator

SELECT first_name, job_id, hire_date "Hire Date"
    FROM employees
UNION
SELECT first_name, job_id, TO_DATE(NULL) 
FROM retired_employees;
--create dummy column with null value and to_date function so dummy column match data type with hire_date column.

CREATE TABLE emp_1277608(
eid int primary key,
ename varchar2(30),
salary NUMBER(8,2),
hire_date    DATE ,
address VARCHAR2(50)
);

SELECT *
FROM emp_1277608;

INSERT INTO emp_1277608(eid,ename,salary,hire_date,address)
VALUES(1,'Ahmed',14562.3,'10-Jan-1999','Dhaka');

INSERT INTO emp_1277608(eid,ename,salary,hire_date,address)
VALUES(5,'Fatema',54562.3,'10-Jan-1998','Dhaka');

INSERT INTO emp_1277608(eid,ename,salary,hire_date,address)
VALUES(&id,'&name',&salary,'&date','&address');
-- create a table with 5 columns and rows.
commit;
SELECT DEPARTMENT_ID, avg(salary)
FROM employees
GROUP BY DEPARTMENT_ID
HAVING DEPARTMENT_ID In (SELECT  DEPARTMENT_ID
            FROM employees
            HAVING MAX(salary)>12000);
            
SELECT DEPARTMENT_ID, MAX(salary)
            FROM employees
            group by DEPARTMENT_ID
            HAVING MAX(salary)>12000;

SELECT * FROM emp_1277608;

INSERT INTO emp_1277608
VALUES(6,'Umai',56983.2,'16-Apr-1999',null);

UPDATE emp_1277608
SET 
address='khulna'
WHERE eid=6;

INSERT INTO emp_1277608(eid,ename,salary,hire_date)
SELECT employee_id, last_name, salary,hire_date
  FROM employees
WHERE last_name LIKE '%king%';

create table emp_1277607(
    eid int primary key,
    ename VARCHAR2(30),
    phone_number NUMBER(15),
    address varchar2(50)
);

insert into emp_1277607
values(1,'ara',0125878936,'Dhaka');

select * from emp_1277607;



create table emp_1277606(
    eid int primary key,
    ename VARCHAR2(30),
    phone_number VARCHAR2(15),
    address varchar2(50)
);

insert into emp_1277606
values(1,'ara','0125878936','Dhaka');

insert into emp_1277606
values(2,'Rara','+880125878936','Dhaka');


select * from emp_1277606;





