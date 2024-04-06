SELECT * FROM hr.employees
    WHERE salary = (select max(salary) from hr.employees WHERE salary < (select max(salary) from hr.employees 
    WHERE salary< (select max(salary) from hr.employees)));
--third highest salary.
SELECT * FROM hr.employees
    WHERE salary = (select min(salary) from hr.employees where salary >(select min(salary) from hr.employees));
--second lowest salary.
select * from hr.employees ORDER BY salary;

CREATE TABLE fatemaZohora(
    e_id int 
    CONSTRAINT fatema_pk primary key,
    e_name varchar2(20),
    e_email varchar2(20),
    e_hire_date date,
    salary NUMBER(8,2)
); 
--1
CREATE SEQUENCE fatemaZ
    START WITH 101
    INCREMENT BY 1
    MAXVALUE 99999
    nocycle
    nocache;
--2
INSERT INTO fatemazohora
VALUES(FATEMAZ.nextval,'FATEMA','fatema@gmail.com','10-Jan-2020',20000);

INSERT INTO fatemazohora
VALUES(FATEMAZ.nextval,'EMA','ema@gmail.com','02-Jan-2021',22000);

INSERT INTO fatemazohora
VALUES(FATEMAZ.nextval,'Rana','rana@gmail.com','18-Mar-2021',32000);

INSERT INTO fatemazohora
VALUES(FATEMAZ.nextval,'Jon','jonm@gmail.com','10-Jan-2019',50000);

INSERT INTO fatemazohora
VALUES(FATEMAZ.nextval,'TEA','tea@gmail.com','21-Sep-2018',45000);

SELECT * from fatemazohora;
--3

SELECT * FROM fatemazohora
    WHERE e_name like '%a%'
    AND salary < (SELECT max(salary) FROM fatemazohora);
--4



SELECT d.department_name,avg(salary)"Average Salary",count(commission_pct) "Number of employees"
    FROM employees e JOIN departments d
            ON (e.department_id = d.department_id)
        WHERE e.commission_pct is not null 
            And e.department_id is not null 
                GROUP BY d.department_name;
--5

SELECT d.department_name,round(avg(salary),2)"Average Salary",count(*) "Number of employees"
    FROM employees e JOIN departments d
            ON (e.department_id = d.department_id)
        WHERE e.commission_pct is not null 
             GROUP BY department_name;
--5.1

SELECT d.department_name, avg(salary)"Average Salary", count(commission_pct) "Number of employees"
    FROM employees e JOIN departments d
            ON (e.department_id = d.department_id)
        WHERE e.employee_id In (SELECT employee_Id 
                                    from employees 
                                        WHERE commission_pct is not null) 
                GROUP BY d.department_name;
--5..2
SELECT d.department_name, avg(salary)"Average Salary", count(commission_pct) "Number of employees"
    FROM employees e ,departments d
    WHERE e.department_id = d.department_id
    AND commission_pct is not null
    GROUP BY department_name;
--5.3 

SELECT first_name, last_name, employee_id
    FROM employees
        WHERE department_id IN 
            (SELECT department_id 
                    FROM departments
                        WHERE location_id = (SELECT location_id
                                                FROM locations
                                                    WHERE city = 'Toronto'));
--6                                
select * from locations;
SELECT * FRom departments WHERE location_id = 1700;
select * from employees where department_id IS NULL;




select department_id,avg(salary),count(commission_pct) from employees 
GROUP BY department_id;

SELECT employee_Id 
                                    from employees 
                                        WHERE commission_pct is not null

SELECT d.department_name,
           (SELECT AVG(e.salary)
            FROM hr.employees e
            WHERE e.department_id = d.department_id
              AND e.commission_pct IS NOT NULL) AS avg_salary, 
           (SELECT COUNT(e.employee_id)
            FROM hr.employees e
            WHERE e.department_id = d.department_id
              AND e.commission_pct IS NOT NULL) AS "No of employees" 
          FROM hr.departments d
           WHERE d.department_id In (SELECT department_id
                                        FROM hr.employees
                                            WHERE commission_pct is not null);

SELECT AVG(e.salary)
            FROM hr.employees e, hr.departments d
            WHERE e.department_id = d.department_id
              AND e.commission_pct IS NOT NULL;SELECT to_date('2020 May 5','yyyy Mon dd') from dual;



SELECT to_date('2020 May 5','yyyy Mon dd') from dual;

SELECT to_date('2020 May 05','fxyyyy Mon dd') from dual;
SELECT to_date('2020 May 05','fxyyyy Mon dd') from dual;

SELECT to_char(hire_date,'yyyyMondd') from employees;


SELECT to_char((to_date('2020 May 05','fxyyyy Mon dd')),'fmyyyy Mon dd') from dual;


