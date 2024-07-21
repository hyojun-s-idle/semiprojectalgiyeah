package APro.announce.model.vo;

import java.util.ArrayList;
import java.util.List;

public class AnBoardDetail {
	
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String createDate;
	private String updateDate;
	private int readCount;
	private String profileImage;
	private String memberNickname;
	private int memberNo;
	
	List<AnReply> replyList = new ArrayList<>();
	
	 public AnBoardDetail() {}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	public List<AnReply> getReplyList() {
		return replyList;
	}

	public void setReplyList(List<AnReply> replyList) {
		this.replyList = replyList;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "AnBoardDetail [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", createDate=" + createDate + ", updateDate=" + updateDate + ", readCount=" + readCount
				+ ", profileImage=" + profileImage + ", memberNickname=" + memberNickname + ", memberNo=" + memberNo
				+ ", replyList=" + replyList + "]";
	}

	
	

}
