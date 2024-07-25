package APro.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter   
@ToString
@NoArgsConstructor
@AllArgsConstructor 
public class Member {
	
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberEmail;
	private String memberTel;
	private String memberNickname;
	private String memberAddress;
	private String memberJob;
	private int memberBirth;
	private String businessNum;
	private int memberTypeCode;
	private String profileImage;
	private String secessionFlag;
	
}
