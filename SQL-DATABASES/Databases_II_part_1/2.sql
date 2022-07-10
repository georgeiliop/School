#2-----------------


SELECT FLIGHTID,COUNT(*) AS FLIGHT_COUNT FROM RESERVATIONS
GROUP BY FLIGHTID;


#Αποτελέσματα :

#+----------+--------------+
#| FLIGHTID | FLIGHT_COUNT |
#+----------+--------------+
#|        1 |            3 |
#|        2 |            2 |
#|        3 |            3 |
#|        4 |            2 |
#|        5 |            2 |
#+----------+--------------+

SELECT CUSTID, SUM(COST) AS FINAL_COST FROM RESERVATIONS
GROUP BY CUSTID
ORDER BY SUM(COST) DESC;

#Αποτελέσματα :

#+--------+------------+
#| CUSTID | FINAL_COST |
#+--------+------------+
#|   1277 |    1550.00 |
#|   1275 |    1300.00 |
#|   1271 |    1100.00 |
#|   1274 |     800.00 |
#|   1276 |     500.00 |
#|   1273 |     150.00 |
#|   1272 |     100.00 |
#|   1278 |     100.00 |
#+--------+------------+