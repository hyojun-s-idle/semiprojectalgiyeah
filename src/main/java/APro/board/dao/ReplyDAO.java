package APro.board.dao;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import APro.board.vo.Reply;
import static APro.common.JDBCTemplate.*;

public class ReplyDAO {
	
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Properties prop;
	
	public ReplyDAO() {
		try {
			prop = new Properties();
			String filePath = BoardDAO.class.getResource("/APro/sql/reply-sql.xml").getPath();
			prop.loadFromXML( new FileInputStream(filePath));
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public List<Reply> selectReplyList(Connection conn, int boardNo) throws Exception{

		List<Reply> rlist = new ArrayList<>();

		
		try {

			String sql = prop.getProperty("selectReplyList");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				Reply reply = new Reply();

				reply.setReplyNo(rs.getInt("REPLY_NO"));
				reply.setReplyContent(rs.getString("REPLY_CONTENT"));
				reply.setCreateDate(rs.getNString("CREATE_DATE"));
				reply.setUpdateDate(rs.getNString("UPDATE_DATE"));
				reply.setBoardNo(rs.getInt("BOARD_NO"));
				reply.setMemberNo(rs.getInt("MEMBER_NO"));
				reply.setMemberNickname(rs.getNString("MEMBER_NICK"));
				reply.setProfileImage(rs.getString("PROFILE_IMGE"));

				rlist.add(reply);
			}
		} finally {
			close(rs);
			close(pstmt);
		}
		return rlist;
	}
	
	
	
	
	
	
	
	
	

}
