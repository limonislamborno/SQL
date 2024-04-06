CREATE SEQUENCE emp_pk START WITH 101;
CREATE TABLE emp_1277609(
    e_id number DEFAULT emp_pk.nextval NOT NULL,
    e_name varchar2(30),
    e_dob date,
    e_hire_date date,
    salary number(8,2)
);

INSERT INTO emp_1277609(e_name,e_dob,e_hire_date,salary)
VALUES('Fahad','02-Feb-1992','25-Dec-2020',25638.2); 

INSERT INTO emp_1277609(e_name,e_dob,e_hire_date,salary)
VALUES('Sad','03-Feb-1992','25-Dec-2021',45638.2); 

INSERT INTO emp_1277609(e_name,e_dob,e_hire_date,salary)
VALUES('Iman','02-Jan-1995','22-Dec-2020',45632.2); 

INSERT INTO emp_1277609(e_name,e_dob,e_hire_date,salary)
VALUES('Tithi','12-Mar-1996','05-Jan-2020',25638.2); 

INSERT INTO emp_1277609(e_name,e_dob,e_hire_date,salary)
VALUES('Nahid','05-Feb-1992','05-Dec-2020',25638.2); 

Insert INto emp_1277609(e_name,e_dob,e_hire_date,salary)
values('Tom','08-Feb-1999','09-Jan-2020',89456.2);


SELECT * FROM emp_1277609;

DESCRIBE emp_1277609;
--1
--2

SELECT * FROM emp_1277609
    OFFSET 4 ROWS FETCH NEXT 1 ROW ONLY;
--3 not good code.


SELECT * FROM emp_1277609
ORDER BY e_id desc
FETCH FIRST 1 ROW ONLY;
--3 THIS is dynamic and better code.

SELECT * FROM emp_1277609
    WHERE rowid >=(SELECT max(rowid) from emp_1277609);
    
    SELECT count(e_id) from emp_1277609;


SELECT * FROM emp_1277609
    WHERE e_name LIKE '%a%';
--4


SELECT first_name, last_name, salary
    FROM employees
        WHERE salary < (SELECT salary 
                            FROM employees
                                WHERE employee_id = 182);
--5

select * from (select first_name, last_name, salary from employees where salary < (SELECT salary 
        FROM employees
            WHERE employee_id = 182));
    
    
SELECT salary 
        FROM employees
            WHERE employee_id = 182;
            
            

SELECT d.department_name, round(avg(salary),2) "Average Salary", count(employee_id) "Number of Employees"
    FROM employees e JOIN departments d
        ON (e.department_id = d.department_id)
        WHERE e.employee_id IN (SELECT employee_id
                                    FROM employees
                                        WHERE e.commission_pct  IS NOT NULL)
        GROUP BY d.department_name;
--6 

commit;
SELECT * from employees WHERE commission_pct  IS NOT NULL;   
select * from departments WHERE department_id=80;

        
            
describe user_sequences;
SeLECT * from user_sequences;

CREATE SEQUENCE emp888_pk START WITH 101;
CREATE TABLE emp_888(
    e_id number DEFAULT emp888_pk.nextval 
    CONSTRAINT emp_888_pk primary key,
    e_name varchar2(30),
    e_dob date,
    e_hire_date date,
    salary number(8,2)
);


describe emp_777;

select * from SYS.user_constraints;

SELECT department_id, first_name || ' ' || last_name AS Employee_name, salary 
	FROM employees a
		WHERE salary = 
			(SELECT MAX(salary) 
				FROM employees 
			WHERE department_id = a.department_id);
            
SELECT MAX(salary) 
				FROM employees 
			WHERE department_id = department_id;            

SELECT department_id, first_name || ' ' || last_name AS Employee_name, salary 
	FROM employees a
		WHERE salary = 
			(SELECT salary 
				FROM employees 
			WHERE department_id IN (select department_id from departments)
            group by department_id;);
            
 select max(salary),department_d from employees
            GROUP BY a.department_id;           

SELECT MAX(salary)
				FROM employees 
			WHERE department_id IN (select department_id from departments)
            group by department_id;



