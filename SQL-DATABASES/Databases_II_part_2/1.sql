#ΕΠΕΙΔΗ ΑΥΤΕΣ ΟΙ ΣΤΙΛΕΣ ΔΕΝ ΥΠΗΡΧΑΝ ΣΤΗΝ ΠΡΩΤΗ ΕΡΓΑΣΙΑ ΤΙΣ ΠΡΟΣΘΕΤΟΥΜΕ ΜΕ ΤΙΜΕΣ
SELECT * FROM RESERVATIONS;
#+-------+--------+----------+--------+
#| RESNO | CUSTID | FLIGHTID | COST   |
#+-------+--------+----------+--------+
#|     1 |   1271 |        1 | 500.00 |
#|     2 |   1271 |        2 | 600.00 |
#|     3 |   1272 |        5 | 100.00 |
#|     4 |   1273 |        4 | 150.00 |
#|     5 |   1274 |        3 | 800.00 |
#|     6 |   1275 |        3 | 800.00 |
#|     7 |   1275 |        1 | 500.00 |
#|     8 |   1276 |        1 | 500.00 |
#|     9 |   1277 |        2 | 600.00 |
#|    10 |   1277 |        4 | 150.00 |
#|    11 |   1277 |        3 | 800.00 |
#|    12 |   1278 |        5 | 100.00 |
#+-------+--------+----------+--------+

SELECT * FROM FLIGHTS;
#+-----------+-----------+---------------+---------------+-------+------------+
#| FLIGHT_NO | DEPARTURE | ARRIVAL       | FLIGHT_TYPE   | SEATS | FREE_SEATS |
#+-----------+-----------+---------------+---------------+-------+------------+
#|         1 | ATHENS    | BERLIN        | INTERNATIONAL |   100 |         97 |
#|         2 | ATHENS    | GERMANY       | INTERNATIONAL |   100 |         98 |
#|         3 | ATHENS    | UNITED STATES | INTERNATIONAL |   100 |         97 |
#|         4 | ATHENS    | THESSALONIKI  | DOMESTIC      |   100 |         98 |
#|         5 | ATHENS    | LARISA        | DOMESTIC      |   100 |         98 |
#+-----------+-----------+---------------+---------------+-------+------------+

ALTER TABLE RESERVATIONS
ADD COLUMN RES_DATE DATE AFTER COST;

UPDATE RESERVATIONS SET RES_DATE="2020-5-20" WHERE RESNO = 1;
UPDATE RESERVATIONS SET RES_DATE="2020-6-26" WHERE RESNO = 2;
UPDATE RESERVATIONS SET RES_DATE="2020-6-28" WHERE RESNO = 3;
UPDATE RESERVATIONS SET RES_DATE="2020-7-30" WHERE RESNO = 4;
UPDATE RESERVATIONS SET RES_DATE="2020-8-30" WHERE RESNO = 5;
UPDATE RESERVATIONS SET RES_DATE="2020-8-03" WHERE RESNO = 6;
UPDATE RESERVATIONS SET RES_DATE="2020-8-03" WHERE RESNO = 7;
UPDATE RESERVATIONS SET RES_DATE="2020-9-05" WHERE RESNO = 8;
UPDATE RESERVATIONS SET RES_DATE="2020-10-08" WHERE RESNO = 9;
UPDATE RESERVATIONS SET RES_DATE="2020-11-10" WHERE RESNO = 10;
UPDATE RESERVATIONS SET RES_DATE="2020-10-12" WHERE RESNO = 11;
UPDATE RESERVATIONS SET RES_DATE="2020-11-15" WHERE RESNO = 12;


ALTER TABLE FLIGHTS
ADD COLUMN FLIGHT_DATE DATE AFTER FREE_SEATS;

UPDATE FLIGHTS SET FLIGHT_DATE="2020-12-01" WHERE FLIGHT_NO = 1;
UPDATE FLIGHTS SET FLIGHT_DATE="2020-12-15" WHERE FLIGHT_NO = 2;
UPDATE FLIGHTS SET FLIGHT_DATE="2020-12-17" WHERE FLIGHT_NO = 3;
UPDATE FLIGHTS SET FLIGHT_DATE="2020-12-14" WHERE FLIGHT_NO = 4;
UPDATE FLIGHTS SET FLIGHT_DATE="2020-12-16" WHERE FLIGHT_NO = 5;

SELECT * FROM RESERVATIONS;
#+-------+--------+----------+--------+------------+
#| RESNO | CUSTID | FLIGHTID | COST   | RES_DATE   |
#+-------+--------+----------+--------+------------+
#|     1 |   1271 |        1 | 500.00 | 2020-05-20 |
#|     2 |   1271 |        2 | 600.00 | 2020-06-26 |
#|     3 |   1272 |        5 | 100.00 | 2020-06-28 |
#|     4 |   1273 |        4 | 150.00 | 2020-07-30 |
#|     5 |   1274 |        3 | 800.00 | 2020-08-30 |
#|     6 |   1275 |        3 | 800.00 | 2020-08-03 |
#|     7 |   1275 |        1 | 500.00 | 2020-08-03 |
#|     8 |   1276 |        1 | 500.00 | 2020-09-05 |
#|     9 |   1277 |        2 | 600.00 | 2020-10-08 |
#|    10 |   1277 |        4 | 150.00 | 2020-11-10 |
#|    11 |   1277 |        3 | 800.00 | 2020-10-12 |
#|    12 |   1278 |        5 | 100.00 | 2020-11-15 |
#+-------+--------+----------+--------+------------+

SELECT * FROM FLIGHTS;
#+-----------+-----------+---------------+---------------+-------+------------+-------------+
#| FLIGHT_NO | DEPARTURE | ARRIVAL       | FLIGHT_TYPE   | SEATS | FREE_SEATS | FLIGHT_DATE |
#+-----------+-----------+---------------+---------------+-------+------------+-------------+
#|         1 | ATHENS    | BERLIN        | INTERNATIONAL |   100 |         97 | 2020-12-01  |
#|         2 | ATHENS    | GERMANY       | INTERNATIONAL |   100 |         98 | 2020-12-15  |
#|         3 | ATHENS    | UNITED STATES | INTERNATIONAL |   100 |         97 | 2020-12-17  |
#|         4 | ATHENS    | THESSALONIKI  | DOMESTIC      |   100 |         98 | 2020-12-14  |
#|         5 | ATHENS    | LARISA        | DOMESTIC      |   100 |         98 | 2020-12-16  |
#+-----------+-----------+---------------+---------------+-------+------------+-------------+

DESCRIBE RESERVATIONS;
#+----------+------------+------+-----+---------+-------+
#| Field    | Type       | Null | Key | Default | Extra |
#+----------+------------+------+-----+---------+-------+
#| RESNO    | int        | NO   | PRI | NULL    |       |
#| CUSTID   | int        | YES  | MUL | NULL    |       |
#| FLIGHTID | int        | YES  | MUL | NULL    |       |
#| COST     | float(7,2) | YES  |     | NULL    |       |
#| RES_DATE | date       | YES  |     | NULL    |       |
#+----------+------------+------+-----+---------+-------+

DESCRIBE FLIGHTS;
#+-------------+-------------+------+-----+---------+-------+
#| Field       | Type        | Null | Key | Default | Extra |
#+-------------+-------------+------+-----+---------+-------+
#| FLIGHT_NO   | int         | NO   | PRI | NULL    |       |
#| DEPARTURE   | varchar(14) | YES  |     | NULL    |       |
#| ARRIVAL     | varchar(14) | YES  |     | NULL    |       |
#| FLIGHT_TYPE | varchar(14) | YES  |     | NULL    |       |
#| SEATS       | int         | YES  |     | NULL    |       |
#| FREE_SEATS  | int         | YES  |     | NULL    |       |
#| FLIGHT_DATE | date        | YES  |     | NULL    |       |
#+-------------+-------------+------+-----+---------+-------+

#Τrigger για να γίνεται αυτόματο update η στήλη του πίνακα FLIGHTS για τις διαθέσημες θέσεις :
DROP TRIGGER IF EXISTS SEAT_HUNDLER;
DELIMITER $$
CREATE TRIGGER SEAT_HUNDLER
AFTER INSERT ON RESERVATIONS
FOR EACH ROW
BEGIN
UPDATE FLIGHTS
Set  FREE_SEATS = FREE_SEATS - 1
WHERE FLIGHT_NO = NEW.FLIGHTID;
END$$
DELIMITER ;

#ΠΡΙΝ ΤΗΝ ΕΙΣΑΓΩΓΗ ΚΡΑΤΗΣΗΣ
SELECT * FROM FLIGHTS WHERE FLIGHT_NO=1;
#+-----------+-----------+---------+---------------+-------+------------+-------------+
#| FLIGHT_NO | DEPARTURE | ARRIVAL | FLIGHT_TYPE   | SEATS | FREE_SEATS | FLIGHT_DATE |
#+-----------+-----------+---------+---------------+-------+------------+-------------+
#|         1 | ATHENS    | BERLIN  | INTERNATIONAL |   100 |         97 | 2020-12-01  |
#+-----------+-----------+---------+---------------+-------+------------+-------------+

#ΕΙΣΑΓΩΓΗ ΚΡΑΤΗΣΗΣ
INSERT INTO RESERVATIONS(RESNO,CUSTID,FLIGHTID,COST,RES_DATE) VALUES (13,1273,1,500,"2020-11-15");

#ΜΕΤΑ ΤΗΝ ΕΙΣΑΓΩΓΗ ΚΡΑΤΗΣΗΣ
SELECT * FROM FLIGHTS WHERE FLIGHT_NO=1;
#+-----------+-----------+---------+---------------+-------+------------+-------------+
#| FLIGHT_NO | DEPARTURE | ARRIVAL | FLIGHT_TYPE   | SEATS | FREE_SEATS | FLIGHT_DATE |
#+-----------+-----------+---------+---------------+-------+------------+-------------+
#|         1 | ATHENS    | BERLIN  | INTERNATIONAL |   100 |         96 | 2020-12-01  |
#+-----------+-----------+---------+---------------+-------+------------+-------------+