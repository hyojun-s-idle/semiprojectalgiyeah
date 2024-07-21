--데이터 삭제
DELETE MEMBER;
DELETE BOARD;

--시퀀스 삭제*생성
DROP SEQUENCE SEQ_BOARD_NO;
CREATE SEQUENCE SEQ_BOARD_NO NOCACHE;

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

--게시판 상세조회(데이터삽입)
INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '게시판제목', '게시판내용', DEFAULT, NULL, 1, DEFAULT, 19, 1)
;


--좋아요(데이터삽입)
INSERT INTO LIKE_BOARD VALUES(1, 19)
;
INSERT INTO LIKE_BOARD VALUES(1, 20)
;

