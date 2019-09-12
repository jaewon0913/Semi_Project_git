DROP SEQUENCE ITEMSEQ01;
DROP TABLE ITEM01;

CREATE SEQUENCE ITEMSEQ01;

CREATE TABLE ITEM01(
	ITEM_NO NUMBER,
	ITEM_DAY VARCHAR2(300),
	ITEM_CITY VARCHAR2(300),
	ITEM_PLACE VARCHAR2(4000)

);

SELECT * FROM ITEM01;

SELECT * FROM ITEM01 ORDER BY ITEM_NO;

DELETE FROM ITEM01;




