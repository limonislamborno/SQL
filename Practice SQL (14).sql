select employee_id, first_name
    from employees e 
    where exists (select null from employees where manager_id = e.employee_id);
    
    SELECT e.last_name, e.department_id, d.department_name
FROM employees e LEFT OUTER JOIN departments d
ON (e.employee_id = d.department_id) 
order by e.department_id;

SELECT e.last_name, e.department_id, d.department_name
FROM employees e LEFT OUTER JOIN departments d
ON (e.department_id = d.department_id) 
order by e.department_id;

select * from departments;