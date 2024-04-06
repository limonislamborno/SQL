--24. Write a query to display the employee id, name ( first name and last name ), salary and the SalaryStatus column with 
--a title HIGH and LOW respectively for those employees whose salary is more than and less than the average salary of all employees.
SELECT employee_id,first_name,last_name,salary,
        CASE when salary>=(SELECT avg(salary) from employees)THEN 'HIGH' ELSE 'LOW'END AS SalaryStatus
            FROM employees;
            
--25. Write a query to display the employee id, name ( first name and last name ), SalaryDrawn, AvgCompare (salary - the average salary of all employees) 
--and the SalaryStatus column with a title HIGH and LOW respectively 
--for those employees whose salary is more than and less than the average salary of all employees.          
SELECT employee_id, first_name, last_name, salary "SalaryDrawn",ROUND(salary-(select avg(salary) FROM employees),2) "AvgCompare",
    CASE WHEN salary>=(select avg(salary) FROM employees) THEN 'HIGH' else 'LOW' end "SalaryStatus"
    FROM employees;
    
--26. From the following table, write a SQL query to find all those departments where at least one employee is employed. Return department name
SELECT d.department_name
FROM departments d JOIN employees e
    USING (department_id)
WHERE department_id not null;
--not done
SELECT  department_name 
FROM departments 
WHERE department_id IN 
(SELECT DISTINCT(department_id) 
FROM employees);

--27. From the following tables, write a SQL query to find employees who work in departments located in the United Kingdom. Return first name.
SELECT e.first_name
FROM employees e join departments d
    using (department_id)
    JOIN locations l
    using (location_id)
WHERE country_id='UK';

--28. From the following table, write a SQL query to find out which employees are earning more than the average salary 
--and who work in any of the IT departments. Return last name.
SELECT e.last_name
FROM employees e JOIN departments d
USING (department_id)
WHERE salary>(SELECT avg(salary) FROM employees)
AND department_name LIKE 'IT%';

--29. From the following table, write a SQL query to find all those employees who earn more than an employee whose last name is 'Ozer'. 
--Sort the result in ascending order by last name. Return first name, last name and salary.
SELECT first_name, last_name, salary
FROM employees
WHERE salary>(SELECT salary FROM employees WHERE last_name like 'Ozer');


--30. From the following tables, write a SQL query find the employees who report to a manager based in the United States. Return first name, last name.

SELECT first_name, last_name
FROM employees
WHERE manager_id IN (SELECT e.manager_id 
                        FROM employees e JOIN departments d
                            USING (department_id)
                            JOIN locations l
                            USING (location_id)
                            WHERE country_id='US');

--31. From the following tables, write a SQL query to find those employees 
--whose salaries exceed 50% of their department's total salary bill. Return first name, last name.

SELECT w.first_name, w.last_name
FROM employees w
WHERE salary>(SELECT SUM(salary)*0.5
                    FROM employees s
                    WHERE w.department_id= s.department_id);
--department_id=80,sum(salary)*0.5 check with salary of employee with department_id 80.                    

--32. From the following tables, write a SQL query to find those employees who are managers. Return all the fields of employees table.

SELECT * 
FROM employees
WHERE employee_id IN (SElECT DISTINCT manager_id FROM employees);

--33. From the following table, write a SQL query to find those employees who manage a department. Return all the fields of employees table.

SELECT * 
FROM employees
WHERE employee_id =ANY (SELECT manager_id FROM departments);

--34. From the following table, write a SQL query to search for employees who receive such a salary, which is the maximum salary 
--for salaried employees, hired between January 1st, 2002 and December 31st, 2003. Return employee ID, first name, last name, salary, department name and city.

SELECT a.employee_id, a.first_name, a.last_name, a.salary, b.department_name, c.city  
FROM employees a, departments b, locations c  
WHERE a.salary =  
(SELECT MAX(salary) 
FROM employees 
WHERE hire_date BETWEEN '01/Jan/2002' AND '12/Dec/2003') 
AND a.department_id=b.department_id 
AND b.location_id=c.location_id;

