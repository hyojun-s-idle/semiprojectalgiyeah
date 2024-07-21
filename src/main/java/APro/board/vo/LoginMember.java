//dummy용 추후 지울것.!!!

package APro.board.vo;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class LoginMember {
	private int memberNo;
	private String memberNickname;
	private String profileImage;
}
