#18390198_ILIOPOULOS_GEORGIOS5
USE new_personnel;

#Πρώτο ερώτημα

SELECT ENAME "ΕΠΩΝΥΜΟ",SAL "ΜΙΣΘΟΣ",COMM "ΠΡΟΜΗΘΕΙΑ",CONCAT(FORMAT(IFNULL(COMM,0)/SAL*100,2),"%") "ΠΟΣΟΣΤΟ" FROM EMP;

#Δεύτερο ερώτημα

SELECT ENAME "ΕΠΩΝΥΜΟ",SAL+IFNULL(COMM,0) "ΜΗΝΙΑΙΕΣ ΑΠΟΔΟΧΕΣ",
CONCAT(FORMAT(DATEDIFF(current_date(),HIREDATE)/365,0)," έτη") "ΠΡΟΥΠΗΡΕΣΙΑ"
FROM EMP
WHERE DATEDIFF(current_date(),HIREDATE)/365>20;

#Τρίτο ερώτημα

SELECT ENAME "ΕΠΩΝΥΜΟ",JOB "ΘΕΣΗ" ,HIREDATE "ΠΡΟΣΛΗΨΗ"
FROM EMP
WHERE JOB IN("SALESMAN","ANALYST")
AND CONVERT(SUBSTRING(HIREDATE,9,2),signed)<=5;

/*

ΑΠΟΤΕΛΈΣΜΑΤΑ :

1)

+----------------+--------------+--------------------+----------------+
| ΕΠΩΝΥΜΟ        | ΜΙΣΘΟΣ       | ΠΡΟΜΗΘΕΙΑ          | ΠΟΣΟΣΤΟ        |
+----------------+--------------+--------------------+----------------+
| CODD           |      3000.00 |               NULL | 0.00%          |
| ELMASRI        |      1200.00 |             150.00 | 12.50%         |
| NAVATHE        |      2000.00 |               NULL | 0.00%          |
| DATE           |      1800.00 |             200.00 | 11.11%         |
+----------------+--------------+--------------------+----------------+

2)

+----------------+-----------------------------------+------------------------+
| ΕΠΩΝΥΜΟ        | ΜΗΝΙΑΙΕΣ ΑΠΟΔΟΧΕΣ                 | ΠΡΟΥΠΗΡΕΣΙΑ            |
+----------------+-----------------------------------+------------------------+
| CODD           |                           3000.00 | 31 έτη                 |
| ELMASRI        |                           1350.00 | 25 έτη                 |
| NAVATHE        |                           2000.00 | 43 έτη                 |
+----------------+-----------------------------------+------------------------+

3)

+----------------+----------+------------------+
| ΕΠΩΝΥΜΟ        | ΘΕΣΗ     | ΠΡΟΣΛΗΨΗ         |
+----------------+----------+------------------+
| CODD           | ANALYST  | 1989-01-01       |
| ELMASRI        | ANALYST  | 1995-05-02       |
+----------------+----------+------------------+

*/