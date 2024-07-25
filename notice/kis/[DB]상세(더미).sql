--데이터 삭제
DELETE MEMBER;
DELETE BOARD;

--시퀀스 삭제*생성
DROP SEQUENCE SEQ_BOARD_NO;
CREATE SEQUENCE SEQ_BOARD_NO NOCACHE;


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--멤버(데이터삽입)
INSERT INTO MEMBER VALUES(
SEQ_MEMBER_NO.NEXTVAL, '아이디', '비밀번호', '이름', '20000101',
'aaa@naver.com', '01012341234', '닉네임', '주소', '직종',
NULL, 1, NULL, DEFAULT)
;

INSERT INTO MEMBER VALUES(
SEQ_MEMBER_NO.NEXTVAL, '아이디2', '비밀번호2', '이름2', '30000101',
'bbb@naver.com', '02012341234', '닉네임2', '주소2', '직종2',
NULL, 1, NULL, DEFAULT)
;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--게시판 상세조회(데이터삽입)
--모두게시판
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '게시판제목 카테고리더미', '게시판내용 카테고리더미', DEFAULT, NULL, 1, DEFAULT, 1, 3)
;


--알바게시판
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '게시판제목', '게시판내용', DEFAULT, NULL, 1, DEFAULT, 1, 5)
;

--사장게시판
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '게시판제목', '게시판내용', DEFAULT, NULL, 1, DEFAULT, 1, 5)
;


COMMIT;










--좋아요(데이터삽입)
INSERT INTO LIKE_BOARD VALUES(4, 1)
;
INSERT INTO LIKE_BOARD VALUES(4, 2)
;
COMMIT;


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--댓글목록(데이터삽입)
--일반댓글
--학원
INSERT INTO REPLY VALUES(
SEQ_RNO.NEXTVAL, ?, DEFAULT, NULL, DEFAULT, ?, ?, NULL);
-- CON / BOARD_NO / MEMBER_NO

INSERT INTO REPLY VALUES(
SEQ_RNO.NEXTVAL, '댓글내용 1번회원', DEFAULT, NULL, DEFAULT, 37, 1, NULL);


INSERT INTO REPLY VALUES(
SEQ_RNO.NEXTVAL, '댓글내용 1번회원', DEFAULT, NULL, DEFAULT, 
37, 1, NULL);
INSERT INTO REPLY VALUES(
SEQ_RNO.NEXTVAL, '댓글내용 1번회원', DEFAULT, NULL, DEFAULT, 
37, 2, NULL);

COMMIT;


--집
INSERT INTO REPLY VALUES(
SEQ_RNO.NEXTVAL, '댓글내용 19번회원', DEFAULT, NULL, DEFAULT, 
1, 19, NULL);

INSERT INTO REPLY VALUES(SEQ_RNO.NEXTVAL, '댓글내용 20번회원', DEFAULT, NULL, DEFAULT, 
1, 20, NULL);

COMMIT;


INSERT INTO REPLY VALUES(
SEQ_RNO.NEXTVAL, '댓글내용 19번회원', DEFAULT, NULL, DEFAULT, 
5, 19, NULL);

INSERT INTO REPLY VALUES(SEQ_RNO.NEXTVAL, '댓글내용 20번회원', DEFAULT, NULL, DEFAULT, 
5, 20, NULL);

COMMIT;











