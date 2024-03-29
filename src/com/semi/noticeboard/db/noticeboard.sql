drop table NOTICEBOARD;
drop sequence noticeboardseq;

create sequence noticeboardseq;

CREATE TABLE NOTICEBOARD(
	NOTICEBOARD_NO NUMBER PRIMARY KEY,
	NOTICEBOARD_ID VARCHAR2(300) REFERENCES MEMBER (MEMBER_ID) NOT NULL,
	NOTICEBOARD_TITLE VARCHAR2(1000) NOT NULL,
	NOTICEBOARD_CONTENT VARCHAR2(4000) NOT NULL,
	NOTICEBOARD_REGDATE DATE NOT NULL,
	NOTICEBOARD_CLICK_COUNT NUMBER
);

INSERT INTO NOTICEBOARD VALUES(NOTICEBOARDSEQ.NEXTVAL,'admin','공지사항 3','공지사항 3입니다.',sysdate,0);
INSERT INTO NOTICEBOARD VALUES(NOTICEBOARDSEQ.NEXTVAL,'admin','공지사항 4','공지사항 4입니다.',sysdate,0);
INSERT INTO NOTICEBOARD VALUES(NOTICEBOARDSEQ.NEXTVAL,'admin','공지사항 5','공지사항 5입니다.',sysdate,0);
INSERT INTO NOTICEBOARD VALUES(NOTICEBOARDSEQ.NEXTVAL,'admin','공지사항 6','공지사항 6입니다.',sysdate,0);
INSERT INTO NOTICEBOARD VALUES(NOTICEBOARDSEQ.NEXTVAL,'admin','공지사항 7','공지사항 7입니다.',sysdate,0);

DELETE from NOTICEBOARD where NOTICEBOARD_NO = 4;

select * from noticeboard;

select * from (select row_number() over(order by NOTICEBOARD_NO) ROW_NO , NOTICEBOARD.* FROM NOTICEBOARD);

SELECT COUNT(*) AS COUNT FROM NOTICEBOARD;

		SELECT * 
		FROM (SELECT * 
			FROM ( SELECT ROWNUM as row_num, NOTICEBOARD.* 
				FROM ( SELECT * FROM NOTICEBOARD ORDER BY NOTICEBOARD_REGDATE DESC ) )
			WHERE row_num >= 1 ) 
		WHERE row_num <= 10 ORDER BY ROW_NUM DESC;

SELECT * FROM NOTICEBOARD WHERE NOTICEBOARD_NO = 2;

UPDATE NOTICEBOARD SET NOTICEBOARD_CLICK_COUNT = (SELECT (NOTICEBOARD_CLICK_COUNT)+1  
		FROM NOTICEBOARD WHERE NOTICEBOARD_NO = 2) WHERE NOTICEBOARD_NO = 2;
		
SELECT ROWNUM as ROW_NUM, NOTICEBOARD2.* FROM (SELECT * FROM NOTICEBOARD ORDER BY NOTICEBOARD_REGDATE) NOTICEBOARD2;

		SELECT * 
		FROM (SELECT * 
			FROM ( SELECT ROWNUM as row_num, NOTICEBOARD.* 
				FROM (SELECT * FROM NOTICEBOARD ORDER BY NOTICEBOARD_REGDATE) NOTICEBOARD )
			WHERE row_num >= 1 ) 
		WHERE row_num <= 10
		ORDER BY ROW_NUM DESC;