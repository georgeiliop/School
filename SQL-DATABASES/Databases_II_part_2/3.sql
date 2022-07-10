#PROCEDURE ΓΙΑ ΤΟΝ ΥΠΟΛΟΓΙΣΜΟ ΣΥΝΟΛΙΚΩΝ ΕΣΟΔΩΝ ΚΑΠΟΙΑΣ ΠΤΗΣΗΣ
DELIMITER $$
CREATE PROCEDURE FLIGHT_INCOME(IN FLIGHT_ID INT(2))
BEGIN
SELECT FLIGHTID,SUM(COST) AS INCOME FROM RESERVATIONS
WHERE FLIGHTID=FLIGHT_ID 
GROUP BY FLIGHTID;
END$$
DELIMITER ;

CALL FLIGHT_INCOME(1);
#+----------+---------+
#| FLIGHTID | INCOME  |
#+----------+---------+
#|        1 | 2000.00 |
#+----------+---------+

CALL FLIGHT_INCOME(2);
#+----------+---------+
#| FLIGHTID | INCOME  |
#+----------+---------+
#|        2 | 1200.00 |
#+----------+---------+