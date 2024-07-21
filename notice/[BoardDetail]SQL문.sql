--게시판 상세조회
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

--******************************************************************************



--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--댓글
--일반댓글
SELECT REPLY_NO, REPLY_CONTENT, CREATE_DATE, UPDATE_DATE, BOARD_NO,
MEMBER_NO, MEMBER_NICK, PROFILE_IMGE
FROM REPLY
JOIN MEMBER USING(MEMBER_NO)
WHERE  REPLY_ST='N'
AND BOARD_NO=?
;



