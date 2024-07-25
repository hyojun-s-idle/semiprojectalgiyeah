package APro.main.model.vo;

public class HotPost {
	
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String boardImage;
	private String memberNickname;
	private String profileImage;
	
	private int likeCount;
	
	public HotPost() {}
	
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
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public String getProfileImage() {
		return profileImage;
	}
	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	public String getBoardImage() {
		return boardImage;
	}

	public void setBoardImage(String boardImage) {
		this.boardImage = boardImage;
	}
	
	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	@Override
	public String toString() {
		return "HotPost [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardImage=" + boardImage + ", memberNickname=" + memberNickname + ", profileImage=" + profileImage
				+ ", likeCount=" + likeCount + "]";
	}

}
