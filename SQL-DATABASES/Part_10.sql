#18390198_ILIOPOULOS_GEORGIOS
DROP DATABASE IF EXISTS personnel;	
CREATE DATABASE personnel;
USE personnel;

#Δημιουργία των πινάκων

CREATE TABLE DEPT(DEPTNO INT(2) NOT NULL, DNAME VARCHAR(14),PRIMARY KEY(DEPTNO));

CREATE TABLE JOB(JOBNO INT(3) NOT NULL, JOB VARCHAR(15),SAL FLOAT(7,2), PRIMARY KEY(JOBNO));

CREATE TABLE EMP(EMPNO INT(4) NOT NULL, ENAME VARCHAR(10),JOBCODE INT(3),DEPTNO INT(2),PRIMARY KEY(EMPNO),
FOREIGN KEY(JOBCODE) REFERENCES JOB(JOBNO),
FOREIGN KEY(DEPTNO) REFERENCES DEPT(DEPTNO));

#Εισαγωσή δεδομένων

INSERT INTO DEPT(DEPTNO,DNAME) VALUES
(10,'ACCOUNTING'),
(20,'SALES'),
(30,'PERSONNEL');

INSERT INTO JOB(JOBNO,JOB,SAL) VALUES
(100,'DBA',2500),
(200,'ANALYST',2000);

INSERT INTO EMP (EMPNO,ENAME,JOBCODE,DEPTNO) VALUES
(1000,'SMITH',100,10),
(2000,'TOM',200,10),
(300,'JIM',100,20),
(400,'BOB',200,20);

#1

SELECT *
FROM EMP,DEPT,JOB
WHERE EMP.DEPTNO=DEPT.DEPTNO
AND EMP.JOBCODE=JOB.JOBNO
ORDER BY JOB,ENAME;

#2

SELECT *
FROM EMP,DEPT,JOB
WHERE EMP.DEPTNO=DEPT.DEPTNO
AND EMP.JOBCODE=JOB.JOBNO
AND DNAME IN('SALES','ACCOUNTING')
ORDER BY JOB,ENAME;

#3
SELECT DNAME,COUNT(EMP.DEPTNO) "ΕΡΓΑΖΟΜΕΝΟΙ"
FROM EMP,DEPT
WHERE EMP.DEPTNO=DEPT.DEPTNO
GROUP BY EMP.DEPTNO
HAVING COUNT(EMP.DEPTNO) >= 2;

#4
SELECT ENAME,DNAME,SAL
FROM EMP,DEPT,JOB
WHERE 
EMP.DEPTNO=DEPT.DEPTNO
AND EMP.JOBCODE=JOB.JOBNO
AND (SUBSTRING(ENAME,2,1) = 'O'
OR JOB='ANALYST');

#5
SELECT ENAME
FROM EMP,JOB
WHERE EMP.JOBCODE=JOB.JOBNO
AND 
SAL IN (SELECT SAL
		FROM JOB
		WHERE JOBNO IN (SELECT JOBCODE
						FROM EMP
						WHERE ENAME='SMITH'))
AND NOT ENAME='SMITH';

/* 
ΑΠΟΤΕΛΕΣΜΑΤΑ 

describe dept
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| DEPTNO | int         | NO   | PRI | NULL    |       |
| DNAME  | varchar(14) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+

describe emp
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| EMPNO   | int         | NO   | PRI | NULL    |       |
| ENAME   | varchar(10) | YES  |     | NULL    |       |
| JOBCODE | int         | YES  | MUL | NULL    |       |
| DEPTNO  | int         | YES  | MUL | NULL    |       |
+---------+-------------+------+-----+---------+-------+

describe job
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| JOBNO | int         | NO   | PRI | NULL    |       |
| JOB   | varchar(15) | YES  |     | NULL    |       |
| SAL   | float(7,2)  | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+


1)
+-------+-------+---------+--------+--------+------------+-------+---------+---------+
| EMPNO | ENAME | JOBCODE | DEPTNO | DEPTNO | DNAME      | JOBNO | JOB     | SAL     |
+-------+-------+---------+--------+--------+------------+-------+---------+---------+
|   400 | BOB   |     200 |     20 |     20 | SALES      |   200 | ANALYST | 2000.00 |
|  2000 | TOM   |     200 |     10 |     10 | ACCOUNTING |   200 | ANALYST | 2000.00 |
|   300 | JIM   |     100 |     20 |     20 | SALES      |   100 | DBA     | 2500.00 |
|  1000 | SMITH |     100 |     10 |     10 | ACCOUNTING |   100 | DBA     | 2500.00 |
+-------+-------+---------+--------+--------+------------+-------+---------+---------+


2)


+-------+-------+---------+--------+--------+------------+-------+---------+---------+
| EMPNO | ENAME | JOBCODE | DEPTNO | DEPTNO | DNAME      | JOBNO | JOB     | SAL     |
+-------+-------+---------+--------+--------+------------+-------+---------+---------+
|   400 | BOB   |     200 |     20 |     20 | SALES      |   200 | ANALYST | 2000.00 |
|  2000 | TOM   |     200 |     10 |     10 | ACCOUNTING |   200 | ANALYST | 2000.00 |
|   300 | JIM   |     100 |     20 |     20 | SALES      |   100 | DBA     | 2500.00 |
|  1000 | SMITH |     100 |     10 |     10 | ACCOUNTING |   100 | DBA     | 2500.00 |
+-------+-------+---------+--------+--------+------------+-------+---------+---------+


3)


+------------+------------------------+
| DNAME      | ΕΡΓΑΖΟΜΕΝΟΙ            |
+------------+------------------------+
| ACCOUNTING |                      2 |
| SALES      |                      2 |
+------------+------------------------+


4)


+-------+------------+---------+
| ENAME | DNAME      | SAL     |
+-------+------------+---------+
| BOB   | SALES      | 2000.00 |
| TOM   | ACCOUNTING | 2000.00 |
+-------+------------+---------+


5)


+-------+
| ENAME |
+-------+
| JIM   |
+-------+


*/












