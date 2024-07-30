package APro.board.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Reply {

	private int replyNo;
	private String replyContent;
	private String createDate;
	private String updateDate;
	private int boardNo;
	private int memberNo;
	private int replyNoPr;

	
	//MEMBER테이블
	private String memberNickname;
	private String profileImage;
	
	
}
