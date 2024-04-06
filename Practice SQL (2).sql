--Practice 8-1:subquery
--1. Write a query to display the last name and hire date of any employee in the same
--   department as Zlotkey. Exclude Zlotkey.
       
SELECT last_name, hire_date
    FROM hr.employees
        WHERE department_id IN (select department_id from employees WHERE last_name = 'Zlotkey');

--hint
select department_id from employees WHERE last_name = 'Zlotkey';
--2. Create a query to display the employee numbers and last names of all employees who earn more than the average salary. 
--Sort the results in ascending order of salary.

SELECT employee_id, last_name
    FROM employees
    WHERE SALARY >(SELECT avg(salary) FROM employees);
--3. Write a query that displays the employee numbers and last names of all employees who work in a department 
--with any employee whose last name contains a u. Place your SQL statement in a text file named lab6_3.sql. Run your query.

SELECT employee_id, last_name
    FROM employees
    WHERE department_id IN (select department_id from employees WHERE last_name LIKE '%u%');
    
-- 4.The HR department needs a report that displays the last name, department number,
-- and job ID of all employees whose department location ID is 1700.

SELECT last_name, department_id, job_id
	FROM hr.employees
		Where department_id IN (SELECT department_id
    								FROM hr.departments
    										WHERE location_id = 1700);

SELECT * from hr.departments;

-- Modify the query so that the user is prompted for a location ID. Save this to a file named lab_08_04.sql.
SELECT last_name, department_id, job_id
	FROM hr.employees
		Where department_id IN (SELECT department_id
    								FROM hr.departments
    										WHERE location_id = '&location_id');

-- 5. Create a report for HR that displays the last name and salary of every employee 
-- who reports to King.
SELECT last_name, salary
	FROM hr.employees
		WHERE manager_id IN (select employee_id
    							FROM hr.employees
    									WHERE last_name = 'King');
-- check result.
SELECT count(employee_id) from hr.employees
	WHERE manager_id=100;

-- 6. Create a report for HR that displays the department number, last name, and job ID for e employee in 
--the Executive department.

SELECT department_id, last_name, job_id 
    FROM hr.employees
        WHERE   department_id = (SELECT department_id
                                    FROM departments
                                    WHERE department_name = 'Executive');

SELECT *
    FROM departments
    WHERE department_name = 'Executive';
-- 7.Create a report that displays a list of all employees whose salary is more than the salary of any employee 
--from department 60.

SELECT * FROM hr.employees
        WHERE salary > ANY (SELECT salary FROM hr.employees
                                WHERE department_id = 60);
--8. Modify the query in lab_08_03.sql to display the employee number, last name, and salary of all employees 
--who eam more than the average salary, and who work in a department with any employee 
--whose last name contains the letter "u." Save lab_08_03.sql as lab_08_08.sql again. Run the statement in lab_08_08.sql.

SELECT employee_id, last_name, salary
  FROM employees
    WHERE salary > (select avg(salary)from employees)
    AND department_id IN (select department_id from employees where last_name like '%u%');

-- check ans    
SELECT  last_name, department_id from employees where last_name like '%u%';



-- Practice 7-1:Using JOIN
-- 1. Write a query for the HR department to produce the addresses of all the departments.
-- Use the LOCATIONS and COUNTRIES tables. Show the location ID, street address, city, state or 
-- province, and country in the output. Use a NATURAL JOIN to produce the results.
SELECT location_id, street_address, city, state_province FROM hr.locations NATURAL JOIN hr.countries;
 
-- 2. The HR department needs a report of all employees with corresponding departments.
-- Write a query to display the last name, department number, and department name for these employees.
SELECT last_name, d.department_id, department_name
	FROM hr.employees e JOIN hr.departments d
		ON (e.department_id = d.department_id);

-- 3. THE HR department needs a report of employees IN Toronto. Dispaly the last_name , job, department number, and the 
-- department name for all employees who work in Toronto.

SELECT last_name, job_id, d.department_id, department_name
    FROM hr.employees e JOIN hr.departments d
        ON (e.department_id = d.department_id)
        JOIN hr.locations l
        ON (d.location_id = l.location_id)
        WHERE city = 'Toronto';
        
-- check answer dept_id 20 city Toronto

SELECT * FROM hr.departments
WHERE department_id = 20;

SELECT * FROM hr.locations
    WHERE location_Id = 1800;

-- 4. Create a report to display employees' last names and employee numbers along with their managers' last names and 
-- manager numbers. Label the columns Employee, Emp#, Manager, and Mgr#, respectively. Save your SQL statement as lab_07_04.sql. Run th query.

SELECT DISTINCT w.last_name "Employee", w.employee_id "Emp#", m.last_name "Manager", m.employee_id "Mgr#"
    FROM hr.employees w JOIN hr.employees m
        ON (w.manager_id = m.employee_id)
        ORDER BY 2;
--check ans
SELECT
    * FROM hr.employees WHERE employee_id IN (102,114,120,121,122,123,124,145,146,147);
SELECT * FROM hr.employees where manager_id is null;


-- 5. Modify lab_07_04.sql to display all employees, including King, who has no manager. Order the results by employee number.

SELECT DISTINCT w.last_name "Employee", w.employee_id "Emp#", m.last_name "Manager", m.employee_id "Mgr#"
    FROM hr.employees w LEFT OUTER JOIN hr.employees m
        ON (w.manager_id = m.employee_id)
        ORDER BY 2;
        
        
select * from hr.employees;

-- 6. Create a report for the HR department that displays employee last names, department numbers, 
-- and all the employees who work in the same department as a given employee. Give each column an appropriate label. Save the script to a file named lab_07_06.sql.
--          SKIP

-- 7. The HR department needs a report on job grades and salaries. To familiarize yourself with the JOB_GRADES table, first show 
-- the structure of the JOB_GRADES table. Then create a query that displays the name, job, department name, salary,
-- and grade for all employees.

--          SKIP

-- 8.The HR department wants to determine the names of all employees who were hired after Davies.
-- Create a query to display the name and hire date of any employee hired after employee Davies.

SELECT first_name||' '||last_name name, hire_date
    FROM hr.employees
        WHERE hire_date >ALL (SELECT hire_date
                                FROM hr.employees
                                    WHERE first_name = 'David');

 SELECT hire_date
        FROM hr.employees
            WHERE first_name = 'David';
-- 9. The HR department needs to find the names and hire dates of all employees who were hired before their managers,
-- along with their managers' names and hire dates.

SELECT first_name||' '||last_name name, hire_date
    FROM hr.employees e
        WHERE hire_date < (SELECT hire_date
                                FROM hr.employees
                                    WHERE e.manager_id = employee_id);

--10. Display the names and hire dates for all employees who were hired before their managers, along with 
--their manager’s names and hire dates. Label the columns Employee, Emp Hired, Manager, and Mgr Hired, respectively.


SELECT e.first_name "Employee", e.hire_date "Emp Hired", m.first_name "Manager", m.hire_date "Mgr Hired" 
    FROM hr.employees e JOIN hr.employees m
        ON (e.manager_id = m.employee_id)
        WHERE e.hire_date < (SELECT hire_date
                                FROM hr.employees 
                                    WHERE e.manager_id = employee_id);
                                    
        
SELECT (e.first_name||' '||e.last_name) "Employee", e.hire_date "Emp Hired", (m.first_name||' '||m.last_name) "Manager", m.hire_date "Mgr Hired" 
    FROM hr.employees e JOIN hr.employees m
        ON (e.manager_id = m.employee_id)
        WHERE e.hire_date < m.hire_date;
-- better code

        
select (e.first_name||' '||e.last_name) "Employee",employee_id "Employee" FROM hr.employees e;