package APro.board.vo;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class BoardDetail {

	//BOARD테이블
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String createDate;
	private String updateDate;
	private int readCount;
	
	private int memberNo;
	private int boardTypeCd;
	
	
	//BOARD_TYPE테이블
	private String majCategory;
	private String subCategory;
	
	
	//LIKE_BOARD테이블
	private int likeCount;
	
	
	//MEMBER테이블
	private String memberNickname;
	private String profileImage;
	
	//REPLY테이블
	private int replyCount;
	
	
	
	
	//좋아요 상태 반영
	private int likeState;
	

	

	
//	private List<BoardImage> imageList;
	
}



//-----------------------
//class = 필수선택 vs 조회결과
//***********************
//class = DB조회 >> DB컬럼
//class = DB조회 vs DB컬럼
//-----------------------
//출력결과만 담을것
//BOARD테이블 컬럼전부x !!!
//*********************

