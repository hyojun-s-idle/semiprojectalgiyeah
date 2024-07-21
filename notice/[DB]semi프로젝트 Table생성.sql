-- 드랍 테이블 모음
DROP TABLE MEMBER_TYPE; -- 회원 종류
DROP TABLE BOARD_TYPE; --게시판종류
DROP TABLE MEMBER; --회원
DROP TABLE BOARD; --게시판
DROP TABLE LIKE_BOARD; --좋아요
DROP TABLE REPORT; --신고
DROP TABLE BOARD_IMG; --게시판 이미지
DROP TABLE REPLY; --댓글
DROP TABLE CHAT; --소통방
DROP TABLE FIRE; --불꽃방
DROP TABLE KEYWORD; --키워드
DROP TABLE MEMBER_QA; --질의

--시퀀스 드롭
DROP SEQUENCE SEQ_MEMBER_NO;
DROP SEQUENCE SEQ_BOARD_NO;
DROP SEQUENCE SEQ_IMG_NO;
DROP SEQUENCE SEQ_RNO;
DROP SEQUENCE SEQ_FIRE;


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- 회원 종류
CREATE TABLE "MEMBER_TYPE" (
   "MEMBER_TYPE_CD"   NUMBER      PRIMARY KEY,
   "MEMBER_TYPE_NM"   VARCHAR2(13) NOT NULL
);

COMMENT ON COLUMN "MEMBER_TYPE"."MEMBER_TYPE_CD" IS '알바=1,사장=2,관리자=0';
COMMENT ON COLUMN "MEMBER_TYPE"."MEMBER_TYPE_NM" IS '사장/알바/관리자';


--게시판종류 데이터삽입
INSERT INTO MEMBER_TYPE VALUES(0,'관리자');
INSERT INTO MEMBER_TYPE VALUES(1,'알바');
INSERT INTO MEMBER_TYPE VALUES(2,'사장');
COMMIT;








-- 게시판 종류

CREATE TABLE "BOARD_TYPE" (
   "BOARD_TYPE_CD"   NUMBER      PRIMARY KEY,
   "BOARD_NAME"   VARCHAR2(50)      NOT NULL,
   "PR_BOARD"   NUMBER      NULL
);

COMMENT ON COLUMN "BOARD_TYPE"."BOARD_TYPE_CD" IS '단순 시퀀스';
COMMENT ON COLUMN "BOARD_TYPE"."BOARD_NAME" IS '이름';
COMMENT ON COLUMN "BOARD_TYPE"."PR_BOARD" IS '상위 코드';


INSERT INTO BOARD_TYPE VALUES(1,'모두',NULL);
INSERT INTO BOARD_TYPE VALUES(2,'알바',1);
INSERT INTO BOARD_TYPE VALUES(3,'사장',1);
COMMIT;

INSERT INTO BOARD_TYPE VALUES(4,'외식/음료',2);
INSERT INTO BOARD_TYPE VALUES(5,'매장서비스',2);
INSERT INTO BOARD_TYPE VALUES(6,'서비스',2);
INSERT INTO BOARD_TYPE VALUES(7,'사무직',2);
INSERT INTO BOARD_TYPE VALUES(8,'운전/배달',2);
INSERT INTO BOARD_TYPE VALUES(9,'생산',2);
INSERT INTO BOARD_TYPE VALUES(10,'디자인',2);
INSERT INTO BOARD_TYPE VALUES(11,'IT',2);
INSERT INTO BOARD_TYPE VALUES(12,'교육',2);
INSERT INTO BOARD_TYPE VALUES(13,'기타',2);

INSERT INTO BOARD_TYPE VALUES(14,'요식업',3);
INSERT INTO BOARD_TYPE VALUES(15,'숙박업',3);
INSERT INTO BOARD_TYPE VALUES(16,'제조업',3);
INSERT INTO BOARD_TYPE VALUES(17,'배송업',3);
INSERT INTO BOARD_TYPE VALUES(18,'정보서비스업',3);
INSERT INTO BOARD_TYPE VALUES(19,'시설관리업',3);
INSERT INTO BOARD_TYPE VALUES(20,'교육관리업',3);
INSERT INTO BOARD_TYPE VALUES(21,'여가관련업',3);
INSERT INTO BOARD_TYPE VALUES(22,'기타',3);
COMMIT;

-- 공지사항 추가
INSERT INTO BOARD_TYPE VALUES(23,'공지사항',NULL);
COMMIT;



-- 회원

CREATE TABLE "MEMBER" (
   "MEMBER_NO"   NUMBER      PRIMARY KEY,
   "MEMBER_ID"   VARCHAR2(30)      NOT NULL,
   "MEMBER_PW"   VARCHAR2(30)      NOT NULL,
   "MEMBER_NM"   VARCHAR2(30)      NOT NULL,
   "MEMBER_BIRTH"   VARCHAR2(8)      NOT NULL,
   "MEMBER_EMAIL"   VARCHAR2(50)      NOT NULL,
   "MEMBER_TEL"   VARCHAR2(11)      NOT NULL,
   "MEMBER_NICK"   VARCHAR2(30)      NOT NULL,
   "MEMBER_ADRR"   VARCHAR2(500)      NULL,
   "MEMBER_JOB"   VARCHAR2(100)      NOT NULL,
   "BUSINESS_NUM"   VARCHAR2(13)      NULL,
   "MEMBER_TYPE_CD" NUMBER   REFERENCES MEMBER_TYPE ON DELETE CASCADE NOT NULL ,
   "PROFILE_IMGE"   VARCHAR2(500)      NULL,
   "SECESSION_FL"   CHAR(1)   DEFAULT 'N'   NOT NULL CHECK("SECESSION_FL" IN('N','Y'))
);

COMMENT ON COLUMN "MEMBER"."MEMBER_NO" IS '회원번호(시퀀스)';
COMMENT ON COLUMN "MEMBER"."MEMBER_ID" IS '아이디';
COMMENT ON COLUMN "MEMBER"."MEMBER_PW" IS '비밀번호';
COMMENT ON COLUMN "MEMBER"."MEMBER_NM" IS '이름';
COMMENT ON COLUMN "MEMBER"."MEMBER_BIRTH" IS '생년웡일';
COMMENT ON COLUMN "MEMBER"."MEMBER_EMAIL" IS '이메일';
COMMENT ON COLUMN "MEMBER"."MEMBER_TEL" IS '전화번호';
COMMENT ON COLUMN "MEMBER"."MEMBER_NICK" IS '닉네임';
COMMENT ON COLUMN "MEMBER"."MEMBER_ADRR" IS '주소';
COMMENT ON COLUMN "MEMBER"."MEMBER_JOB" IS '직종';
COMMENT ON COLUMN "MEMBER"."BUSINESS_NUM" IS '알바일시 NULL, 사장일시 사업번호';
COMMENT ON COLUMN "MEMBER"."MEMBER_TYPE_CD" IS '알바=1,사장=2,관리자=0';
COMMENT ON COLUMN "MEMBER"."PROFILE_IMGE" IS '파일경로';
COMMENT ON COLUMN "MEMBER"."SECESSION_FL" IS 'Y는 탈퇴';

--회원 시퀀스
CREATE SEQUENCE SEQ_MEMBER_NO NOCACHE;

INSERT INTO MEMBER VALUES(SEQ_MEMBER_NO.NEXTVAL, 'user01', 'pass01', '방동길', '951221','user01@kh.or.kr','01012543256','방동사장',DEFAULT,'기타','1234567894561',2,DEFAULT,DEFAULT);
INSERT INTO MEMBER VALUES(SEQ_MEMBER_NO.NEXTVAL, 'user02', 'pass02', '방방방', '950221','user01@kh.or.kr','01012543256','방방사장',DEFAULT,'기타','1234567894561',2,DEFAULT,DEFAULT);
INSERT INTO MEMBER VALUES(SEQ_MEMBER_NO.NEXTVAL, 'user03', 'pass03', '봉동길', '001221','user03@kh.or.kr','01012543256','봉동알바',DEFAULT,'기타','1234567894561',1,DEFAULT,DEFAULT);
INSERT INTO MEMBER VALUES(SEQ_MEMBER_NO.NEXTVAL, 'user04', 'pass04', '방방길', '951221','user04@kh.or.kr','01012543256','방방알바',DEFAULT,'기타','1234567894561',1,DEFAULT,DEFAULT);
INSERT INTO MEMBER VALUES(SEQ_MEMBER_NO.NEXTVAL, 'user05', 'pass05', '관리자', '951221','user01@kh.or.kr','01012543256','방동사장',DEFAULT,'기타','1234567894561',0,DEFAULT,DEFAULT);

UPDATE MEMBER SET MEMBER_NICK = '관리자' WHERE MEMBER_NO = 5;
COMMIT;
-- 게시판
CREATE TABLE "BOARD" (
   "BOARD_NO"   NUMBER      PRIMARY KEY,
   "BOARD_TITLE"   VARCHAR2(150)      NOT NULL,
   "BOARD_CONTENT"   VARCHAR2(4000)      NOT NULL,
   "CREATE_DT"   DATE   DEFAULT SYSDATE   NOT NULL,
   "UPDATE_DT"   DATE      NULL,
   "READ_COUNT"   NUMBER   DEFAULT 0   NOT NULL,
   "BOARD_ST"   CHAR(1)   DEFAULT 'N'   NOT NULL CHECK("BOARD_ST" IN('N','Y')),
   "MEMBER_NO"   NUMBER REFERENCES MEMBER ON DELETE CASCADE NOT NULL,
   "BOARD_TYPE_CD"   NUMBER    REFERENCES BOARD_TYPE NOT NULL
);

COMMENT ON COLUMN "BOARD"."BOARD_NO" IS '게시글 번호(시퀀스)';
COMMENT ON COLUMN "BOARD"."BOARD_TITLE" IS '게시글 제목';
COMMENT ON COLUMN "BOARD"."BOARD_CONTENT" IS '게시글 내용';
COMMENT ON COLUMN "BOARD"."CREATE_DT" IS '작성일';
COMMENT ON COLUMN "BOARD"."UPDATE_DT" IS '최종 수정일';
COMMENT ON COLUMN "BOARD"."READ_COUNT" IS '조회수';
COMMENT ON COLUMN "BOARD"."BOARD_ST" IS 'Y는 삭제';
COMMENT ON COLUMN "BOARD"."MEMBER_NO" IS '회원번호(시퀀스)';
COMMENT ON COLUMN "BOARD"."BOARD_TYPE_CD" IS '게시판 코드';

--게시판 시퀀스
CREATE SEQUENCE SEQ_BOARD_NO NOCACHE;

-- BOARD테이블에 샘플 데이터 삽입(PL/SQL)

BEGIN
    FOR I IN 1..300 LOOP

    INSERT INTO BOARD
    VALUES(
        SEQ_BOARD_NO.NEXTVAL, 
        SEQ_BOARD_NO.CURRVAL || '번째 게시글',
        SEQ_BOARD_NO.CURRVAL || '번째 게시글 내용입니다.',
        DEFAULT, DEFAULT, DEFAULT, DEFAULT, 3, 3
    );
    END LOOP;
END;
/ 
SELECT * FROM MEMBER;
DELETE FROM BOARD WHERE BOARD_TYPE_CD = 1;
COMMIT;


-- 좋아요
CREATE TABLE "LIKE_BOARD" (
   "BOARD_NO2"   NUMBER   REFERENCES BOARD ON DELETE CASCADE NOT NULL,
   "MEMBER_NO2"   NUMBER REFERENCES MEMBER ON DELETE CASCADE NOT NULL,
    PRIMARY KEY(BOARD_NO2,MEMBER_NO2) 
);

COMMENT ON COLUMN "LIKE_BOARD"."BOARD_NO2" IS '게시글 번호(시퀀스)';
COMMENT ON COLUMN "LIKE_BOARD"."MEMBER_NO2" IS '회원번호(시퀀스)';


-- 신고
CREATE TABLE "REPORT" (
   "MEMBER_NO"   NUMBER   REFERENCES MEMBER ON DELETE CASCADE NOT NULL,
   "REPORT_TYPE"   CHAR(1)      NOT NULL,
   "REPORT_NO"   NUMBER      NOT NULL,
   "REPORT_CONTENT"   VARCHAR2(400)      NULL,
   "REPORT_DATE"   DATE   DEFAULT SYSDATE   NOT NULL
);

COMMENT ON COLUMN "REPORT"."MEMBER_NO" IS '회원번호(시퀀스)';
COMMENT ON COLUMN "REPORT"."REPORT_TYPE" IS '1=게시판,  2=댓글';
COMMENT ON COLUMN "REPORT"."REPORT_NO" IS '게시글/댓글 번호';
COMMENT ON COLUMN "REPORT"."REPORT_CONTENT" IS '신고 내용';
COMMENT ON COLUMN "REPORT"."REPORT_DATE" IS '신고일자';


-- 게시판 이미지

CREATE TABLE "BOARD_IMG" (
   "IMG_NO"   NUMBER      PRIMARY KEY,
   "IMG_RENAME"   VARCHAR2(500)      NOT NULL,
   "IMG_ORIGINAL"   VARCHAR2(500)      NOT NULL,
   "IMG_LEVEL"   NUMBER      NOT NULL,
   "BOARD_NO"   NUMBER      NOT NULL REFERENCES BOARD ON DELETE CASCADE
);

COMMENT ON COLUMN "BOARD_IMG"."IMG_NO" IS '이미지 번호';
COMMENT ON COLUMN "BOARD_IMG"."IMG_RENAME" IS '이미지 저장경로 + 변경명';
COMMENT ON COLUMN "BOARD_IMG"."IMG_ORIGINAL" IS '이미지 원본명';
COMMENT ON COLUMN "BOARD_IMG"."IMG_LEVEL" IS '이미지 위치 지정 번호';
COMMENT ON COLUMN "BOARD_IMG"."BOARD_NO" IS '게시글 번호(시퀀스)';


--이미지 시퀀스
CREATE SEQUENCE SEQ_IMG_NO NOCACHE;


-- 댓글

CREATE TABLE "REPLY" (
   "REPLY_NO"   NUMBER      PRIMARY KEY,
   "REPLY_CONTENT"   VARCHAR2(1000)      NOT NULL,
   "CREATE_DATE"   DATE   DEFAULT SYSDATE   NOT NULL,
   "UPDATE_DATE"   DATE      NULL,
   "REPLY_ST"   CHAR(1)   DEFAULT 'N' NOT NULL CHECK(REPLY_ST IN('N','Y')) ,
   "BOARD_NO"   NUMBER      NOT NULL REFERENCES BOARD ON DELETE CASCADE,
   "MEMBER_NO"   NUMBER      NOT NULL REFERENCES MEMBER ON DELETE CASCADE,
   "REPLY_NO_PR"   NUMBER      NULL
);

COMMENT ON COLUMN "REPLY"."REPLY_NO" IS '댓글번호';
COMMENT ON COLUMN "REPLY"."REPLY_CONTENT" IS '댓글 내용';
COMMENT ON COLUMN "REPLY"."CREATE_DATE" IS '댓글 작성일';
COMMENT ON COLUMN "REPLY"."UPDATE_DATE" IS '댓글 수정일';
COMMENT ON COLUMN "REPLY"."REPLY_ST" IS 'Y는 삭제';
COMMENT ON COLUMN "REPLY"."BOARD_NO" IS '게시글 번호(시퀀스)';
COMMENT ON COLUMN "REPLY"."MEMBER_NO" IS '회원번호(시퀀스)';
COMMENT ON COLUMN "REPLY"."REPLY_NO_PR" IS '대댓글 사위 댓글 번호';

--댓글 시퀀스
CREATE SEQUENCE SEQ_RNO NOCACHE;


-- 소통방

CREATE TABLE "CHAT" (
   "CHAT_CONTENT"   VARCHAR2(300)      NOT NULL,
   "CREATE_DATE"   DATE   DEFAULT SYSDATE   NOT NULL,
   "MEMBER_NO"   NUMBER       REFERENCES MEMBER ON DELETE CASCADE NOT NULL
);

COMMENT ON COLUMN "CHAT"."CHAT_CONTENT" IS '채팅 작성일';
COMMENT ON COLUMN "CHAT"."CREATE_DATE" IS '채팅 작성일';
COMMENT ON COLUMN "CHAT"."MEMBER_NO" IS '회원번호(시퀀스)';

-- 불꽃방

CREATE TABLE "FIRE" (
   "QUERY_NO"   NUMBER      PRIMARY KEY,
   "QEURY_CONTENT"   VARCHAR(500)      NOT NULL,
   "PLUS"   NUMBER      NULL,
   "MINUS"   NUMBER      NULL,
   "MEMBER_NO"   NUMBER      REFERENCES MEMBER ON DELETE CASCADE NOT NULL
);

COMMENT ON COLUMN "FIRE"."QUERY_NO" IS '질의번호';
COMMENT ON COLUMN "FIRE"."QEURY_CONTENT" IS '질의내용';
COMMENT ON COLUMN "FIRE"."PLUS" IS '플러스갯수';
COMMENT ON COLUMN "FIRE"."MINUS" IS '마이너스갯수';
COMMENT ON COLUMN "FIRE"."MEMBER_NO" IS '회원번호(시퀀스)';

--불꽃 시퀀스
CREATE SEQUENCE SEQ_FIRE NOCACHE;

-- 소통방

CREATE TABLE "KEYWORD" (
   "KEYWORD_SUM"   VARCHAR2(1800)      PRIMARY KEY
);

COMMENT ON COLUMN "KEYWORD"."KEYWORD_SUM" IS '키워드 총합';


-- 회원 질의

CREATE TABLE "MEMBER_QA" (
   "MEMBER_NO"   NUMBER       PRIMARY KEY REFERENCES MEMBER ON DELETE CASCADE,
   "MEMBER_Q"   VARCHAR2(400)      NOT NULL,
   "MEMBER_A"   VARCHAR2(400)      NOT NULL
);

COMMENT ON COLUMN "MEMBER_QA"."MEMBER_NO" IS '회원번호(시퀀스)';
COMMENT ON COLUMN "MEMBER_QA"."MEMBER_Q" IS '질문';
COMMENT ON COLUMN "MEMBER_QA"."MEMBER_A" IS '답변';


-- 게시판 이름
SELECT BOARD_NAME 
FROM BOARD_TYPE
WHERE BOARD_TYPE_CD = 1;

-- 게시판 전체 게시물 수 조회
SELECT COUNT(*) 
FROM BOARD
JOIN BOARD_TYPE USING(BOARD_TYPE_CD)
WHERE PR_BOARD = 3;

-- 카테고리 게시물 수 조회
SELECT COUNT(*) 
FROM BOARD
WHERE BOARD_TYPE_CD = 22;

-- 게시판 전체 게시물 조회 목록
SELECT * 
FROM (SELECT ROWNUM RNUM, A.*
FROM (SELECT BOARD_NO,BOARD_TITLE,BOARD_CONTENT,
        TO_CHAR(CREATE_DT,'YYYY.MM.DD') AS "CREATE_DT"
        ,PROFILE_IMGE,MEMBER_NICK,BOARD_NAME
    FROM BOARD
    JOIN BOARD_TYPE USING(BOARD_TYPE_CD)
    JOIN MEMBER USING(MEMBER_NO)
    WHERE PR_BOARD = 3
    ORDER BY BOARD_NO DESC)A)
WHERE RNUM BETWEEN 30 AND 40;

SELECT * FROM MEMBER;
SELECT * FROM BOARD_TYPE;

-- 카테고리 게시물 조회 목록
SELECT * 
FROM (SELECT ROWNUM RNUM, A.*
FROM (SELECT BOARD_NO,BOARD_TITLE,BOARD_CONTENT,
        TO_CHAR(CREATE_DT,'YYYY.MM.DD') AS "CREATE_DT"
        ,PROFILE_IMGE,MEMBER_NICK,BOARD_NAME
    FROM BOARD
    JOIN BOARD_TYPE USING(BOARD_TYPE_CD)
    JOIN MEMBER USING(MEMBER_NO)
    WHERE BOARD_TYPE_CD = 4
    ORDER BY BOARD_NO DESC)A)
WHERE RNUM BETWEEN 30 AND 40;

SELECT * FROM BOARD_TYPE;
SELECT * FROM BOARD;

-- 제목 검색
SELECT COUNT(*) FROM BOARD
WHERE BOARD_TYPE_CD = 12
AND BOARD_TITLE LIKE '%번째%';

SELECT COUNT(*) FROM BOARD
JOIN BOARD_TYPE USING(BOARD_TYPE_CD)
WHERE PR_BOARD = 1
AND BOARD_TITLE LIKE '%번째%';

-- 작성자 검색
SELECT COUNT(*) FROM BOARD
JOIN MEMBER USING(MEMBER_NO)
JOIN BOARD_TYPE USING(BOARD_TYPE_CD)
WHERE PR_BOARD = 3
AND INSTR(MEMBER_NICK,'알바') > 0;

SELECT * FROM BOARD WHERE BOARD_TYPE_CD = 3;
-- 내용 검색
SELECT COUNT(*) FROM BOARD
WHERE BOARD_TYPE_CD = 12
AND BOARD_CONTENT LIKE '%50%';

-- 제목 검색 게시물 목록
SELECT * 
FROM (SELECT ROWNUM RNUM, A.*
FROM (SELECT BOARD_NO,BOARD_TITLE,BOARD_CONTENT,
        TO_CHAR(CREATE_DT,'YYYY.MM.DD') AS "CREATE_DT"
        ,PROFILE_IMGE,MEMBER_NICK,BOARD_NAME
    FROM BOARD
    JOIN BOARD_TYPE USING(BOARD_TYPE_CD)
    JOIN MEMBER USING(MEMBER_NO)
    WHERE BOARD_TYPE_CD = 12
    AND BOARD_TITLE LIKE '%50%'
    ORDER BY BOARD_NO DESC)A)
WHERE RNUM BETWEEN 1 AND 10;

-- 작성자 검색 게시물 목록
SELECT * 
FROM (SELECT ROWNUM RNUM, A.*
FROM (SELECT BOARD_NO,BOARD_TITLE,BOARD_CONTENT,
        TO_CHAR(CREATE_DT,'YYYY.MM.DD') AS "CREATE_DT"
        ,PROFILE_IMGE,MEMBER_NICK,BOARD_NAME
    FROM BOARD
    JOIN BOARD_TYPE USING(BOARD_TYPE_CD)
    JOIN MEMBER USING(MEMBER_NO)
    WHERE BOARD_TYPE_CD = 13
    AND MEMBER_NICK LIKE '%알바%'
    ORDER BY BOARD_NO DESC)A)
WHERE RNUM BETWEEN 1 AND 10;

-- 내용 검색 게시물 목록
SELECT * 
FROM (SELECT ROWNUM RNUM, A.*
FROM (SELECT BOARD_NO,BOARD_TITLE,BOARD_CONTENT,
        TO_CHAR(CREATE_DT,'YYYY.MM.DD') AS "CREATE_DT"
        ,PROFILE_IMGE,MEMBER_NICK,BOARD_NAME
    FROM BOARD
    JOIN BOARD_TYPE USING(BOARD_TYPE_CD)
    JOIN MEMBER USING(MEMBER_NO)
    WHERE BOARD_TYPE_CD = 12
    AND BOARD_CONTENT LIKE '%50%'
    ORDER BY BOARD_NO DESC)A)
WHERE RNUM BETWEEN 1 AND 10;

SELECT * 
	FROM (SELECT ROWNUM RNUM, A.*
	FROM (SELECT BOARD_NO,BOARD_TITLE,BOARD_CONTENT,
	        TO_CHAR(CREATE_DT,'YYYY.MM.DD') AS "CREATE_DT"
	        ,PROFILE_IMGE,MEMBER_NICK,BOARD_NAME
	    FROM BOARD
	    JOIN BOARD_TYPE USING(BOARD_TYPE_CD)
	    JOIN MEMBER USING(MEMBER_NO)
	    WHERE INSTR(MEMBER_NICK,'알바') > 0
	    ORDER BY BOARD_NO DESC)A)
	WHERE RNUM BETWEEN 1 AND 10;
    
    SELECT * 
	FROM (SELECT ROWNUM RNUM, A.*
	FROM (SELECT BOARD_NO,BOARD_TITLE,BOARD_CONTENT,
	        TO_CHAR(CREATE_DT,'YYYY.MM.DD') AS "CREATE_DT"
	        ,PROFILE_IMGE,MEMBER_NICK,BOARD_NAME
	    FROM BOARD
	    JOIN BOARD_TYPE USING(BOARD_TYPE_CD)
	    JOIN MEMBER USING(MEMBER_NO)
	    
		WHERE PR_BOARD = 1
	    AND INSTR(MEMBER_NICK,'알바') > 0
	    ORDER BY BOARD_NO DESC)A)
	WHERE RNUM BETWEEN 1 AND 10;

-- 공지사항 게시물 상세 조회
SELECT * FROM BOARD;
SELECT BOARD_NO,BOARD_TITLE, BOARD_CONTENT, 
        TO_CHAR(CREATE_DT, 'YYYY"년" MM"월" DD"일" HH24:MI:SS') "CREATE_DT", 
        TO_CHAR(UPDATE_DT , 'YYYY"년" MM"월" DD"일" HH24:MI:SS') "UPDATE_DT", 
        PROFILE_IMGE, MEMBER_NICK, READ_COUNT, MEMBER_NO
FROM BOARD
JOIN MEMBER USING(MEMBER_NO)
WHERE BOARD_NO = 9000
AND BOARD_ST = 'N';

UPDATE BOARD SET READ_COUNT = READ_COUNT + 1 WHERE BOARD_NO = 9000;
rollback;

-- 게시물 댓글 조회
SELECT REPLY_NO,REPLY_CONTENT,
    TO_CHAR(CREATE_DATE,'YYYY.MM.DD') "CREATE_DT",
    TO_CHAR(UPDATE_DATE,'YYYY.MM.DD') "UPDATE_DT"
    ,MEMBER_NO,PROFILE_IMGE,MEMBER_NICK
FROM REPLY
JOIN MEMBER USING(MEMBER_NO)
WHERE BOARD_NO = 9000
AND REPLY_ST = 'N';

INSERT INTO REPLY VALUES(SEQ_RNO.NEXTVAL,'테스트 댓글',DEFAULT,DEFAULT,DEFAULT,9000,1,DEFAULT);
COMMIT;