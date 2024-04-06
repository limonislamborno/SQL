SELECT first_name, last_name, hire_date
    FROM hr.employees
        WHERE department_id = (SELECT department_id
                                    FROM hr.employees
                                        WHERE first_name = 'Clara')
        AND first_name <> 'Clara';
--13
--Check answer
SELECT * FROM hr.employees WHERE first_name = 'Clara';
SELECT
    * FROM hr.employees
        WHERE department_id = 80;
-- depa_id 80 correct ans.

SELECT employee_id, first_name, last_name
    FROM hr.employees
        WHERE department_id IN (SELECT
                                    department_id FROM hr.employees
                                        WHERE first_name LIKE '%T%')
                                        ORDER BY 2;
--14
--ANS check de_id 80,50.
SELECT
    department_id FROM hr.employees
        WHERE first_name LIKE 'T%';
        
SELECT employee_id, first_name, salary,department_id
    FROM hr.employees
        WHERE salary > (SELECT avg(salary)
                            FROM hr.employees)
        AND department_id IN (SELECT department_id FROM hr.employees
                                    WHERE first_name LIKE '%J%');
        
SELECT avg(salary)
    FROM hr.employees;

SELECT department_id FROM hr.employees
        WHERE first_name LIKE '%J%';
--15

SELECT first_name, last_name, employee_id, job_id
    FROM hr.employees
        WHERE department_id = (SELECT department_id from hr.departments
                                    WHERE location_id = (select location_id
                                                            FROM hr.locations
                                                                WHERE city= 'Toronto'));
        
--check ans
SELECT department_id from hr.departments
        WHere location_id = (select location_id
                                FROM hr.locations
                                    WHERE city= 'Toronto');

SELECT * FROM hr.employees WHERE department_id = 20;
--16

SELECT employee_id, first_name, last_name, job_id
     FROM hr.employees
        WHERE salary < (SELECT salary from hr.employees where job_id = 'MK_MAN');
-- check salary

SELECT salary from hr.employees where job_id = 'MK_MAN';
--18

SELECT employee_id, first_name, last_name, job_id
     FROM hr.employees
        WHERE salary > ALL (SELECT avg(salary)
                                FROM hr.employees
                                    GROUP BY department_id);

SELECT avg(salary)
        FROM hr.employees
                GROUP BY department_id;

SELECT * FROM hr.employees WHERE department_id is not null;

select * from hr.employees order by 1;

select * from departments;

SELECT department_id,sum(salary) 
    FROM hr.employees 
    WHERE department_id is not null
    GROUP BY department_id
    order by 1;
--22.1 
    
SELECT department_id,sum(salary) 
    FROM hr.employees 
    GROUP BY department_id
    HAVING department_id is not null
    ORDER BY 1;
--22.2

SELECT department_id, sum(salary)
    FROM hr.employees
        WHERE department_id IN (SELECT department_id
                                    from hr.employees
                                        WHERE department_id is not null
                                            group by department_id
                                            HAVING count(*)>=1)
        GROUP BY department_id
        ORDER BY 1;
--22.3

SELECT department_id
    from hr.employees
        WHERE department_id is not null
            group by department_id
            HAVING count(*)>=1;
                    
                                    
SELECT max(salary) from hr.employees
        where salary < (select MAX(salary)from hr.employees);
--second highest salary


















