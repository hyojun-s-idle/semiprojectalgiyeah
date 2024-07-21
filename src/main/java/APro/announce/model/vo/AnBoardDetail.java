package APro.announce.model.vo;

import java.util.ArrayList;
import java.util.List;

public class AnBoardDetail {
	
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String createDate;
	private String updateDate;
	private String profileImage;
	private String memberNickname;
	private String category;
	
	List<AnReply> replyList = new ArrayList<>();

}
