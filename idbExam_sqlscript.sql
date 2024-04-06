REM   Script: evidence exam
REM   Idb_exam
--5.Displays all employees' ename and job_id and salary where salary is salary and 30% bonus.

SELECT (first_name||' '||last_name) AS ename, job_id, (salary+salary*0.3) AS salary 
	FROM hr.employees;
--5

--5.1Displays all employees' ename and job_title and salary where salary is salary and 30% bonus.

SELECT (first_name||' '||last_name) AS ename, job_title, (salary+salary*0.3) AS salary  
	FROM hr.employees e JOIN jobs j 
    ON (e.job_id = j.job_id);    
--5.1

--4.Displays the department numbers and average salaries for those departments
--with a maximum salary that is greater than 12000?

SELECT department_id, avg(salary) 
	FROM hr.employees 
		GROUP BY department_id 
			HAVING max(salary) > 12000;
--4

--3.Create a query to display the enames, salary of all employees
--who earn less than the minimum salary. 

SELECT (first_name||' '||last_name) AS ename, salary 
	FROM hr.employees 
		WHERE salary = (SELECT min(salary) 
					FROM hr.employees);
--3


--2.Display the name whose name start from ‘A’?

SELECT first_name 
	FROM hr.employees 
		WHERE first_name LIKE 'A%';
--2


--1.Create a table and name using your ID preceded by emp , which have 5 fields as
--eid, ename, salary, hire_date and address with appropriate data types and
--create primary key on eid.

CREATE TABLE emp1277609( 
	eid Int 
	CONSTRAINT SYS_emp609_pk primary key, 
	ename varchar2(30), 
	salary number(8,2), 
	hire_date date,
    address varchar2(30)
);
--1
Insert INto emp1277609 
values(1,'Fatema',26565,'10-Dec-2020','Dhaka');

select * from emp1277609;


--Create a table and name using your ID preceded by emp , which have 5 fields as
--eid, ename, salary, hire_date and address with appropriate data types and
--create primary key on eid.

CREATE TABLE emp1277777( 
	eid Int 
	CONSTRAINT SYS_emp779_pk primary key, 
	ename varchar2(30), 
	salary number(8,2), 
	hire_date date, 
	address varchar2(30) 
);

Insert INto emp1277777 
values(1,'Fatema',26565,'10-Dec-2020','Dhaka');

select * from emp1277777;
--1.2

REM Bonus for 2
SELECT (first_name||' '||last_name) AS ename 
	FROM hr.employees 
		WHERE (first_name||' '||last_name) LIKE 'A%';