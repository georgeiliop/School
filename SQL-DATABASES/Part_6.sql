#18390198_ILIOPOULOS_GEORGIOS
USE new_personnel;


#Πρώτο ερώτημα

SELECT ENAME
FROM EMP 
WHERE JOB IN (SELECT JOB
              FROM EMP
              WHERE DEPTNO IN ( SELECT DEPTNO
                				FROM DEPT
               					 WHERE DNAME='ACCOUNTING'));

#Δεύτερο ετώτημα

SELECT ENAME,SAL+IFNULL(COMM,0) 'ΜΗΝΙΑΙΕΣ ΑΠΟΔΟΧΕΣ'
FROM EMP X
WHERE SAL+IFNULL(COMM,0)= ( SELECT MAX(SAL+IFNULL(COMM,0))
							FROM EMP
							WHERE X.DEPTNO=DEPTNO );
#Τρίτο ερώτημα

SELECT ENAME,SAL
FROM EMP
WHERE DEPTNO IN ( SELECT DEPTNO
				  FROM DEPT
				  WHERE DNAME='ACCOUNTING')
AND SAL < ( SELECT MAX(SAL)
			FROM EMP
			WHERE DEPTNO IN ( SELECT DEPTNO
							  FROM DEPT
							  WHERE DNAME='RESEARCH'));





/* 

ΑΠΟΤΕΛΕΣΜΑΤΑ :

1)

+---------+
| ENAME   |
+---------+
| CODD    |
| ELMASRI |
| DATE    |
+---------+

2)

+---------+-----------------------------------+
| ENAME   | ΜΗΝΙΑΙΕΣ ΑΠΟΔΟΧΕΣ                 |
+---------+-----------------------------------+
| CODD    |                           3000.00 |
| NAVATHE |                           2000.00 |
+---------+-----------------------------------+

3)

+---------+---------+
| ENAME   | SAL     |
+---------+---------+
| ELMASRI | 1200.00 |
| DATE    | 1800.00 |
+---------+---------+

*/


	