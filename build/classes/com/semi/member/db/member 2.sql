
DROP TABLE MEMBER;
DROP SEQUENCE MEMBERSEQ;

CREATE SEQUENCE MEMBERSEQ;

--번호, 아이디, 비밀번호,비밀번호체크, 이름
--이메일, 성별(M:남자/F:여자),등급(ADMIN,USER,...)
CREATE TABLE MEMBER(
	MEMBER_ID VARCHAR2(1000) PRIMARY KEY NOT NULL,
	MEMBER_PW VARCHAR2(1000) NOT NULL,
	MEMBER_NAME VARCHAR2(500) NOT NULL,
	MEMBER_PHONE VARCHAR2(1000) NOT NULL,
	MEMBER_EMAIL VARCHAR2(1500) NOT NULL,
	MEMBER_GENDER VARCHAR2(2) NOT NULL,
	MEMBER_BIRTH VARCHAR2(200) NOT NULL,
	MEMBER_LEVEL VARCHAR2(100) NOT NULL,
	MEMBER_ENABLED VARCHAR2(2) NOT NULL,
	MEMBER_STYLE VARCHAR2(400),
	CONSTRAINT MEMBER_PK PRIMARY KEY (MEMBER_ID),
	--CONSTRAINT MEMBER_UQ_ID UNIQUE (MEMBER_ID),
	CONSTRAINT MEMBER_CHECK_ENABLED CHECK (MEMBER_ENABLED IN ('Y','N')),
	CONSTRAINT MEMBER_CHECK_GENDER CHECK (MEMBER_GENDER IN ('M','F'))
);

INSERT INTO MEMBER VALUES
('admin','admin','관리자','010-9937-5580','admin@admin.com','M','930913','ADMIN','Y','여행스타일');

SELECT * FROM MEMBER;