#ΗΛΙΟΠΟΥΛΟΣ-18390198
#1)

DROP DATABASE best_games;
CREATE DATABASE best_games;
USE best_games;


CREATE TABLE games (
 b_code int NOT NULL,
 bname varchar(255) NOT NULL,
 cname varchar(255) NOT NULL,
 no_of_sales int,
 PRIMARY KEY (b_code)
 );


CREATE TABLE salesman (
 s_no int NOT NULL,
 s_name varchar(255) NOT NULL,
 s_city varchar(255) NOT NULL,
 PRIMARY KEY (s_no));


CREATE TABLE sales (
 acc_no int NOT NULL,
 s_no int NOT NULL,
 b_code int NOT NULL,
 s_date date NOT NULL,
 ammount int NOT NULL,
 PRIMARY KEY (acc_no)
 FOREIGN KEY (b_code) REFERENCES games(b_code),
 FOREIGN KEY (s_no) REFERENCES salesman(s_no)
);



#2)
DELIMITER $$
CREATE TRIGGER UPDATE_SALES
BEFORE INSERT ON sales 
FOR EACH ROW 
BEGIN 
UPDATE games
SET no_of_sales=IFNULL(no_of_sales,0) + 1 
WHERE NEW.b_code=games.b_code;
END$$
DELIMITER ;


#3)


INSERT INTO GAMES (B_CODE, BNAME, CNAME) VALUES (1, 'SKYRIM', 'RPG');
INSERT INTO GAMES (B_CODE, BNAME, CNAME) VALUES (2, 'THE WITCHER', 'RPG');
INSERT INTO GAMES (B_CODE, BNAME, CNAME) VALUES (3, 'TOTAL WAR', 'STRATEGY');
INSERT INTO GAMES (B_CODE, BNAME, CNAME) VALUES (4, 'CIVILIZATION VI', 'STRATEGY');

INSERT INTO SALESMAN (S_NO, S_NAME, S_CITY) VALUES (1, 'TED', 'ATHENS');
INSERT INTO SALESMAN (S_NO, S_NAME, S_CITY) VALUES (2, 'DATE', 'NEW YORK');
INSERT INTO SALESMAN (S_NO, S_NAME, S_CITY) VALUES (3, 'JEFF', 'ATHENS');

INSERT INTO SALES (ACC_NO, S_NO, B_CODE, S_DATE, AMMOUNT) VALUES (1, '1', '1', '2019-05-23', '100');
INSERT INTO SALES (ACC_NO, S_NO, B_CODE, S_DATE, AMMOUNT) VALUES (2, '1', '3', '2019-05-28', '150');
INSERT INTO SALES (ACC_NO, S_NO, B_CODE, S_DATE, AMMOUNT) VALUES (3, '2', '1', '2020-05-26', '100');
INSERT INTO SALES (ACC_NO, S_NO, B_CODE, S_DATE, AMMOUNT) VALUES (4, '2', '3', '2020-06-27', '150');

#4)
SELECT bname, cname, s_name, s_date, acc_no
FROM games, salesman, sales;

#5)
DELIMITER $$
CREATE PROCEDURE SEARCH(IN GAME VARCHAR(15),IN SALESMAN_NAME VARCHAR(15))
BEGIN
SELECT bname,cname,s_name,s_date
FROM sales 
INNER JOIN salesman ON SALESMAN_NAME=s_name
INNER JOIN games ON GAME=bname;
END $$ 
DELIMITER ;


CALL SEARCH("Skyrim", "TED");

#6)
DELIMITER $$
CREATE FUNCTION months_between(sales_date DATE)
RETURNS FLOAT
BEGIN
DECLARE L_years FLOAT;
SET L_years=datediff(CURRENT_DATE, sales_date)/365;
RETURN L_years;
END $$
DELIMITER ;

SELECT * FROM sales
WHERE months_between(s_date) <= 1.5;


