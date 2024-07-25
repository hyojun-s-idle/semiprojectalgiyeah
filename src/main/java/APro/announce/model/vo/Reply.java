package APro.announce.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

public class Reply {
	
	private int replyNo;
	private String replyContent;
	private String createDate;
	private int boardNo;
	private int memberNo;
	private String memberNickname;
	private String profileImage;
	private String updateDate;
	
	public Reply() {}
	
	public Reply(int replyNo, String replyContent, String createDate, int boardNo, int memberNo, String memberNickname,
			String profileImage, String updateDate) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.createDate = createDate;
		this.boardNo = boardNo;
		this.memberNo = memberNo;
		this.memberNickname = memberNickname;
		this.profileImage = profileImage;
		this.updateDate = updateDate;
	}



	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
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
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", createDate=" + createDate
				+ ", boardNo=" + boardNo + ", memberNo=" + memberNo + ", memberNickname=" + memberNickname
				+ ", profileImage=" + profileImage + ", updateDate=" + updateDate + "]";
	}

}
