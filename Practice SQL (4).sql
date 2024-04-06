SELECT *
    FROM employees;
    
SELECT first_name,last_name, SUBSTR(last_name,4,2)
    FROM employees;
    
SELECT SUBSTR ('HelloWorld',-5,1)
    FROM dual;

SELECT INSTR('HelloWorld','l',1,3)
    FROM dual;
    
SELECT first_name, INSTR(first_name, upper('e'))
    FROM employees;
    
SELECT first_name, SUBSTR(first_name,1,length(first_name)-2)
    FROM employees;
   

SELECT lpad(first_name,12,'*')
    FROM employees;

SELECT rpad(first_name,12,' @ *')
    FROM employees;

SELECT TRIM(LEADING 'E' FROM first_name) "NEW Name"
FROM employees;

SELECT TRIM(TRAILING '1' FROM 1234567896541) 
AS TRAILING_TRIM 
FROM dual;

SELECT *
    FROM jobs
        WHERE lower(job_id)='&job';
DESCRIBE jobs

SELECT CONCAT(CONCAT(last_name, '  ''s job catagory is '),job_id) "Job"
    FROM employees
        WHERE SUBSTR(job_id,4)= 'REP';

SELECT SUBSTR(job_id,4),last_name
    FROM employees;

SELECT employee_id,first_name, last_name NAME,
LENGTH (last_name), INSTR(last_name, 'a') "Contains 'a'?"
FROM employees
WHERE SUBSTR(last_name, -1, 1) = 'n';

SELECT last_name,
    UPPER(CONCAT(SUBSTR(last_name,1,8),'_US')) new
FROM employees;

SELECT ROUND(552.923,-3)
FROM dual;

SELECT CEIL(23.923)
FROM dual;

SELECT TRUNC(53.923,2)
FROM dual;

SELECT FLOOR(23.923)
FROM dual;

SELECT MOD(163,2)
FROM dual;

SELECT SESSIONTIMEZONE,Current_DATE FROM DUAL;

SELECT 'principal',substr('principal',length('principal')-6,length('principal')-7)
    FROM dual;
    
--18.06.23  SYSDATE function

SELECT ROUND((MONTHS_BETWEEN(SYSDATE,'01-JAN-1997'))/12,0)
    FROM dual; 

SELECT ROUND((SYSDATE-to_date('01-JAN-97','DD-MM-YYYY'))/365,0)
    FROM dual;

SELECT (SYSDATE-to_date('01-JAN-1997','DD-MM-YYYY'))/365
    FROM dual;

SELECT ADD_MONTHS(SYSDATE,-10) FROM dual;
SELECT ROUND(SYSDATE,'MONTH') FROM dual;
SELECT TRUNC(SYSDATE,'Month') FROM dual;
SELECT ROUND(to_date('01-JAN-1964','DD-MM-YYYY'),'YEAR') FROM dual;
SELECT TRUNC(to_date('01-JAN-1964','DD-MM-YYYY'),'YEAR') FROM dual;

SELECT NEXT_DAY (SYSDATE,'Friday') FROM dual;
    
SELECT employee_id, TO_CHAR(hire_date,'month/yyyy') FROM employees;

SELECT last_name, 
    TO_CHAR(hire_date,
                'fmDdspth "of" Month fmHH:MI:SS AM') "HIRE DATE"
                    FROM employees;
    
SELECT last_name, TO_CHAR(hire_date,'DD-MON-YYYY')
    FROM employees
        WHERE hire_date< TO_DATE('18-Jun-23','DD-Mon-RR');

SELECT last_name,phone_number,
    FROM employees
        WHERE phone_number IS NULL;
SELECT last_name, commission_pct, NVL(phone_number,'9') 
    FROM employees;

SELECT last_name,salary, NULLIF(last_name,last_name)
    FROM employees;
SELECT last_name, salary, commission_pct,
    COALESCE((salary+(commission_pct*salary)),salary+2000) "New salary"
        FROM employees;

SELECT last_name,job_id,salary,
    CASE job_id WHEN 'IT_PROG' THEN 1.10*salary
                WHEN 'ST_CLERK' THEN 1.10*salary
                WHEN 'SA_REP' THEN 1.10*salary
    ELSE salary END "REVISED SALARy"
FROM employees;    

SELECT last_name,job_id,salary,
    DECODE( job_id,'IT_PROG', 1.10*salary,
                'ST_CLERK', 1.10*salary,
                'SA_REP', 1.10*salary,
    salary)revised_salary
FROM employees;  

SELECT first_name,length(first_name)
    FROM employees
        WHERE length(first_name)= (SELECT (max(length(first_name)))
            FROM employees);
SELECT department_id,job_id, SUM(salary)
    FROM employees
        GROUP BY department_id,job_id;

SELECT department_id,job_id, SUM(salary)
    FROM employees
        GROUP BY job_id,department_id
            Order by department_id;

SELECT department_id,job_id, SUM(salary)
    FROM employees
        WHERE department_id > 40            
            GROUP BY job_id,department_id
                ORDER by department_id;
                
SELECT department_id, MAX(salary)
    FROM employees
        GROUP BY department_id
            HAVING MAX(salary)>10000
                ORDER BY 2;
                
SELECT job_id,SUM(salary) PAYROLL
    FROM employees
        WHERE job_id NOT LIKE '%REP%'
            GROUP BY job_id
                HAVING SUM(salary)>13000
                    ORDER BY SUM(salary);

SELECT last_name,employee_id, job_id,MAX(salary) PAYROLL
    FROM employees
        WHERE salary = (SELECT MAX(salary)FROM employees)
                        
            GROUP BY job_id,last_name,employee_id
                
                    ORDER BY MAX(salary) DESC;                   

--END of 18.06.23{GROUP BY function}





    
    
    

    
    
    
    
    
















    
    