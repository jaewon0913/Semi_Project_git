
DROP TABLE PAYMENT;

CREATE TABLE PAYMENT(

	PAYMENT_ID VARCHAR2(300) NOT NULL, 
	PAYMENT_SUBJECT VARCHAR2(500) NOT NULL,
	PAYMENT_AMOUNT VARCHAR2(300) NOT NULL,
	PAYMENT_PRICE VARCHAR2(300) NOT NULL,
	PAYMENT_MDATE VARCHAR2(300) NOT NULL,
	PAYMENT_REGDATE DATE NOT NULL

);

SELECT * FROM PAYMENT;


SELECT * FROM PAYMENT WHERE PAYMENT_ID='admin';