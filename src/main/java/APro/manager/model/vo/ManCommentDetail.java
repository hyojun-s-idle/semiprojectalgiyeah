package APro.manager.model.vo;

import java.util.List;

public class ManCommentDetail {
	
	private int replyNo;
	private int boardNo;
	private String memberNickname;
	private String memberType;
	private String boardType;
	private String category;
	private String commentContent;
	private int replyCount;
	private String createDate;
	private String updateString;
	private List<ReportReson> resonList;
	
	public ManCommentDetail() {}
	
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getUpdateString() {
		return updateString;
	}
	public void setUpdateString(String updateString) {
		this.updateString = updateString;
	}
	public List<ReportReson> getResonList() {
		return resonList;
	}
	public void setResonList(List<ReportReson> resonList) {
		this.resonList = resonList;
	}
	
	@Override
	public String toString() {
		return "ManCommentDetail [replyNo=" + replyNo + ", boardNo=" + boardNo + ", memberNickname=" + memberNickname
				+ ", memberType=" + memberType + ", boardType=" + boardType + ", category=" + category
				+ ", commentContent=" + commentContent + ", replyCount=" + replyCount + ", createDate=" + createDate
				+ ", updateString=" + updateString + ", resonList=" + resonList + "]";
	}
	
	

}
