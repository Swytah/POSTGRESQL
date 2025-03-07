CREATE TABLE CUSTOMER
(
    ID INT PRIMARY KEY,
    NAME VARCHAR(50) NOT NULL,
    AGE INT NOT NULL,
    CITY VARCHAR(50),
    SALARY NUMERIC
);
INSERT INTO CUSTOMER (ID, NAME, AGE, CITY, SALARY) 
VALUES (1, 'SAM', 26, 'DELHI', 9000);
INSERT INTO CUSTOMER("ID", "NAME", "AGE", "CITY", "SALARY") 
VALUES (2, 'RAM', 19, 'BANGLORE', 11000),
(3,'PAM',31,'MUMBAI',6000),
(4,'JAM',42,'PUNE',10000);
SELECT * FROM CUSTOMER;
--UPDATE--
UPDATE CUSTOMER SET "NAME"='TAM',"AGE"=31 WHERE "ID"=4;
--DELETE--
DELETE FROM CUSTOMER WHERE "ID"=2;
INSERT INTO CUSTOMER("ID", "NAME", "AGE", "CITY", "SALARY") 
VALUES (2, 'RAM', 19, 'BANGLORE', 11000);
--ALTER ADDING COLUMN--
ALTER TABLE CUSTOMER ADD COLUMN WORKING BOOLEAN DEFAULT TRUE;
--ALTER MODIFY--
ALTER TABLE CUSTOMER ALTER COLUMN "NAME" TYPE CHAR(50);
--ALTER DROP COLUMN--
ALTER TABLE CUSTOMER DROP COLUMN WORKING;
--DROP TABLE REMOVE WHOLE TABLE--
DROP TABLE CUSTOMER;
--TRUNCATE TABLE REMOVE THE VALUES ONLY--
TRUNCATE TABLE CUSTOMER;
INSERT INTO CUSTOMER (ID, NAME, AGE, CITY, SALARY) 
VALUES 
    (1, 'SAM', 26, 'DELHI', 9000),
    (2, 'RAM', 19, 'BANGLORE', 11000),
    (3, 'PAM', 31, 'MUMBAI', 6000),
    (4, 'JAM', 42, 'PUNE', 10000),
    (5, 'TAM', 26, 'DELHI', 9000),
    (6, 'LIM', 19, 'BANGLORE', 11000),
    (7, 'VAM', 31, 'MUMBAI', 6000),
    (8, 'HAM', 42, 'PUNE', 10000),
    (9, 'KAM', 26, 'DELHI', 9000),
    (10, 'WAM', 19, 'BANGLORE', 11000),
    (11, 'BAM', 31, 'MUMBAI', 6000),
    (12, 'DAM', 42, 'PUNE', 10000),
    (13, 'LAM', 26, 'DELHI', 9000),
    (14, 'ZAM', 19, 'BANGLORE', 11000),
    (15, 'FAM', 31, 'MUMBAI', 6000),
    (16, 'NAM', 42, 'PUNE', 10000),
    (17, 'MAM', 26, 'DELHI', 9000),
    (18, 'RAM', 19, 'BANGLORE', 11000),
    (19, 'SAM', 31, 'MUMBAI', 6000),
    (20, 'PAM', 42, 'PUNE', 10000);
SELECT ID FROM CUSTOMER;
SELECT * FROM CUSTOMER;
SELECT DISTINCT CITY FROM CUSTOMER;
SELECT DISTINCT * FROM CUSTOMER;
SELECT * FROM CUSTOMER WHERE CITY='DELHI';
SELECT * FROM CUSTOMER WHERE AGE !=19 AND AGE>=20 AND AGE<=40;
UPDATE CUSTOMER SET AGE=49  WHERE AGE =19 AND CITY='BANGLORE' ;
SELECT * FROM CUSTOMER LIMIT 4;
SELECT * FROM CUSTOMER ORDER BY AGE ASC;
SELECT * FROM CUSTOMER WHERE CITY='DELHI' OR CITY='PUNE' ORDER BY AGE DESC;
SELECT NAME FROM CUSTOMER ORDER BY NAME ASC;
--AGGREGATE FUNCTIONS
--SUM()
SELECT SUM(SALARY) AS SUMM FROM CUSTOMER;
--COUNT()
SELECT COUNT(*) AS TOTAL FROM CUSTOMER;
--AVG()
SELECT AVG(SALARY) AS AVERAGE FROM CUSTOMER;
--MAX()
SELECT MAX(SALARY) AS MAXIMUM_SALARY  FROM CUSTOMER;
--MIN()
SELECT MIN(SALARY) AS MAXIMUM_SALARY  FROM CUSTOMER;
--ROUND()
SELECT ROUND(SALARY,2) AS RONDED_SALARY FROM CUSTOMER;
--GROUP BY
SELECT MAX(SALARY) AS HIGHEST_SALARY, CITY FROM CUSTOMER WHERE AGE>20 GROUP BY CITY HAVING MAX(SALARY)>5000 ORDER BY HIGHEST_SALARY DESC;
--TIMESTAMP FUNCTIONS
--SHOW TIMEZONE
SHOW TIMEZONE;
--SELECT NOW()
SELECT NOW();
--SELECT TIMEOFDAY()
SELECT TIMEOFDAY()
--SELECT CURRENT_TIME()
SELECT CURRENT_TIME;
--SELECT CURRENT_DATE
SELECT CURRENT_DATE;
--EXTRACT FUNCTION
SELECT EXTRACT(MONTH FROM PAYMENT_DATE) AS PAYMENT_MONTH,PAYMENT_DATE FROM PAYMENT;
--DOW DAY OF WEEK
SELECT EXTRACT(DOW FROM PAYMENT_DATE) AS PAYMENT_DAY_OF_WEEK,PAYMENT_DATE FROM PAYMENT;
SELECT EXTRACT (QUARTER FROM PAYMENT_DATE) AS PAYMENT_QUARTER , PAYMENT_DATE FROM PAYMENT;
/*JOINS
INNER JOIN- COMMON OR INTERSECTION
LEFT JOIN- LEFT ONE FULL AND THE INTERSECTION
RIGHT JOIN- RIGHT ONE FULL AND THE INTERSECTION
FULL OUTER- UNION ALL A AND B WITH INTERSECTION*/

--INNER JOIN
SELECT * FROM CUSTOMER INNER JOIN PAYMENT ON CUSTOMER.CUSTOMER_ID=PAYMENT.CUSTOMER_ID ORDER BY PAYMENT.CUSTOMER_ID DESC;
--LEFT JOIN(LEFT JOIN WILL WORK ON PAYMENT)
SELECT CUSTOMER.CUSTOMER_ID, SUM(PAYMENT.AMOUNT) AS TOTAL_AMOUNT FROM PAYMENT LEFT JOIN CUSTOMER ON PAYMENT.CUSTOMER_ID=CUSTOMER.CUSTOMER_ID GROUP BY CUSTOMER.CUSTOMER_ID HAVING SUM(PAYMENT.AMOUNT)>10 ORDER BY CUSTOMER.CUSTOMER_ID DESC;
-- RIGHT JOIN
SELECT CUSTOMER.CUSTOMER_ID, SUM(PAYMENT.AMOUNT) AS TOTAL_AMOUNT FROM PAYMENT RIGHT JOIN CUSTOMER ON PAYMENT.CUSTOMER_ID=CUSTOMER.CUSTOMER_ID GROUP BY CUSTOMER.CUSTOMER_ID HAVING SUM(PAYMENT.AMOUNT)>10 ORDER BY CUSTOMER.CUSTOMER_ID DESC;
--FULL OUTER JOIN
SELECT CUSTOMER.CUSTOMER_ID, SUM(PAYMENT.AMOUNT) AS TOTAL_AMOUNT FROM PAYMENT FULL OUTER JOIN CUSTOMER ON PAYMENT.CUSTOMER_ID=CUSTOMER.CUSTOMER_ID GROUP BY CUSTOMER.CUSTOMER_ID HAVING SUM(PAYMENT.AMOUNT)>10 ORDER BY CUSTOMER.CUSTOMER_ID DESC;
--SELF JOIN(WORKS ON SAME TABLE)
CREATE TABLE IF NOT EXISTS EMPLOYEE(EMPID INT PRIMARY KEY, EMPNAME VARCHAR(50), MANAGERID BIGINT);
INSERT INTO EMPLOYEE(EMPID,EMPNAME,MANAGERID) VALUES(1,'AGNI',3),
(2,'AKASH',4),
(3,'DHARTI',2),
(4,'VAYU',3);
SELECT E2.EMPNAME, E1.EMPNAME FROM EMPLOYEE AS E1 JOIN EMPLOYEE AS E2 ON E1.EMPID=E2.MANAGERID;
--UNION (ONLY UNIQUE RECORDS)
/* CONDITIONS
1 SAME NUMBER OF COLUMNS SELECTED AND EXPRESSIONS
2 SAME DATA TYPE
3 SAME ORDER
UNION ALL(INCLUDES DUPLICATE)
*/
CREATE TABLE IF NOT EXISTS TABLE1(CUSTNAME VARCHAR(30),CUSTAMOUNT BIGINT);
CREATE TABLE IF NOT EXISTS TABLE2(CUSTNAME VARCHAR(30), CUSTAMOUNT BIGINT);
INSERT INTO TABLE1(CUSTNAME,CUSTAMOUNT)VALUES ('MADAN MOHAN',2100),
('GOPI NATH',1200),
('GOVIND DEV',5000);
INSERT INTO TABLE2(CUSTNAME,CUSTAMOUNT)VALUES ('GOPAL BHAT',1500),
('MADAN MOHAN',2100);
--UNION
SELECT * FROM TABLE1 UNION SELECT * FROM TABLE2;
--UNION ALL
SELECT * FROM TABLE1 UNION ALL SELECT * FROM TABLE2;
--SUBQUERY
/*QUESTION
FIND THE DETAILS OF CUSTOMERS WHOSE PAYMENT AMOUNT IS MORE THAT THE AVERAGE OF TOTAL AMOUNT PAID BY ALL CUSTOMERS*/
/*FIRST LETS FIND THE AVERAGE
SECOND FILTER THE CUSTOMER DATA > AVGERAGE VALUE*/
SELECT AVG(AMOUNT) FROM PAYEMNT;
SELECT * FROM CUSTOMER WHERE CUSTOMER_ID IN(SELECT CUSTOMER_ID FROM PAYMENT WHERE AMOUNT>(SELECT AVG(AMOUNT) FROM PAYMENT));
--EXISTS
SELECT * FROM CUSTOMER WHERE  EXISTS(SELECT CUSTOMER_ID FROM PAYMENT WHERE AMOUNT>(SELECT AVG(AMOUNT) FROM PAYMENT) AND CUSTOMER.CUSTOMER_ID=PAYMENT.CUSTOMER_ID);
--WINDOWS FUNCTIONS
/*
WINDOW FUNCTIONS APPLIES AGGREGATE, RANKING AND
ANALYTIC FUNCTIONS OVER A PARTICULAR WINDOW
SET OF ROWS USING"OVER"*/
CREATE TABLE IF NOT EXISTS TEST (NEW_ID INT, NEW_CAT VARCHAR(50));
INSERT INTO TEST(NEW_ID,NEW_CAT) VALUES(100,'AGNI'),
(200,'AGNI'),
(500,'DHARTI'),
(700,'DHARTI'),
(200,'VAYU'),
(300,'VAYU'),
(500,'VAYU');

--AGGREGATE

SELECT NEW_ID,NEW_CAT,
SUM(NEW_ID) OVER(PARTITION BY NEW_CAT ORDER BY NEW_ID ) AS "TOTAL",
AVG(NEW_ID)OVER(PARTITION BY NEW_CAT ORDER BY NEW_ID ) AS "AVERAGE",
COUNT(NEW_ID) OVER(PARTITION BY NEW_CAT ORDER BY NEW_ID ) AS "COUNT",
MIN(NEW_ID) OVER(PARTITION BY NEW_CAT ORDER BY NEW_ID ) AS "MINIMUM",
MAX(NEW_ID) OVER(PARTITION BY NEW_CAT ORDER BY NEW_ID ) AS "MAXIMUM"
FROM TEST;
SELECT NEW_ID,NEW_CAT,
SUM(NEW_ID) OVER( ORDER BY NEW_ID ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING  ) AS "TOTAL",
AVG(NEW_ID)OVER( ORDER BY NEW_ID ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING  ) AS "AVERAGE",
COUNT(NEW_ID) OVER( ORDER BY NEW_ID ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING  ) AS "COUNT",
MIN(NEW_ID) OVER( ORDER BY NEW_ID ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ) AS "MINIMUM",
MAX(NEW_ID) OVER( ORDER BY NEW_ID ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ) AS "MAXIMUM"
FROM TEST;
/*Imagine this:
If you're summing numbers for a category:
You look at all the rows in that category, no matter which row you're currently on.*/

--RANK

SELECT NEW_ID,
ROW_NUMBER() OVER(ORDER BY NEW_ID) AS "ROW_NUMBER",
RANK()OVER(ORDER BY NEW_ID) AS "RANK",
DENSE_RANK() OVER(ORDER BY NEW_ID) AS"DENSE_RANK",
PERCENT_RANK()OVER(ORDER BY NEW_ID )AS"PERCENT_RANK" FROM TEST;
/*ROW_NUMBER(): Assigns a unique sequential number to each row starting from 1.
RANK(): Assigns a rank to each row, with gaps if there are duplicate values.
DENSE_RANK(): Similar to RANK, but without gaps between ranks for duplicate values.
PERCENT_RANK(): Calculates the relative rank of a row as a percentage (0 to 1), considering the order.*/

--ANALYTICS FUNCTIONS

SELECT NEW_ID,
FIRST_VALUE(NEW_ID) OVER(ORDER BY NEW_ID) AS"FIRST_VALUE",
LAST_VALUE(NEW_ID)OVER (ORDER BY NEW_ID ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS"LAST_VALUE",
LEAD(NEW_ID) OVER(ORDER BY NEW_ID)AS"LEAD",
LAG(NEW_ID)OVER(ORDER BY NEW_ID)AS"LAG" FROM TEST;
/*FIRST_VALUE(): Returns the first value in the ordered result set.
LAST_VALUE(): Returns the last value in the ordered result set (requires specifying a full range like in your query).
LEAD(): Returns the value of the next row in the ordered result set.
LAG(): Returns the value of the previous row in the ordered result set.*/


/*WRITE A WINDOW FUNCTION FOR THE OFFSET THE LEAD AND LAG VALUES 
BY 2 IN THE OUTPUT COLUMN*/
SELECT NEW_ID,
LEAD(NEW_ID,2)OVER(ORDER BY NEW_ID)AS"LEAD_BY 2",
LAG(NEW_ID,2)OVER(ORDER BY NEW_ID )AS"LAG_BY 2" FROM TEST;
SELECT NEW_ID,
LEAD(NEW_ID,-2)OVER(ORDER BY NEW_ID)AS"LEAD_BY 2",
LAG(NEW_ID,-2)OVER(ORDER BY NEW_ID )AS"LAG_BY 2" FROM TEST;


-- CASE STATEMENT/EXPRESSION
SELECT CUSTOMER_ID,AMOUNT,
CASE
WHEN AMOUNT>100 THEN 'EXPENSIVE PRODUCT'
WHEN AMOUNT=100 THEN 'MODERATE PRODUCT'
ELSE'INESPENSIVE PRODUCT'
END AS PRODUCTSTATUS FROM PAYMENT;

-- CASE EXPRESSION SYNTAX
SELECT CUSTOMER_ID, CASE AMOUNT 
WHEN 90 THEN 'PRIME CUSTOMER'
WHEN 50 THEN 'PLUS CUSTOMER'
ELSE 'REGULAR CUSTOMER'
END AS CUSTOMERSTATUS
FROM PAYMENT;

--CTE COMMON TABLE EXPRESSION
WITH MY_CAT AS(
SELECT *, AVG(AMOUNT) OVER(ORDER BY P.CUSTOMER_ID)AS"AVERAGE_PRICE",
COUNT(ADDRESS_ID) OVER(ORDER BY C.CUSTOMER_ID) AS "COUNT" FROM PAYMENT AS P INNER JOIN CUSTOMER AS C ON 
P.CUSTOMER_ID=C.CUSTOMER_ID
)
SELECT FIRST_NAME,LAST_NAME,AMOUNT FROM MY_CAT;


--RECURSIVE CTE
CREATE TABLE IF NOT EXISTS EMP
(EMPID SERIAL PRIMARY KEY,
EMPNAME VARCHAR NOT NULL,MANID INT);
INSERT INTO
EMP(EMPID,EMPNAME,MANID)VALUES
(1,'MADHAV',NULL),
(2,'SAM',1),
(3,'TOM',2),
(4,'ARJUN',6),
(5,'SHIVA',4),
(6,'KESHAV',1),
(7,'DAMODAR',5);


WITH RECURSIVE EMPCTE AS(
--ANCHOR QUERY
SELECT EMPID,EMPNAME,MANID
FROM EMP WHERE EMPID=7

UNION ALL

--RECURSIVE QUERY
SELECT EMP.EMPID,EMP.EMPNAME,EMP.MANID
FROM EMP JOIN EMPCTE
ON EMP.EMPID=EMPCTE.MANID
)
SELECT * FROM EMPCTE
