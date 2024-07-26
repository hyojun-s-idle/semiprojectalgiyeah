package APro.member.model.service;

import java.sql.Connection;
import static APro.common.JDBCTemplate.*;
import APro.member.model.dao.MemberDao;
import APro.member.model.vo.Member;
import APro.member.model.vo.MemberQA;

/**
 * @author tjdgns
 *
 */
public class MemberService {
	
	private MemberDao dao=new MemberDao();

	/** 회원가입 service
	 * @param mem
	 * @param qa
	 * @return
	 * @throws Exception
	 */
	public int signUp(Member mem) throws Exception {
		
		Connection conn = getConnection();
		
		
		int result=dao.signUp(conn,mem);
		
		//트랜잭션처리
		if(result>0) commit(conn);
		else rollback(conn);
		
		//Connection반환(DBCP로 돌려주기)
		close(conn);
		return result;
	}
	


	/** 로그인 service
	 * @param mem
	 * @return
	 */
	public Member login(Member mem , int type) throws Exception{
		Connection conn=getConnection();
		Member loginMember=dao.login(conn,mem,type);
		close(conn);
		return loginMember;
	}



	/** 회원 질의응답 업데이트 service
	 * @param memberId
	 * @param qa
	 * @return
	 */
	public int updateQa(String memberId, MemberQA qa) throws Exception {
		Connection conn = getConnection();
		
		int memberNo = dao.selectMemberNo(conn,memberId);
		
		int result = dao.updateQa(conn, memberNo, qa);
		
		
		
		
		if(result>0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}



	/** 아이디 중복 검사 Service
	 * @param memberId
	 * @return
	 */
	public int idDupCheck(String memberId) throws Exception {
		int result = 0;
		
		Connection conn = getConnection();
		
		result = dao.idDupCheck(conn, memberId);
		
		close(conn);
		
		return result;
	}



	/** 닉네임 중복 검사 Service
	 * @param memberNickname
	 * @return
	 * @throws Exception
	 */
	public int nickDupCheck(String memberNickname) throws Exception {
		
		int result = 0;
		
		Connection conn = getConnection();
		
		result = dao.nickDupCheck(conn, memberNickname);
		
		close(conn);
		
		return result;
	}



	/** 아이디 찾기 Service
	 * @param memberEail
	 * @param memberTel
	 * @param memberQ
	 * @param memberA
	 * @return
	 */
	public String selectId(String memberEail, String memberTel, String memberQ, String memberA) throws Exception {
		String memberId = null;
		
		Connection conn = getConnection();
		
		
		memberId = dao.selectId(conn, memberEail , memberTel, memberQ , memberA);
		
		close(conn);
		
		
		return memberId;
	}



	/** 비밀번호 찾기 Service
	 * @param memberId
	 * @param memberTel
	 * @param memberQ
	 * @param memberA
	 * @return
	 */
	public int selectPw(String memberId, String memberTel, String memberQ, String memberA) throws Exception {
		int result = 0;
		
		Connection conn = getConnection();
		
		result = dao.selectPw(conn, memberId,memberTel,memberQ,memberA);
		
		close(conn);
		
		return result;
	}


	
	/** 비밀번호 변경 Service
	 * @param newPw
	 * @return
	 */
	public int changePw(String newPw, String memberId)  throws Exception{
		int result = 0;
		
		Connection conn = getConnection();
		
		int memberNo = dao.selectMemberNo(conn,memberId); // 멤버 번호찾는 DAO
		
		result = dao.changePw(conn,newPw,memberNo);
		

		if(result>0) commit(conn);
		else rollback(conn);
		
		return result;
	}

	
}






