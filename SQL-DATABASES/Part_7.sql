#18390198_ILIOPOULOS_GEORGIOS.txt
USE new_personnel;


#Πρώτο ερώτημα


SELECT ENAME,SAL
FROM EMP
WHERE DEPTNO=10
ORDER BY SAL;


#Δεύτερο ερώτημα

SELECT ENAME,JOB,SAL
FROM EMP
ORDER BY JOB,SAL DESC;

#Τρίτο ερώτημα

SELECT ENAME,DEPTNO
FROM EMP
WHERE DEPTNO=10
ORDER BY SAL+IFNULL(COMM,0);



/*

ΑΠΟΤΕΛΕΣΜΑΤΑ


1)

+---------+---------+
| ENAME   | SAL     |
+---------+---------+
| ELMASRI | 1200.00 |
| DATE    | 1800.00 |
| CODD    | 3000.00 |
+---------+---------+

2)

+---------+------------+---------+
| ENAME   | JOB        | SAL     |
+---------+------------+---------+
| CODD    | ANALYST    | 3000.00 |
| ELMASRI | ANALYST    | 1200.00 |
| DATE    | PROGRAMMER | 1800.00 |
| NAVATHE | SALESMAN   | 2000.00 |
+---------+------------+---------+

3)

+---------+--------+
| ENAME   | DEPTNO |
+---------+--------+
| ELMASRI |     10 |
| DATE    |     10 |
| CODD    |     10 |
+---------+--------+

*/
