#1

#Δημιουργία πινάκων :

DROP DATABASE IF EXISTS Airline;
CREATE DATABASE Airline;
USE Airline;

CREATE TABLE FLIGHTS(
FLIGHT_NO INT(2) NOT NULL , 
DEPARTURE VARCHAR(14) , 
ARRIVAL VARCHAR(14) , 
FLIGHT_TYPE VARCHAR(14),
SEATS INT(2) , 
FREE_SEATS INT(2) , 
PRIMARY KEY(FLIGHT_NO));

CREATE TABLE CUSTOMERS(
CUSTNO INT(2) NOT NULL,
CUSTNAME VARCHAR(14) ,
CITIZENSHIP VARCHAR(14) , 
CUSTBIRTH DATE ,
COUNT INT(2), 
PRIMARY KEY(CUSTNO) 
);

CREATE TABLE RESERVATIONS(
RESNO INT(2) NOT NULL,
CUSTID INT(2),
FLIGHTID INT(2),
COST FLOAT(7,2),
PRIMARY KEY(RESNO),
FOREIGN KEY (CUSTID) REFERENCES CUSTOMERS(CUSTNO),
FOREIGN KEY (FLIGHTID) REFERENCES FLIGHTS(FLIGHT_NO));

DESCRIBE FLIGHTS;

#Αποτελέσματα :


#+-------------+-------------+------+-----+---------+-------+
#| Field       | Type        | Null | Key | Default | Extra |
#+-------------+-------------+------+-----+---------+-------+
#| FLIGHT_NO   | int         | NO   | PRI | NULL    |       |
#| DEPARTURE   | varchar(14) | YES  |     | NULL    |       |
#| ARRIVAL     | varchar(14) | YES  |     | NULL    |       |
#| FLIGHT_TYPE | varchar(14) | YES  |     | NULL    |       |
#| SEATS       | int         | YES  |     | NULL    |       |
#| FREE_SEATS  | int         | YES  |     | NULL    |       |
#+-------------+-------------+------+-----+---------+-------+

DESCRIBE CUSTOMERS;

#Αποτελέσματα :

#+-------------+-------------+------+-----+---------+-------+
#| Field       | Type        | Null | Key | Default | Extra |
#+-------------+-------------+------+-----+---------+-------+
#| CUSTNO      | int         | NO   | PRI | NULL    |       |
#| CUSTNAME    | varchar(14) | YES  |     | NULL    |       |
#| CITIZENSHIP | varchar(14) | YES  |     | NULL    |       |
#| CUSTBIRTH   | date        | YES  |     | NULL    |       |
#| COUNT       | int         | YES  |     | NULL    |       |
#+-------------+-------------+------+-----+---------+-------+

#Αποτελέσματα :

DESCRIBE RESERVATIONS;

#+----------+------------+------+-----+---------+-------+
#| Field    | Type       | Null | Key | Default | Extra |
#+----------+------------+------+-----+---------+-------+
#| RESNO    | int        | NO   | PRI | NULL    |       |
#| CUSTID   | int        | YES  | MUL | NULL    |       |
#| FLIGHTID | int        | YES  | MUL | NULL    |       |
#| COST     | float(7,2) | YES  |     | NULL    |       |
#+----------+------------+------+-----+---------+-------+



#Περιορισμός έτσι ώστε κάθε πελάτης να μπορεί να κάνει κράτηση μίας θέσης σε μία πτήση :
ALTER TABLE RESERVATIONS
ADD CONSTRAINT RESERVATIONS_CON UNIQUE(CUSTID, FLIGHTID);

#Περιορισμός και triggers για να μπορεί να κάνει κράτηση μέχρι 3 πτήσεις :

DELIMITER $$
CREATE TRIGGER CUSTOMERS_INSERT
BEFORE INSERT ON RESERVATIONS
FOR EACH ROW
BEGIN
UPDATE CUSTOMERS
Set COUNT = IFNULL(COUNT, 0) + 1
WHERE NEW.custid=custno;
END$$
DELIMITER ;

ALTER TABLE CUSTOMERS 
ADD CONSTRAINT CUSTOMERS_CON check(COUNT<=3);

#Επιπλέον triggers για να γίνεται αυτόματο update η στήλη του πίνακα FLIGHTS για τις διαθέσημες θέσεις :
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

#Έλεγχος με περιορισμό για το αν υπάρχουν διαθέσημες θέσεις :
ALTER TABLE FLIGHTS
ADD CONSTRAINT SEATS_CON check(FREE_SEATS>0);


#Εισαγωγή δεδομένων :


INSERT INTO CUSTOMERS(CUSTNO,CUSTNAME,CITIZENSHIP,CUSTBIRTH) VALUES
(1271,"JOHN","GREEK","1996-05-02");
INSERT INTO CUSTOMERS(CUSTNO,CUSTNAME,CITIZENSHIP,CUSTBIRTH) VALUES
(1272,"ELLEN","GERMAN","1992-09-15");
INSERT INTO CUSTOMERS(CUSTNO,CUSTNAME,CITIZENSHIP,CUSTBIRTH) VALUES
(1273,"CAMERON","SPANISH","1981-08-03");
INSERT INTO CUSTOMERS(CUSTNO,CUSTNAME,CITIZENSHIP,CUSTBIRTH) VALUES
(1274,"RAMEN","PHILIPINO","1990-04-02");
INSERT INTO CUSTOMERS(CUSTNO,CUSTNAME,CITIZENSHIP,CUSTBIRTH) VALUES
(1275,"CODY","SWEDISH","1985-02-26");
INSERT INTO CUSTOMERS(CUSTNO,CUSTNAME,CITIZENSHIP,CUSTBIRTH) VALUES
(1276,"ALEX","GREEK","1990-11-29"); 
INSERT INTO CUSTOMERS(CUSTNO,CUSTNAME,CITIZENSHIP,CUSTBIRTH) VALUES
(1277,"GEORGE","AMERICAN","1982-06-07"); 
INSERT INTO CUSTOMERS(CUSTNO,CUSTNAME,CITIZENSHIP,CUSTBIRTH) VALUES
(1278,"ANNA","ENGLISH","2000-09-11"); 

SELECT * FROM CUSTOMERS;

#+--------+----------+-------------+------------+-------+
#| CUSTNO | CUSTNAME | CITIZENSHIP | CUSTBIRTH  | COUNT |
#+--------+----------+-------------+------------+-------+
#|   1271 | JOHN     | GREEK       | 1996-05-02 |     2 |
#|   1272 | ELLEN    | GERMAN      | 1992-09-15 |     1 |
#|   1273 | CAMERON  | SPANISH     | 1981-08-03 |     1 |
#|   1274 | RAMEN    | PHILIPINO   | 1990-04-02 |     1 |
#|   1275 | CODY     | SWEDISH     | 1985-02-26 |     2 |
#|   1276 | ALEX     | GREEK       | 1990-11-29 |     1 |
#|   1277 | GEORGE   | AMERICAN    | 1982-06-07 |     3 |
#|   1278 | ANNA     | ENGLISH     | 2000-09-11 |     1 |
#+--------+----------+-------------+------------+-------+

INSERT INTO FLIGHTS(FLIGHT_NO,DEPARTURE,ARRIVAL,FLIGHT_TYPE,SEATS,FREE_SEATS) VALUES (1,"ATHENS","BERLIN","INTERNATIONAL",100,100);
INSERT INTO FLIGHTS(FLIGHT_NO,DEPARTURE,ARRIVAL,FLIGHT_TYPE,SEATS,FREE_SEATS) VALUES (2,"ATHENS","GERMANY","INTERNATIONAL",100,100);
INSERT INTO FLIGHTS(FLIGHT_NO,DEPARTURE,ARRIVAL,FLIGHT_TYPE,SEATS,FREE_SEATS) VALUES (3,"ATHENS","UNITED STATES","INTERNATIONAL",100,100);
INSERT INTO FLIGHTS(FLIGHT_NO,DEPARTURE,ARRIVAL,FLIGHT_TYPE,SEATS,FREE_SEATS) VALUES (4,"ATHENS","THESSALONIKI","DOMESTIC",100,100);
INSERT INTO FLIGHTS(FLIGHT_NO,DEPARTURE,ARRIVAL,FLIGHT_TYPE,SEATS,FREE_SEATS) VALUES (5,"ATHENS","LARISA","DOMESTIC",100,100);

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


INSERT INTO RESERVATIONS(RESNO,CUSTID,FLIGHTID,COST) VALUES (1,1271,1,500);
INSERT INTO RESERVATIONS(RESNO,CUSTID,FLIGHTID,COST) VALUES (2,1271,2,600);
INSERT INTO RESERVATIONS(RESNO,CUSTID,FLIGHTID,COST) VALUES (3,1272,5,100);
INSERT INTO RESERVATIONS(RESNO,CUSTID,FLIGHTID,COST) VALUES (4,1273,4,150);
INSERT INTO RESERVATIONS(RESNO,CUSTID,FLIGHTID,COST) VALUES (5,1274,3,800);
INSERT INTO RESERVATIONS(RESNO,CUSTID,FLIGHTID,COST) VALUES (6,1275,3,800);
INSERT INTO RESERVATIONS(RESNO,CUSTID,FLIGHTID,COST) VALUES (7,1275,1,500);
INSERT INTO RESERVATIONS(RESNO,CUSTID,FLIGHTID,COST) VALUES (8,1276,1,500);
INSERT INTO RESERVATIONS(RESNO,CUSTID,FLIGHTID,COST) VALUES (9,1277,2,600);
INSERT INTO RESERVATIONS(RESNO,CUSTID,FLIGHTID,COST) VALUES (10,1277,4,150);
INSERT INTO RESERVATIONS(RESNO,CUSTID,FLIGHTID,COST) VALUES (11,1277,3,800);
INSERT INTO RESERVATIONS(RESNO,CUSTID,FLIGHTID,COST) VALUES (12,1278,5,100);


SELECT * FROM RESERVATIONS;

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

