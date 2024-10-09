REM   Script: W3 - Exercise 3 SQL
REM   W3 - Exercise 3 SQL

CREATE TABLE EMP 
       (EMPNO NUMBER(4) NOT NULL, 
        ENAME VARCHAR2(10), 
        JOB VARCHAR2(9), 
        MGR NUMBER(4), 
        HIREDATE DATE, 
        SAL NUMBER(7, 2), 
        COMM NUMBER(7, 2), 
        DEPTNO NUMBER(2));

INSERT INTO EMP VALUES 
        (7369, 'SMITH',  'CLERK',     7902, 
        TO_DATE('17-DEC-2019', 'DD-MON-YYYY'),  1600, NULL, 20);

INSERT INTO EMP VALUES 
        (7499, 'ALLEN',  'SALESMAN',  7698, 
        TO_DATE('20-FEB-2017', 'DD-MON-YYYY'), 3200,  300, 30);

INSERT INTO EMP VALUES 
        (7521, 'WARD',   'SALESMAN',  7698, 
        TO_DATE('22-FEB-2018', 'DD-MON-YYYY'), 2500,  500, 30);

INSERT INTO EMP VALUES 
        (7566, 'JONES',  'MANAGER',   7839, 
        TO_DATE('2-APR-2014', 'DD-MON-YYYY'),  5000, NULL, 20);

INSERT INTO EMP VALUES 
        (7654, 'MARTIN', 'SALESMAN',  7698, 
        TO_DATE('28-SEP-2019', 'DD-MON-YYYY'), 2500, 1400, 30);

INSERT INTO EMP VALUES 
        (7698, 'BLAKE',  'MANAGER',   7839, 
        TO_DATE('1-MAY-2015', 'DD-MON-YYYY'),  4500, NULL, 30);

INSERT INTO EMP VALUES 
        (7782, 'CLARK',  'MANAGER',   7839, 
        TO_DATE('9-JUN-2017', 'DD-MON-YYYY'),  3000, NULL, 10);

INSERT INTO EMP VALUES 
        (7788, 'SCOTT',  'ANALYST',   7566, 
        TO_DATE('09-DEC-2019', 'DD-MON-YYYY'), 4000, NULL, 20);

INSERT INTO EMP VALUES 
        (7839, 'KING',   'PRESIDENT', NULL, 
        TO_DATE('17-NOV-2014', 'DD-MON-YYYY'), 6000, NULL, 10);

INSERT INTO EMP VALUES 
        (7844, 'TURNER', 'SALESMAN',  7698, 
        TO_DATE('8-SEP-2017', 'DD-MON-YYYY'),  3000,    0, 30);

INSERT INTO EMP VALUES 
        (7876, 'ADAMS',  'CLERK',     7788, 
        TO_DATE('12-JAN-2020', 'DD-MON-YYYY'), 2200, NULL, 20);

INSERT INTO EMP VALUES 
        (7900, 'JAMES',  'CLERK',     7698, 
        TO_DATE('3-DEC-2019', 'DD-MON-YYYY'),   2000, NULL, 30);

INSERT INTO EMP VALUES 
        (7902, 'FORD',   'ANALYST',   7566, 
        TO_DATE('3-DEC-2018', 'DD-MON-YYYY'),  4000, NULL, 20);

INSERT INTO EMP VALUES 
        (7934, 'MILLER', 'CLERK',     7782, 
        TO_DATE('23-JAN-2020', 'DD-MON-YYYY'), 2600, NULL, 10);

CREATE TABLE DEPT 
       (DEPTNO NUMBER(2), 
        DNAME VARCHAR2(14), 
        LOC VARCHAR2(13) );

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');

INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');

INSERT INTO DEPT VALUES (30, 'SALES',      'CHICAGO');

INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

CREATE TABLE BONUS 
        (ENAME VARCHAR2(10), 
         JOB   VARCHAR2(9), 
         SAL   NUMBER, 
         COMM  NUMBER);

CREATE TABLE SALGRADE 
        (GRADE NUMBER, 
         LOSAL NUMBER, 
         HISAL NUMBER);

INSERT INTO SALGRADE VALUES (1,  1000, 2500);

INSERT INTO SALGRADE VALUES (2, 1200, 3000);

INSERT INTO SALGRADE VALUES (3, 1500, 3000);

INSERT INTO SALGRADE VALUES (4, 2001, 5200);

INSERT INTO SALGRADE VALUES (5, 4001, 9999);

CREATE TABLE DUMMY 
        (DUMMY NUMBER);

INSERT INTO DUMMY VALUES (0);

COMMIT;

-- 1) Select the name, job and hiredate of the employees in dept 20 (format the hiredate column using a picture of mm/dd/yy)

SELECT ENAME, JOB, TO_CHAR(HIREDATE, 'MM/DD/YY') AS HIRE_DATE FROM EMP 
WHERE DEPTNO = 20;

-- 2) Use a picture to format hiredate as: day (day of the week), month (name of the month), dd (day of the month) and yyyy (year). e.g. Wednesday January the 12th, 1983

SELECT ENAME, JOB, TO_CHAR(HIREDATE, 'Day Month "the" DDth, YYYY') AS HIRE_DATE 
FROM EMP;

-- 3) Use the format mask suffix 'th' in a picture (oracle will put a suffix after the field (ddth).)

SELECT ENAME, JOB, 
       TO_CHAR(HIREDATE, 'Day') || ' ' ||  
       TO_CHAR(HIREDATE, 'Month') || ' the ' ||  
       (CASE 
           WHEN TO_CHAR(HIREDATE, 'DD') IN ('01', '21', '31') THEN TO_CHAR(HIREDATE, 'DD') || 'st' 
           WHEN TO_CHAR(HIREDATE, 'DD') IN ('02', '22') THEN TO_CHAR(HIREDATE, 'DD') || 'nd' 
           WHEN TO_CHAR(HIREDATE, 'DD') IN ('03', '23') THEN TO_CHAR(HIREDATE, 'DD') || 'rd' 
           ELSE TO_CHAR(HIREDATE, 'DD') || 'th' 
       END) || ', ' || TO_CHAR(HIREDATE, 'YYYY') AS FM_HIREDATE 
FROM EMP;

-- 4) Select the name and hiredate of department 20's employees in the following format: 
Ename, hiredate
Adams, January 12th, 1983, 11:05 am

SELECT ENAME, 
       TO_CHAR(HIREDATE, 'Month') ||  
       (CASE 
           WHEN TO_CHAR(HIREDATE, 'DD') IN ('01', '21', '31') THEN TO_CHAR(HIREDATE, 'DD') || 'st' 
           WHEN TO_CHAR(HIREDATE, 'DD') IN ('02', '22') THEN TO_CHAR(HIREDATE, 'DD') || 'nd' 
           WHEN TO_CHAR(HIREDATE, 'DD') IN ('03', '23') THEN TO_CHAR(HIREDATE, 'DD') || 'rd' 
           ELSE TO_CHAR(HIREDATE, 'DD') || 'th' 
       END) || ', ' ||  
       TO_CHAR(HIREDATE, 'HH12:MI AM') AS hiredate 
FROM EMP 
WHERE DEPTNO = 20;

