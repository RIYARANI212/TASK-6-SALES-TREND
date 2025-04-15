--CREATE DATABASE
CREATE DATABASE SALES;
USE SALES;
--CREATE TABLE
CREATE TABLE ORDERS(
ORDER_ID INT,
ORDER_DATE DATE,
AMOUNT DECIMAL(10,2),
PRODUCT_ID VARCHAR(10)
);
--INSERT SAMPLE DATA
INSERT INTO ORDERS (ORDER_ID,ORDER_DATE,AMOUNT,PRODUCT_ID)
VALUES
(1001,'2025-01-03',120.00,'P001'),
(1002,'2025-01-04',85.50,'P002'),
(1003,'2025-01-06',45.00,'P003'),
(1004,'2025-01-08',150.50,'P001'),
(1005,'2025-02-09',99.99,'P004'),
(1006,'2025-02-11',60.00,'P002'),
(1007,'2025-03-13',200.00,'P005'),
(1008,'2025-03-14',110.75,'P001'),
(1009,'2025-03-15',70.50,'P003'),
(1010,'2025-03-17',130.00,'P004');

--SEPRATELY BY YEAR AND MONTH
SELECT ORDER_ID,ORDER_DATE,
YEAR(ORDER_DATE) AS ORDER_YEAR,
YEAR(ORDER_DATE) AS ORDER_MONTH
FROM ORDERS;
 --GROUP BY YEAR AND MONTH
 SELECT 
 FORMAT(ORDER_DATE,'YYYY-MM') AS YEAR_MONTH,
 SUM(AMOUNT) AS TOTAL_REVENUE, --USE SUM FOR REVENUE
 COUNT(DISTINCT ORDER_ID)AS ORDER_VOLUME --USE COUNT DISTINCT ORDER_ID FOR VOLUME
 FROM ORDERS
 GROUP BY FORMAT (ORDER_DATE,'YYYY-MM')
 ORDER BY YEAR_MONTH;

 --USE ORDER FOR SORTING
 SELECT 
 FORMAT(ORDER_DATE,'YYYY-MM') AS YEAR_MONTH,
 SUM(AMOUNT) AS TOTAL_REVENUE, --USE SUM FOR REVENUE
 COUNT(DISTINCT ORDER_ID)AS ORDER_VOLUME --USE COUNT DISTINCT ORDER_ID FOR VOLUME
 FROM ORDERS
 GROUP BY FORMAT (ORDER_DATE,'YYYY-MM')
 ORDER BY YEAR_MONTH ASC;

 ---LIMIT RESULT FOR SPECIFIC TIME PERIOD
 SELECT 
 FORMAT(ORDER_DATE,'YYYY-MM') AS YEAR_MONTH,
 SUM(AMOUNT) AS TOTAL_REVENUE, 
 COUNT(DISTINCT ORDER_ID)AS ORDER_VOLUME 
 FROM ORDERS
 WHERE ORDER_DATE BETWEEN '2025-01-01' AND '2025-03-31'
 GROUP BY FORMAT (ORDER_DATE,'YYYY-MM')
 ORDER BY YEAR_MONTH ASC;
