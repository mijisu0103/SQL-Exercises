REM   Script: W2 - Exercise 2 SQL
REM   W2 - Exercise 2 SQL

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

-- 1) Find out how many managers there are without listing them. 
SELECT COUNT(DISTINCT MGR) AS NUM_MGR FROM EMP 
WHERE MGR IS NOT NULL;

-- 2) Compute the average annual salary + commission for all Salesman

SELECT AVG(SAL + NVL(COMM, 0)) * 12 AS AVG_ANU_SAL_PLUS_COMM FROM EMP 
WHERE JOB = 'SALESMAN';

-- 3) Find the highest and lowest paid employees and the difference between them

SELECT  
    MAX(SAL) AS HIGHEST_SAL, 
    MIN(SAL) AS LOWEST_SAL, 
    MAX(SAL) - MIN(SAL) AS SAL_DIFF 
FROM EMP;

-- 4) Find the number of characters in the longest department name
SELECT MAX(LENGTH(DNAME)) AS LONGEST_DNAME_NUM_CHARS FROM DEPT;

-- 5) Count the number of people in department 30 who receive a salary and the number of people who receive a commission

SELECT COUNT (SAL), COUNT(COMM) 
FROM EMP WHERE DEPTNO = 30 ;

-- 6) List the average commission of employees in department 30 who receive a commission and the average commission of all employees (treating employees who do not receive a commission as receiving a zero 
commission)

SELECT AVG (COMM), AVG (NVL(COMM, 0)) FROM EMP 
WHERE DEPTNO = 30 ;

-- 7) List the average salary of employees in department 30 that receive a salary, the average commission of employees in department 30 that receive a commission, the average salary plus commission of only those employees in department 30 that receive a commission and average salary plus commission of employees in department 30 including those who do not receive a commission

SELECT AVG (SAL), AVG (COMM), AVG(SAL+COMM), AVG(SAL+NVL(COMM, 0)) 
FROM EMP WHERE DEPTNO = 30;

-- 8) Compute the daily and hourly salaries for emplyees  in department 30. Round the results to the nearest penny. Assume there are 22 working days in a month and 8 working hours in a day.

SELECT ENAME, SAL MONTHLY, ROUND(SAL/22,2) DAILY, ROUND(SAL/(22*8),2) HOURLY  
FROM EMP WHERE DEPTNO = 30 ;

-- 9) Issue the same query as the previous one except that this time truncate (trunc) to the nearest penny rather than round.

SELECT ENAME, SAL MONTHLY, TRUNC(SAL/22,2) DAILY, TRUNC(SAL/(22*8),2) HOURLY  
FROM EMP WHERE DEPTNO = 30 ;

