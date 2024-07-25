package APro.manager.model.vo;

import java.util.List;

public class ManPostDetail {
	
	private int boardNo;
	private int reportCount;
	private String memberNickname;
	private String memberType;
	private String boardTitle;
	private String boardType;
	private String category;
	private String boardContent;
	private String createDate;
	private String updateDate;
	private List<ReportReson> rList;
	
	public ManPostDetail() {}
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
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
	public List<ReportReson> getrList() {
		return rList;
	}
	public void setrList(List<ReportReson> rList) {
		this.rList = rList;
	}
	@Override
	public String toString() {
		return "ManPostDetail [boardNo=" + boardNo + ", reportCount=" + reportCount + ", memberNickname="
				+ memberNickname + ", memberType=" + memberType + ", boardTitle=" + boardTitle + ", boardType="
				+ boardType + ", category=" + category + ", boardContent=" + boardContent + ", createDate=" + createDate
				+ ", updateDate=" + updateDate + ", rList=" + rList + "]";
	}
	
	

}
