SELECT employee_id, first_name, last_name, job_id
    FROM employees
        WHERE salary >ALL(SELECT AVG(salary)
                                FROM employees
                                    GROUP BY department_id);
--                                    Q20 w3resource
SELECT first_name, last_name, department_id
    FROM employees
        WHERE salary >3700;
--        Q21 w3resource
SELECT department_id, SUM(salary)
    FROM employees
        WHERE employee_id IS NOT NULL
            AND department_id IS NOT NULL
            GROUP BY department_id
                ORDER BY department_id;
--                Q22 w3resource

SELECT departments.department_id, result1.total_amt 
    FROM hr.departments,  
        ( SELECT employees.department_id, SUM(employees.salary) total_amt  
            FROM hr.employees  
            GROUP BY department_id) result1 
        WHERE result1.department_id = departments.department_id;
-- Q22 ,solve with subquries on FROM clause
SELECT employee_id, first_name,last_name, 
          CASE job_id
                    WHEN 'ST_MAN' THEN 'SALESMAN'
                    WHEN 'IT_PROG' THEN 'DEVELOPER'
                    ELSE job_id
                    END
          designation,salary
    FROM employees;
-- Q23 



















