SELECT last_name,salary
    FROM employees
        ORDER BY salary desc
            OFFSET 1 row FETCH NEXT 1 ROWS ONLY;
--            Find only 2nd highest salary 
SELECT last_name,salary
    FROM employees
        WHERE salary=(SELECT MAX(salary)
                            FROM employees
                                WHERE salary< (SELECT MAX(salary)
                                                    FROM employees));
-- Find 2nd highest salay using subquries.                                                    

SELECT TO_CHAR(SYSDATE-18,'DDTH')
    FROM dual;
-- Date in ordinal number.
--19.06.23....Multiple tables using Joins
SELECT employees.last_name, salary, job_title 
    FROM employees  NATURAL JOIN jobs
        WHERE salary<10000;    
--        find salary using two table
SElECT e.employee_id, e.last_name, d.location_id, department_id, d.manager_id
    FROM employees e JOIN departments d
        USING (department_id);
--          Join two table with USING clause(don't use table alias with column used with USING clause ) and table alias
SElECT e.employee_id, e.last_name, d.location_id, d.department_id
    FROM employees e JOIN departments d
        ON (e.department_id=d.department_id);
-- ON clause(must use column name(the match column between two table) with table alias)
SElECT e.employee_id, e.last_name, d.location_id, department_id, manager_id
    FROM employees e NATURAL JOIN departments d;
-- column used in NATURAL join cannot have qualifier"
--*Cause:    Columns that are used for a named-join (either a NATURAL join
--           or a join with a USING clause) cannot have an explicit qualifier.
--*Action:   Remove the qualifier.   
SELECT employee_id, city, department_name, e.department_id
    FROM employees e
        JOIN departments d
            ON (e.department_id=d.department_id)
            JOIN locations l
                ON (d.location_id=l.location_id);
--      three way table join 
-- END of 19.06.23
SELECT TO_CHAR(1680,'$99G999D99') FROM dual;
SELECT ROUND(154.23,-2) FROM dual;
SELECT 188||null from dual;

SELECT TO_DATE('01January2023','fxDDTH"of"Month yyyy')
    FROM dual;
SELECT CONCAT('188',null) from dual;

SELECT employee_id,city,department_id
    FROM employees 
        JOIN departments 
            USING (department_id)
                JOIN locations
                    USING (location_id);






























        


                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         