package APro.main.model.dao;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import APro.board.dao.BoardDAO;
import APro.main.model.vo.HotPost;

import static APro.common.JDBCTemplate.*;

public class MainDAO {
	
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Properties prop;
	
	public MainDAO() {
		try {
			prop = new Properties();
			
			String filePath = BoardDAO.class.getResource("/APro/sql/main-sql.xml").getPath();
			
			prop.loadFromXML( new FileInputStream(filePath));
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	/**HotPost 조회 DAO
	 * @param conn
	 * @param type
	 * @return list
	 * @throws Exception
	 */
	public List<HotPost> getHotPost(Connection conn, int type) throws Exception {
		List<HotPost> list = new ArrayList<>();
		
		try {
			String sql = prop.getProperty("getHotPost");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, type);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				HotPost h = new HotPost();
				h.setBoardNo(rs.getInt("BOARD_NO"));
				h.setBoardTitle(rs.getString("BOARD_TITLE"));
				h.setBoardContent(rs.getString("BOARD_CONTENT"));
				h.setBoardImage(rs.getString("POST_IMAGE"));
				h.setMemberNickname(rs.getString("MEMBER_NICK"));
				h.setProfileImage(rs.getString("PROFILE_IMGE"));
				
				list.add(h);
			}
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}


}
