-- ========================== DERIVED TABLE =====================================

-- WHEN WE WRITE A QUERY INSTEAD OF TABLE, THEN THE TABLE IS GENERATED BY THAT QUERY IS KNOWN AS DERIVED TABLE.

-- IT IS MENDATORY TO GIVE ALIAS NAME TO THAT QUERY OTHERWISE IT WILL GIVE ERROR.

SELECT * FROM EMPLOYEESDUP;

SELECT * FROM (SELECT DENSE_RANK() OVER(ORDER BY SALARY DESC) AS RNK, * FROM EMPLOYEESDUP) AS K WHERE K.RNK = 5;

-- FILTER DUPLICATE VALUES (BY USING " DISTINCT " KEYWORD)

SELECT * FROM AMAN;

SELECT * FROM AMAN ORDER BY 1;

SELECT DISTINCT * FROM AMAN ORDER BY 1;

SELECT DISTINCT * FROM AMAN ORDER BY 1 DESC;

-- FIND THE DISTINCT VALUE WITHOUT USING DISTINCT KEYWORD.

CREATE TABLE EMPSALARY(EID INT,ENAME VARCHAR(50), ESALARY INT, DID INT);

INSERT INTO EMPSALARY VALUES(1,'RAM',1000,1);
INSERT INTO EMPSALARY VALUES(2,'SOHAN',2000,2);
INSERT INTO EMPSALARY VALUES(2,'RAHUL',2000,2);
INSERT INTO EMPSALARY VALUES(3,'ROHAN',3000,3);
INSERT INTO EMPSALARY VALUES(4,'AMAN',4000,4);
INSERT INTO EMPSALARY VALUES(5,'MUKESH',5000,6);
INSERT INTO EMPSALARY VALUES(6,'RAKESH',6000,NULL);
INSERT INTO EMPSALARY VALUES(11,'ROHIT',7000,5);
INSERT INTO EMPSALARY VALUES(12,'MOHIT',8000,3);
INSERT INTO EMPSALARY VALUES(13,'SHOBIT',9000,4);
INSERT INTO EMPSALARY VALUES(14,'GAGAN',1000,7);

SELECT * FROM EMPSALARY;

SELECT * FROM EMPSALARY ORDER BY 1;

SELECT DISTINCT * FROM EMPSALARY ORDER BY 1;

SELECT *, ROW_NUMBER() OVER(PARTITION BY EID,ENAME,ESALARY,DID ORDER BY EID DESC) AS RNK FROM EMPSALARY;

SELECT * FROM (SELECT *, ROW_NUMBER() OVER(PARTITION BY EID,ENAME,ESALARY,DID ORDER BY EID DESC) AS RNK FROM EMPSALARY) K WHERE K.RNK = 1;

-- FIND THE VALUES WHICH ARE DUPLICATE.

SELECT * FROM (SELECT *, ROW_NUMBER() OVER(PARTITION BY EID,ENAME,ESALARY,DID ORDER BY EID DESC) AS RNK FROM EMPSALARY) K WHERE K.RNK > 1; 

