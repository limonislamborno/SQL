SELECT first_name ||q'[ java's student ]'||last_name
    FROM employees;
    
SELECT department_id
    FROM employees;
    
SELECT DISTINCT department_id
    FROM employees;
    
SELECT *
FROM employees
WHERE salary BETWEEN 10000 AND 150000;

SELECT *
FROM employees
WHERE salary in(10000,170000,240000);

SELECT *
    FROM employees
        WHERE first_name like 'K%_v%';

SELECT last_name, hire_date,salary, commission_pct
    FROM employees
        WHERE salary<=150000
            ORDER BY 3 DESC;

