SELECT manager_id, department_id
FROM employees
WHERE employee_id IN (174, 199);



SELECT employee_id, manager_id, department_id
FROM employees
WHERE (manager_id, department_id) IN

(SELECT manager_id, department_id
FROM employees
WHERE employee_id IN (174, 199))

AND employee_id NOT IN (174,199);

SELECT employee_id, manager_id, department_id
FROM employees
WHERE manager_id IN

        (SELECT manager_id
        FROM employees
        WHERE employee_id IN (174,199))

AND department_id IN

        (SELECT department_id
        FROM employees
        WHERE employee_id IN (174,199))

AND employee_id NOT IN(174,199);

SELECT department_name, city
FROM departments
NATURAL JOIN (SELECT l.location_id, l.city, l.country_id

FROM locations l
JOIN countries c
ON(l.country_id = c.country_id)
JOIN regions
USING(region_id)
WHERE region_name = 'Europe');

--workshopII 7-6.
CREATE TABLE loc AS SELECT * FROM locations;

INSERT INTO (SELECT l.location_id, l.city, l.country_id
FROM loc l
JOIN countries c
ON(l.country_id = c.country_id)
JOIN regions USING(region_id)
WHERE region_name = 'Europe')

VALUES (3300, 'Cardiff', 'UK');

SELECT location_id, city, country_id
FROM loc;

describe departments;

SELECT * from user_constraints;

select employee_id, first_name
    from employees e 
    where exists (select null from employees where manager_id = e.employee_id);