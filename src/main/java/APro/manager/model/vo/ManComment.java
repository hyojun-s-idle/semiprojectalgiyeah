package APro.manager.model.vo;

public class ManComment {
	
	private int replyNo;
	private int reportCount;
	private String memberNickname;
	private String memberType;
	private String boardType;
	private String category;
	private String boardTitle;
	private String commentContent;
	private String createDate;
	private String updateDate;
	private int boardNo;
	
	public ManComment() {}

	public int getReplyNo() {
		return replyNo;
	}



	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}



	public int getReportCount() {
		return reportCount;
	}



	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}



	public String getMemberNickname() {
		return memberNickname;
	}



	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}



	public String getMemberType() {
		return memberType;
	}



	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}



	public String getBoardType() {
		return boardType;
	}



	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}



	public String getCategory() {
		return category;
	}



	public void setCategory(String category) {
		this.category = category;
	}



	public String getBoardTitle() {
		return boardTitle;
	}



	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}



	public String getCommentContent() {
		return commentContent;
	}



	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
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

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	@Override
	public String toString() {
		return "ManComment [replyNo=" + replyNo + ", reportCount=" + reportCount + ", memberNickname=" + memberNickname
				+ ", memberType=" + memberType + ", boardType=" + boardType + ", category=" + category + ", boardTitle="
				+ boardTitle + ", commentContent=" + commentContent + ", createDate=" + createDate + ", updateDate="
				+ updateDate + ", boardNo=" + boardNo + "]";
	}


}
