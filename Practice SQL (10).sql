select * from user_sequences;

CREATE TABlE studentInfromation(
    sid int
    CONSTRAINT stu_sid_pk primary key,
    sname VARCHAR2(30),
    semail VARCHAR2 (20),
    sdob date,
    saddress VARCHAR2(30)
);

CREATE SEQUENCE studentInfo_sid
    START WITH 1001
    INCREMENT BY 1
    MAXVALUE 100000
    NOCYCLE
    NOCACHE;
    
SELECT *FROM studentInfromation;    
INSERT INTO studentInfromation
VALUES(studentInfo_sid.NEXTVAL,'Rahat','rahat@gmail.com','10-Jan-2001','Dhaka');
    
INSERT INTO studentInfromation
VALUES(studentInfo_sid.NEXTVAL,'Jaman','jaman@gmail.com','05-Jan-2001','Dhaka');

INSERT INTO studentinfromation
VALUES(STUDENTINFO_SID.nextval,'Urmi','urmi@gmail.com','27-Mar-1999','Dhaka');

INSERT INTO studentinfromation
VALUES(STUDENTINFO_SID.nextval,'Ali','ali@gmail.com','02-Nov-2000',null);

INSERT INTO studentinfromation
VALUES(STUDENTINFO_SID.nextval,'Liton','liton@gmail.com','06-Sep-2000','Dhaka');

select STUDENTINFO_SID.currval
FROM dual;

create sequence empInfo_eid;
create table empInformation(
    eid int DEFAULT empInfo_eid.nextval 
    CONSTRAINT emp_info_pk PRIMARY KEY,
    ename VARCHAR2(30)
);

INSERT INTO empinformation (ename)
VALUES('Jonn');
commit;
select * from empinformation;
drop table empinformation; 

alter TABLE studentInfromation
RENAME COLUMN sdob TO s_date_of_birth;

select * from studentinfromation;

ALTER TABLE studentinfromation
 MODIFY sname VARCHAR2(32);
 
 describe studentinfromation;

select * from locations;
select * from employees
Where department_id=60;
select * from departments;

CREATE VIEW emp_loc
AS
SELECT e.first_name,e.phone_number,e.salary, l.street_address, l.country_id
FROM hr.employees e JOIN hr.departments d
    ON (e.department_id = d.department_id)
JOIN hr.locations l
    on (d.location_id= l.location_id)
WHERE e.department_id=60;

select * from emp_loc;

SELECT view_name FROM user_views;

SELECT text FROM user_views
WHERE view_name = 'EMP_DETAILS_VIEW';




