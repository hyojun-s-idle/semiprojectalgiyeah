









--게시판 삽입

INSERT INTO BOARD
VALUES(?, ?, ?, DEFAULT, DEFAULT,
DEFAULT, DEFAULT, ?, ?)
;





--------------------------------------------------------------------------------


--게시판 삭제
UPDATE BOARD SET BOARD_ST='Y' 
WHERE BOARD_NO=?
;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--<게시판 상세조회>
--게시판+좋아요+댓글개수(삭제처리)+카테고리
SELECT BOARD_NO, BOARD_TITLE, BOARD_CONTENT, 
TO_CHAR(CREATE_DT, 'YYYY.MM.DD HH24:MI:SS') CREATE_DT, 
UPDATE_DT, READ_COUNT, MEMBER_NO,

( 
  SELECT COUNT(MEMBER_NO2)
  FROM LIKE_BOARD
  WHERE BOARD_NO2=BOARD.BOARD_NO
)  AS LIKE_COUNT,

PROFILE_IMGE, MEMBER_NICK,


(
SELECT COUNT(REPLY_NO)
FROM REPLY
WHERE BOARD_NO=BOARD.BOARD_NO
AND REPLY_ST='N'
)AS REPLY_COUNT,

B.BOARD_NAME AS MAJ,A.BOARD_NAME AS SUB

FROM BOARD
JOIN MEMBER USING(MEMBER_NO)
JOIN BOARD_TYPE A USING(BOARD_TYPE_CD)
JOIN BOARD_TYPE B ON(A.PR_BOARD=B.BOARD_TYPE_CD)

WHERE BOARD_ST='N' 
AND BOARD_NO=37
;

--게시판+좋아요+댓글개수+카테고리
SELECT BOARD_NO, BOARD_TITLE, BOARD_CONTENT, 
TO_CHAR(CREATE_DT, 'YYYY.MM.DD HH24:MI:SS') CREATE_DT, 
UPDATE_DT, READ_COUNT, MEMBER_NO,

( 
  SELECT COUNT(MEMBER_NO2)
  FROM LIKE_BOARD
  WHERE BOARD_NO2=BOARD.BOARD_NO
)  AS LIKE_COUNT,

PROFILE_IMGE, MEMBER_NICK,


(
SELECT COUNT(REPLY_NO)
FROM REPLY
WHERE BOARD_NO=BOARD.BOARD_NO
)AS REPLY_COUNT,

B.BOARD_NAME AS MAJ,A.BOARD_NAME AS SUB

FROM BOARD
JOIN MEMBER USING(MEMBER_NO)
JOIN BOARD_TYPE A USING(BOARD_TYPE_CD)
JOIN BOARD_TYPE B ON(A.PR_BOARD=B.BOARD_TYPE_CD)

WHERE BOARD_ST='N' 
AND BOARD_NO=3
;

SELECT BOARD_NO, BOARD_TITLE, BOARD_CONTENT, 
TO_CHAR(CREATE_DT, 'YYYY.MM.DD HH24:MI:SS') CREATE_DT, 
UPDATE_DT, READ_COUNT, MEMBER_NO,

( 
  SELECT COUNT(MEMBER_NO2)
  FROM LIKE_BOARD
  WHERE BOARD_NO2=BOARD.BOARD_NO
)  AS LIKE_COUNT,

PROFILE_IMGE, MEMBER_NICK,


(
SELECT COUNT(REPLY_NO)
FROM REPLY
WHERE BOARD_NO=BOARD.BOARD_NO
)AS REPLY_COUNT,

B.BOARD_NAME,A.BOARD_NAME

FROM BOARD
JOIN MEMBER USING(MEMBER_NO)
JOIN BOARD_TYPE A USING(BOARD_TYPE_CD)
JOIN BOARD_TYPE B ON(A.PR_BOARD=B.BOARD_TYPE_CD)

WHERE BOARD_ST='N' 
AND BOARD_NO=3
;


SELECT BOARD_NO, BOARD_TITLE, BOARD_CONTENT, 
TO_CHAR(CREATE_DT, 'YYYY.MM.DD HH24:MI:SS') CREATE_DT, 
UPDATE_DT, READ_COUNT, MEMBER_NO,

( 
  SELECT COUNT(MEMBER_NO2)
  FROM LIKE_BOARD
  WHERE BOARD_NO2=BOARD.BOARD_NO
)  AS LIKE_COUNT,

PROFILE_IMGE, MEMBER_NICK,

(
SELECT COUNT(REPLY_NO)
FROM REPLY
WHERE BOARD_NO=BOARD.BOARD_NO
)AS REPLY_COUNT

FROM BOARD
JOIN MEMBER USING(MEMBER_NO)
JOIN BOARD_TYPE A USING(BOARD_TYPE_CD)
JOIN BOARD_TYPE B ON(A.PR_BOARD=B.BOARD_TYPE_CD)

WHERE BOARD_ST='N' 
AND BOARD_NO=3
;


SELECT BOARD_NO, BOARD_TITLE, BOARD_CONTENT, 
TO_CHAR(CREATE_DT, 'YYYY.MM.DD HH24:MI:SS') CREATE_DT, 
UPDATE_DT, READ_COUNT, MEMBER_NO,

( 
  SELECT COUNT(MEMBER_NO2)
  FROM LIKE_BOARD
  WHERE BOARD_NO2=BOARD.BOARD_NO
)  AS LIKE_COUNT,

PROFILE_IMGE, MEMBER_NICK,

(
SELECT COUNT(REPLY_NO)
FROM REPLY
WHERE BOARD_NO=BOARD.BOARD_NO
)AS REPLY_COUNT

FROM BOARD
JOIN MEMBER USING(MEMBER_NO)
JOIN BOARD_TYPE A USING(BOARD_TYPE_CD)
JOIN BOARD_TYPE B ON(A.PR_BOARD=B.BOARD_TYPE_CD)

WHERE BOARD_ST='N' 
AND BOARD_NO=1
;


SELECT BOARD_NO, BOARD_TITLE, BOARD_CONTENT, 
TO_CHAR(CREATE_DT, 'YYYY.MM.DD HH24:MI:SS') CREATE_DT, 
UPDATE_DT, READ_COUNT, MEMBER_NO,

( 
  SELECT COUNT(MEMBER_NO2)
  FROM LIKE_BOARD
  WHERE BOARD_NO2=BOARD.BOARD_NO
)  AS LIKE_COUNT,

PROFILE_IMGE, MEMBER_NICK,

(
SELECT COUNT(REPLY_NO)
FROM REPLY
WHERE BOARD_NO=BOARD.BOARD_NO
)AS REPLY_COUNT

FROM BOARD
JOIN MEMBER USING(MEMBER_NO)
JOIN BOARD_TYPE USING(BOARD_TYPE_CD)

WHERE BOARD_ST='N' 
AND BOARD_NO=1
;



SELECT B.BOARD_NAME MJR , A.BOARD_NAME SUB
FROM BOARD_TYPE A
JOIN BOARD_TYPE B  ON(A.PR_BOARD=B.BOARD_TYPE_CD)
WHERE A.BOARD_TYPE_CD=?
;


--게시판+좋아요+댓글개수
SELECT BOARD_NO, BOARD_TITLE, BOARD_CONTENT, 
TO_CHAR(CREATE_DT, 'YYYY.MM.DD HH24:MI:SS') CREATE_DT, 
UPDATE_DT, READ_COUNT, MEMBER_NO,

( 
  SELECT COUNT(MEMBER_NO2)
  FROM LIKE_BOARD
  WHERE BOARD_NO2=BOARD.BOARD_NO
)  AS LIKE_COUNT,

PROFILE_IMGE, MEMBER_NICK,

(
SELECT COUNT(REPLY_NO)
FROM REPLY
WHERE BOARD_NO=BOARD.BOARD_NO
)AS REPLY_COUNT


FROM BOARD
JOIN MEMBER USING(MEMBER_NO)
WHERE BOARD_ST='N' 
AND BOARD_NO=?
;

SELECT BOARD_NO, BOARD_TITLE, BOARD_CONTENT, 
TO_CHAR(CREATE_DT, 'YYYY.MM.DD HH24:MI:SS') CREATE_DT, 
UPDATE_DT, READ_COUNT, MEMBER_NO,

( 
  SELECT COUNT(MEMBER_NO2)
  FROM LIKE_BOARD
  WHERE BOARD_NO2=BOARD.BOARD_NO
)  AS LIKE_COUNT,

PROFILE_IMGE, MEMBER_NICK,

(
SELECT COUNT(REPLY_NO)
FROM REPLY
WHERE BOARD_NO=BOARD.BOARD_NO

)AS REPLY_COUNT


FROM BOARD
JOIN MEMBER USING(MEMBER_NO)

WHERE BOARD_ST='N' 
AND BOARD_NO=1
;




SELECT COUNT(REPLY_NO) AS REPLY_COUNT
FROM REPLY
WHERE BOARD_NO=1
;


--게시판+좋아요
SELECT BOARD_NO, BOARD_TITLE, BOARD_CONTENT, 
TO_CHAR(CREATE_DT, 'YYYY.MM.DD HH24:MI:SS') CREATE_DT, 
UPDATE_DT, READ_COUNT, MEMBER_NO,

( 
  SELECT COUNT(MEMBER_NO2)
  FROM LIKE_BOARD
  WHERE BOARD_NO2=BOARD.BOARD_NO
)  AS LIKE_COUNT,

PROFILE_IMGE, MEMBER_NICK

FROM BOARD
JOIN MEMBER USING(MEMBER_NO)

WHERE BOARD_ST='N' 
AND BOARD_NO=?
;

SELECT BOARD_NO, BOARD_TITLE, BOARD_CONTENT, CREATE_DT, UPDATE_DT, READ_COUNT, MEMBER_NO,
( 
  SELECT COUNT(MEMBER_NO2)
  FROM LIKE_BOARD
  WHERE BOARD_NO2=BOARD.BOARD_NO
)  AS LIKE_COUNT,
PROFILE_IMGE, MEMBER_NICK
FROM BOARD
JOIN MEMBER USING(MEMBER_NO)
WHERE BOARD_ST='N' 
AND BOARD_NO=?
;

SELECT BOARD_NO, BOARD_TITLE, BOARD_CONTENT, CREATE_DT, UPDATE_DT, READ_COUNT, MEMBER_NO,
( 
  SELECT COUNT(MEMBER_NO2)
  FROM LIKE_BOARD
  WHERE BOARD_NO2=?
)  AS LIKE_COUNT,
PROFILE_IMGE, MEMBER_NICK
FROM BOARD
JOIN MEMBER USING(MEMBER_NO)
WHERE BOARD_ST='N' 
AND BOARD_NO=?
;

--예시
SELECT BOARD_NO, BOARD_TITLE, BOARD_CONTENT, CREATE_DT, UPDATE_DT, READ_COUNT, MEMBER_NO,
( 
  SELECT COUNT(MEMBER_NO2)
  FROM LIKE_BOARD
  WHERE BOARD_NO2=BOARD.BOARD_NO
)  AS LIKE_COUNT,
PROFILE_IMGE, MEMBER_NICK
FROM BOARD
JOIN MEMBER USING(MEMBER_NO)
WHERE BOARD_ST='N' 
AND BOARD_NO=1
;

SELECT BOARD_NO, BOARD_TITLE, BOARD_CONTENT, CREATE_DT, UPDATE_DT, READ_COUNT, MEMBER_NO,
( 
  SELECT COUNT(MEMBER_NO2)
  FROM LIKE_BOARD
  WHERE BOARD_NO2=1
)  AS LIKE_COUNT,
PROFILE_IMGE, MEMBER_NICK
FROM BOARD
JOIN MEMBER USING(MEMBER_NO)
WHERE BOARD_ST='N' 
AND BOARD_NO=1
;

--------------------------------------------------------------------------------
--카테고리
--모두*알바*사장  + 외식음료 ...

SELECT B.BOARD_NAME MAJ , A.BOARD_NAME SUB
FROM BOARD_TYPE A
JOIN BOARD_TYPE B  ON(A.PR_BOARD=B.BOARD_TYPE_CD)
WHERE A.BOARD_TYPE_CD=?
;

SELECT B.BOARD_NAME MJR , A.BOARD_NAME SUB
FROM BOARD_TYPE A
JOIN BOARD_TYPE B  ON(A.PR_BOARD=B.BOARD_TYPE_CD)
WHERE A.BOARD_TYPE_CD=?
;


SELECT B.BOARD_NAME MJR , A.BOARD_NAME SUB
FROM BOARD_TYPE A
JOIN BOARD_TYPE B  ON(A.PR_BOARD=B.BOARD_TYPE_CD)
WHERE A.BOARD_TYPE_CD=2
;

SELECT B.BOARD_NAME MAJ , A.BOARD_NAME SUB
FROM BOARD_TYPE A
JOIN BOARD_TYPE B  ON(A.PR_BOARD=B.BOARD_TYPE_CD)
WHERE A.BOARD_TYPE_CD=2
;

SELECT B.BOARD_NAME, A.BOARD_NAME
FROM BOARD_TYPE A
JOIN BOARD_TYPE B  ON(A.PR_BOARD=B.BOARD_TYPE_CD)
WHERE A.BOARD_TYPE_CD=2
;


SELECT A.BOARD_NAME, B.BOARD_NAME
FROM BOARD_TYPE A
JOIN BOARD_TYPE B  ON(A.PR_BOARD=B.BOARD_TYPE_CD)
WHERE A.BOARD_TYPE_CD=2
;


SELECT A.BOARD_TYPE_CD, A.BOARD_NAME, B.BOARD_NAME
FROM BOARD_TYPE A
JOIN BOARD_TYPE B  ON(A.PR_BOARD=B.BOARD_TYPE_CD)
WHERE A.BOARD_TYPE_CD=2
;

SELECT A.BOARD_TYPE_CD, A.BOARD_NAME, A.PR_BOARD, B.BOARD_NAME
FROM BOARD_TYPE A
JOIN BOARD_TYPE B  ON(A.PR_BOARD=B.BOARD_TYPE_CD)
WHERE A.BOARD_TYPE_CD=2
;

SELECT *
FROM BOARD_TYPE A
JOIN BOARD_TYPE B  ON(A.PR_BOARD=B.BOARD_TYPE_CD)
WHERE A.BOARD_TYPE_CD=2
;



SELECT BOARD_NAME
FROM BOARD_TYPE
WHERE BOARD_TYPE_CD=(
                        SELECT PR_BOARD
                        FROM BOARD_TYPE
                        WHERE BOARD_TYPE_CD=2
                    )
;

SELECT BOARD_NAME
FROM BOARD_TYPE
WHERE BOARD_TYPE_CD=2
;


SELECT BOARD_NAME
FROM BOARD_TYPE
WHERE BOARD_TYPE_CD=1
;

BOARD_TYPE_CD=(PR_BOARD)



SELECT PR_BOARD
FROM BOARD_TYPE
WHERE BOARD_TYPE_CD=2
;


SELECT PR_BOARD
, BOARD_NAME
FROM BOARD_TYPE
WHERE BOARD_TYPE_CD=2
;

SELECT *
FROM BOARD_TYPE
WHERE BOARD_TYPE_CD=2
;



--[BOARD_TYPE_CD]
/**********************************************************
모두 -> 알바*사장
모두 -> 2*3

알바 -> 외식/음료 ... 기타
알바 -> 4 ... 13

사장 -> 요식업 ... 기타
사장 -> 14 ... 22

BOARD 테이블 -> BOARD_TYPE_CD : 사실상 1번 들어가는경우X !!!
2 ~ 22번 값넣고.
나머지 PR_BOARD에서 끌어오는식.!!!
-----------------------------------------------------------

       1   2   3   4   ...   13   14   ...   22
모두    X   O   O   X    X    X    X     X     X
알바    X   X   X   O    O    O    X     X     X
사장    X   X   X   X    X    X    O     O     O
-----------------------------------------------------------
       1   2   3   4   ...   13   14   ...   22
모두        O   O   
알바                O    O    O    
사장                               O     O     O
-----------------------------------------------------------
모두 :  2 ~  3
알바 :  4 ~ 13
사장 : 14 ~ 22
-----------------------------------------------------------
+cf. 모두 하위카테고리 없는경우
       1   2   3   4   ...   13   14   ...   22
모두    O     
알바                O    O    O    
사장                               O     O     O
-----------------------------------------------------------
모두 :  1 
알바 :  4 ~ 13
사장 : 14 ~ 22


-추후 확인해볼것


-----------------------------------------------------------
       1   2   3   4   ...   13   14   ...   22
모두        O   O   
알바                O    O    O    
사장                               O     O     O
-----------------------------------------------------------
모두 2~3  >> 1 
일듯함
**********************************************************/

--------------------------------------------------------------------------------
--댓글개수
SELECT 
(
SELECT COUNT(REPLY_NO)
FROM REPLY
WHERE BOARD_NO=BOARD.BOARD_NO

)AS REPLY_COUNT
FROM BOARD
WHERE BOARD_NO=1
;



SELECT 
(
SELECT COUNT(REPLY_NO)
FROM REPLY
WHERE BOARD_NO=BOARD.BOARD_NO

)AS REPLY_COUNT
FROM BOARD
WHERE BOARD_NO=2
;

SELECT 
(
SELECT COUNT(REPLY_NO)
FROM REPLY
WHERE BOARD_NO=2

)AS REPLY_COUNT
FROM BOARD
WHERE BOARD_NO=2
;

SELECT 
(
SELECT COUNT(REPLY_NO)
FROM REPLY
WHERE BOARD_NO=1

)AS REPLY_COUNT
FROM BOARD
WHERE BOARD_NO=1
;


SELECT 
(
SELECT COUNT(REPLY_NO) AS REPLY_COUNT
FROM REPLY
WHERE BOARD_NO=1

)AS REPLY_COUNT
FROM BOARD
WHERE BOARD_NO=1
;


SELECT 
(
SELECT COUNT(REPLY_NO) AS REPLY_COUNT
FROM REPLY
WHERE BOARD_NO=1

)
FROM BOARD
WHERE BOARD_NO=1
;

SELECT 
(
SELECT COUNT(REPLY_NO) AS REPLY_COUNT
FROM REPLY
WHERE BOARD_NO=1

)
FROM BOARD
;


SELECT *
FROM BOARD
JOIN REPLY USING(BOARD_NO)
WHERE BOARD_NO=1
;


SELECT COUNT(REPLY_NO) AS REPLY_COUNT
FROM BOARD
JOIN REPLY USING(BOARD_NO)
WHERE BOARD_NO=1
;

SELECT COUNT(REPLY_NO) AS REPLY_COUNT
FROM REPLY
WHERE BOARD_NO=1
;

SELECT COUNT(REPLY_NO)
FROM REPLY
WHERE BOARD_NO=1
;


SELECT *
FROM REPLY
WHERE BOARD_NO=1
;

SELECT *
FROM REPLY
;
--------------------------------------------------------------------------------
--[좋아요]



--좋아요 UP /DOWN
INSERT INTO LIKE_BOARD VALUES (61 , 4)
;

DELETE FROM LIKE_BOARD 
WHERE BOARD_NO2=60
AND MEMBER_NO2=4
;


--============================================

--좋아요 상태
SELECT NVL2(MIN(MEMBER_NO2),1,0) LIKE_ST
FROM LIKE_BOARD
WHERE BOARD_NO2=?
AND MEMBER_NO2=?
;

--좋아요개수+좋아요상태
SELECT COUNT(MEMBER_NO2) AS LIKE_COUNT,
(
SELECT NVL2(MIN(MEMBER_NO2),1,0) LIKE_ST
FROM LIKE_BOARD
WHERE BOARD_NO2=4
AND MEMBER_NO2=1
) AS LIKE_ST
FROM LIKE_BOARD
WHERE BOARD_NO2=4
;
--(x)

SELECT NVL2(MIN(MEMBER_NO2),1,0) LIKE_ST
FROM LIKE_BOARD
WHERE BOARD_NO2=61
AND MEMBER_NO2=4
;


SELECT NVL2(MIN(MEMBER_NO2),1,0) LIKE_ST
FROM LIKE_BOARD
WHERE BOARD_NO2=4
AND MEMBER_NO2=1
;


--좋아요 상태
SELECT NVL2(MIN(MEMBER_NO2),1,0) LIKE_ST
FROM LIKE_BOARD
WHERE BOARD_NO2=?
AND MEMBER_NO2=?
;


SELECT NVL2(MIN(MEMBER_NO2),1,0) LIKE_ST
FROM LIKE_BOARD
WHERE BOARD_NO2=4
AND MEMBER_NO2=1
;

SELECT (NVL(MEMBER_NO2)1,0)
FROM LIKE_BOARD
WHERE BOARD_NO2=4
AND MEMBER_NO2=3
;
--(X)



SELECT NVL2(MEMBER_NO2,1,0)
FROM LIKE_BOARD
WHERE BOARD_NO2=4
AND MEMBER_NO2=3
;
--(X)


SELECT 
CASE
    WHEN MEMBER_NO2 IS NULL THEN 0
    --ELSE 1
END
FROM LIKE_BOARD
WHERE BOARD_NO2=4
AND MEMBER_NO2=3
;
--(X)

SELECT ROWNUM
FROM LIKE_BOARD
WHERE BOARD_NO2=4
AND MEMBER_NO2=1
;


SELECT 
CASE 
WHEN(ROWNUM IS NULL) THEN 0
WHEN(ROWNUM IS NOT NULL) THEN 1

ELSE 0 
END 
AS LIKE_ST
FROM LIKE_BOARD
WHERE BOARD_NO2=4
AND MEMBER_NO2=3
;


SELECT ROWNUM
FROM LIKE_BOARD
WHERE BOARD_NO2=4
AND MEMBER_NO2=1
;

SELECT *
FROM LIKE_BOARD
WHERE BOARD_NO2=4
AND MEMBER_NO2=1
;

SELECT *
FROM LIKE_BOARD
WHERE BOARD_NO2=4
;


--좋아요 개수
SELECT COUNT(MEMBER_NO2) AS LIKE_COUNT
FROM LIKE_BOARD
WHERE BOARD_NO2=1
;


--좋아요 회원
SELECT MEMBER_NO2
FROM LIKE_BOARD
WHERE BOARD_NO2=1
;


--------------------------------------------------------------------------------
--게시판번호
--[BOARD_NO]
/**********************************************************
List   : 게시판번호O
Detail : 게시판번호X

Detail : DB(O)*화면(X)
-데이터는 가져오되
-화면에는 뿌리지X !!!

일반게시판도 LIST에서 뿌리고
안에들어가서는 굳이표현X !!!
**********************************************************/




--******************************************************************************
--******************************************************************************
--******************************************************************************
--댓글
--일반댓글
SELECT REPLY_NO, REPLY_CONTENT, CREATE_DATE, UPDATE_DATE, BOARD_NO,
MEMBER_NO, MEMBER_NICK, PROFILE_IMGE
FROM REPLY
JOIN MEMBER USING(MEMBER_NO)
WHERE  REPLY_ST='N'
AND BOARD_NO=?
;


SELECT REPLY_NO, REPLY_CONTENT, CREATE_DATE, UPDATE_DATE, BOARD_NO,
MEMBER_NO, MEMBER_NICK, PROFILE_IMGE
FROM REPLY
JOIN MEMBER USING(MEMBER_NO)
WHERE  REPLY_ST='N'
AND BOARD_NO=37
ORDER BY 1
;


SELECT * 
FROM REPLY
WHERE BOARD_NO=1
;


----------
--날짜형식
SELECT TO_CHAR(CREATE_DATE, 'YYYY.MM.DD HH24:MI:SS') CREATE_DATE
FROM REPLY
;
        

