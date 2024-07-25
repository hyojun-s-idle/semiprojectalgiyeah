package APro.manager.model.vo;

public class ManMember {
	
	private int memberNo;
	private String memberId;
	private String memberType;
	private String memberName;
	private String memberNickname;
	private String memberTel;
	private String memberEmail;
	private String memberAddress;
	private String bussinessNum;
	private char secessionFl;
	
	public ManMember() {}
	
	

	public int getMemberNo() {
		return memberNo;
	}



	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}



	public String getMemberId() {
		return memberId;
	}



	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}



	public String getMemberType() {
		return memberType;
	}



	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}



	public String getMemberName() {
		return memberName;
	}



	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}



	public String getMemberNickname() {
		return memberNickname;
	}



	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}



	public String getMemberTel() {
		return memberTel;
	}



	public void setMemberTel(String memberTel) {
		this.memberTel = memberTel;
	}



	public String getMemberEmail() {
		return memberEmail;
	}



	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}



	public String getMemberAddress() {
		return memberAddress;
	}



	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}



	public String getBussinessNum() {
		return bussinessNum;
	}



	public void setBussinessNum(String bussinessNum) {
		this.bussinessNum = bussinessNum;
	}



	public char getSecessionFl() {
		return secessionFl;
	}



	public void setSecessionFl(char secessionFl) {
		this.secessionFl = secessionFl;
	}



	@Override
	public String toString() {
		return "ManMember [memberNo=" + memberNo + ", memberId=" + memberId + ", memberType=" + memberType
				+ ", memberName=" + memberName + ", memberNickname=" + memberNickname + ", memberTel=" + memberTel
				+ ", memberEmail=" + memberEmail + ", memberAddress=" + memberAddress + ", bussinessNum=" + bussinessNum
				+ ", secessionFl=" + secessionFl + "]";
	}
	
	
	

}
