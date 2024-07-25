package APro.announce.model.dao;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import APro.announce.model.vo.Reply;

import static APro.common.JDBCTemplate.*;

public class ReplyDAO {
	
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Properties prop;
	
	public ReplyDAO() {
		try {
			prop = new Properties();
			
			String filePath = ReplyDAO.class.getResource("/APro/sql/anReply-sql.xml").getPath();
			
			prop.loadFromXML(new FileInputStream(filePath));
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	/** 댓글 목록 조회 DAO
	 * @param conn
	 * @param boardNo
	 * @return replyList
	 * @throws Exception
	 */
	public List<Reply> selectReplyList(Connection conn, int boardNo) throws Exception {
		
		List<Reply> replyList = new ArrayList<>();
		
		try {
			String sql = prop.getProperty("selectReplyList");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Reply reply = new Reply();
				reply.setReplyNo( rs.getInt("REPLY_NO"));
				reply.setReplyContent( rs.getString("REPLY_CONTENT"));
				reply.setCreateDate( rs.getString("CREATE_DT"));
				reply.setBoardNo( rs.getInt("BOARD_NO"));
				reply.setMemberNo( rs.getInt("MEMBER_NO"));
				reply.setMemberNickname( rs.getString("MEMBER_NICK"));
				reply.setProfileImage( rs.getString("PROFILE_IMGE"));
				reply.setUpdateDate(rs.getString("UPDATE_DT"));
				
				replyList.add(reply);
			}
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		return replyList;
	}

	/** 댓글 등록 DAO
	 * @param r
	 * @param conn
	 * @return return
	 * @throws Exception
	 */
	public int insertReply(Reply r, Connection conn) throws Exception {
		int result = 0;
		
		try {
			String sql = prop.getProperty("insertReply");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getReplyContent());
			pstmt.setInt(2, r.getBoardNo());
			pstmt.setInt(3, r.getMemberNo());
			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
			
		}
		
		return result;
	}

	/** 댓글 삭제 DAO
	 * @param conn
	 * @param replyNo
	 * @return result
	 * @throws Exception
	 */
	public int deleteReply(Connection conn, int replyNo) throws Exception {
		int result = 0;
		
		try {
			String sql = prop.getProperty("deleteReply");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, replyNo);

			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	/**댓글 수정 DAO
	 * @param conn
	 * @param rep
	 * @return result
	 * @throws Exception
	 */
	public int updateReply(Connection conn, int replyNo, String content) throws Exception {
		int result = 0;
		
		try {
			String sql = prop.getProperty("updateReply");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setInt(2, replyNo);
			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	

}
