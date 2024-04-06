SELECT department_name,location_id
    FROM departments;
    
SELECT first_name||' '||last_name "Full Name", salary*12 "Annual Salary"
    FROM employees
        WHERE salary*12 > 100000;
        
SELECT 
    INITCAP('My Full name is '||first_name||' '||last_name) "Full Name", salary*12 "Annual Salary"
        FROM employees
            WHERE salary*12 > 100000;    
            
            
            
            
            
            