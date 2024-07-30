package APro.member.model.dao;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

import APro.board.dao.BoardDAO;
import APro.member.model.vo.Member;
import APro.member.model.vo.MemberQA;

import static APro.common.JDBCTemplate.*;

public class MemberDao {
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private Properties prop;

	public MemberDao() {
		try {
			prop = new Properties();

			String filePath = BoardDAO.class.getResource("/APro/sql/member-sql.xml").getPath();

			prop.loadFromXML( new FileInputStream(filePath));

		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	/** 회원가입 DAO
	 * @param conn
	 * @param mem
	 * @return
	 * @throws Exception
	 */
	public int signUp(Connection conn, Member mem) throws Exception{
		int result = 0;
		try {
			String sql = prop.getProperty("signUp");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem.getMemberId());
			pstmt.setString(2, mem.getMemberPw());
			pstmt.setString(3, mem.getMemberName());
			pstmt.setInt(4, mem.getMemberBirth());
			pstmt.setString(5, mem.getMemberEmail());
			pstmt.setString(6, mem.getMemberTel());
			pstmt.setString(7, mem.getMemberNickname());
			pstmt.setString(8, mem.getMemberAddress());
			pstmt.setString(9, mem.getMemberJob());
			pstmt.setString(10, mem.getBusinessNum());
			pstmt.setInt(11, mem.getMemberTypeCode());

			result = pstmt.executeUpdate();

		} finally {
			close(pstmt);
		}

		return result;
	}

	/** 로그인 DAO
	 * @param conn
	 * @param mem
	 * @return
	 */
	public Member login(Connection conn, Member mem , int type) throws Exception{

		Member loginMember = null;

		try {

			String sql = prop.getProperty("login");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem.getMemberId());
			pstmt.setString(2, mem.getMemberPw());
			pstmt.setInt(3, type);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				loginMember = new Member();
				loginMember.setMemberNo(rs.getInt("MEMBER_NO"));
				loginMember.setMemberId(rs.getString("MEMBER_ID"));
				loginMember.setMemberName(rs.getString("MEMBER_NM"));
				loginMember.setMemberBirth(rs.getInt("MEMBER_BIRTH"));
				loginMember.setMemberEmail(rs.getString("MEMBER_EMAIL"));
				loginMember.setMemberNickname(rs.getString("MEMBER_NICK"));
				loginMember.setMemberAddress(rs.getString("MEMBER_ADRR"));
				loginMember.setMemberTel(rs.getString("MEMBER_TEL"));
				loginMember.setMemberJob(rs.getString("MEMBER_JOB"));
				loginMember.setBusinessNum(rs.getString("BUSINESS_NUM"));
				loginMember.setMemberTypeCode(rs.getInt("MEMBER_TYPE_CD"));
				loginMember.setProfileImage(rs.getString("PROFILE_IMGE"));
			}

		} finally {
			close(rs);
			close(pstmt);
		}

		return loginMember;

	}


	/** 회원번호 조회 DAO
	 * @param conn
	 * @param memberId
	 * @return
	 */
	public int selectMemberNo(Connection conn, String memberId) throws Exception {

		int memberNo = 0;

		try {
			String sql = prop.getProperty("selectMemberNo");

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, memberId);

			rs = pstmt.executeQuery();

			if(rs.next()) {
				memberNo = rs.getInt(1);
			}

		}finally {
			close(rs);
			close(stmt);

		}

		return memberNo;
	}

	/** 회원 질의응답 업데이트 DAO
	 * @param conn
	 * @param memberId
	 * @param qa
	 * @return
	 * @throws Exception
	 */
	public int updateQa(Connection conn, int memberNo, MemberQA qa) throws Exception {
		int result = 0;
		String sql = prop.getProperty("updateQa");
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,memberNo);
			pstmt.setString(2,qa.getMemberQ());
			pstmt.setString(3,qa.getMemberA());

			result = pstmt.executeUpdate();


		}finally {
			close(pstmt);

		}
		return result;
	}

	/** 아이디 중복검사 DAO
	 * @param conn
	 * @param memberId
	 * @return
	 */
	public int idDupCheck(Connection conn, String memberId) throws Exception{
		int result = 0;

		String sql = prop.getProperty("idDupCheck");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, memberId);

			rs = pstmt.executeQuery();

			if(rs.next()) {
				result = rs.getInt(1);
			}

		}finally {
			close(rs);
			close(pstmt);

		}
		return result;
	}

	/** 닉네임 중복 검사 DAO
	 * @param conn
	 * @param memberNickname
	 * @return
	 */
	public int nickDupCheck(Connection conn, String memberNickname) throws Exception {
		int result = 0;

		String sql = prop.getProperty("nickDupCheck");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, memberNickname);

			rs = pstmt.executeQuery();

			if(rs.next()) {
				result = rs.getInt(1);
			}

		}finally {
			close(rs);
			close(pstmt);

		}
		return result;
	}

	/** 회원 아이디 찾기 DAO
	 * @param conn
	 * @param memberEail
	 * @param memberTel
	 * @param memberQ
	 * @param memberA
	 * @return
	 */
	public String selectId(Connection conn, String memberEail, String memberTel, String memberQ, String memberA) throws Exception {
		String memberId = null;

		String sql = prop.getProperty("selectId");
		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, memberEail);
			pstmt.setString(2, memberTel);
			pstmt.setString(3, memberQ);
			pstmt.setString(4, memberA);

			rs = pstmt.executeQuery();

			if(rs.next()) {
				memberId = rs.getString(1);
			}

		}finally {
			close(rs);
			close(pstmt);
		}

		return memberId;
	}

	public int selectPw(Connection conn, String memberId, String memberTel, String memberQ, String memberA) throws Exception {

		int result = 0;

		String sql = prop.getProperty("selectPw");
		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, memberId);
			pstmt.setString(2, memberTel);
			pstmt.setString(3, memberQ);
			pstmt.setString(4, memberA);

			rs = pstmt.executeQuery();

			if(rs.next()) {
				result = rs.getInt(1);
			}


		}finally {
			close(rs);
			close(pstmt);
		}


		return result;
	}

	public int changePw(Connection conn, String newPw,int memberNo) throws Exception{
		int result = 0;
		
		String sql = prop.getProperty("changePw");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, newPw);
			pstmt.setInt(2, memberNo);
			
			result = pstmt.executeUpdate();
			
		}finally {
			
			close(pstmt);
		}
		
		return result;
	}

	/** 회원정보 수정 DAO
	 * @param conn
	 * @param mem
	 * @return result
	 * @throws Exception
	 */
	public int updateMyInfo(Connection conn, Member mem) throws Exception {
		int result = 0;
		try {
			String sql = prop.getProperty("updateMyInfo");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem.getMemberNickname());
			pstmt.setString(2, mem.getMemberTel());
			pstmt.setString(3, mem.getMemberAddress());
			pstmt.setString(4, mem.getMemberName());
			pstmt.setString(5, mem.getMemberJob());
			pstmt.setString(6, mem.getMemberEmail());
			pstmt.setInt(7, mem.getMemberNo());
			
			result = pstmt.executeUpdate();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	/** 마이페이지 비밀번호 변경 DAO
	 * @param currentPw
	 * @param newPw
	 * @param memberNo
	 * @param conn
	 * @return
	 * @throws Exception
	 */
	public int MychangePw(String currentPw, String newPw, int memberNo, Connection conn) throws Exception{
int result = 0;
		
		try {
			String sql = prop.getProperty("MychangePw");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPw);
			pstmt.setString(2, currentPw);
			pstmt.setInt(3, memberNo);
			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	/** 회원 탈퇴 DAO
	 * @param conn
	 * @param currentPw
	 * @param memberNo 
	 * @return result
	 * @throws Exception
	 */
	public int memberSecession(Connection conn, String currentPw, int memberNo) throws Exception {
		int result = 0;
		
		try {
			String sql = prop.getProperty("secession");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, currentPw);
			pstmt.setInt(2, memberNo);
			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}
		return result;
	}
}





