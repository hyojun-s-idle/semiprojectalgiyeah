package APro.announce.model.vo;

public class AnnounceBoard {
	
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String createDate;
	private String profileImage;
	private String memberNickname;
	private String category;
	
	public AnnounceBoard() {}
	
	
	public AnnounceBoard(int boardNo, String boardTitle, String boardContent, String createDate, String profileImage,
			String memberNickname, String category) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.createDate = createDate;
		this.profileImage = profileImage;
		this.memberNickname = memberNickname;
		this.category = category;
	}


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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	@Override
	public String toString() {
		return "AnnounceBoard [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", createDate=" + createDate + ", profileImage=" + profileImage + ", memberNickname=" + memberNickname
				+ ", category=" + category + "]";
	}
	
	
}
