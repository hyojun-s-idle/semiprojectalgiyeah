package APro.announce.model.dao;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import APro.announce.model.vo.AnnounceBoard;
import APro.board.vo.Pagination;

import static APro.common.JDBCTemplate.*;


public class AnnounceDAO {
	
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Properties prop;
	
	public AnnounceDAO() {
		try {
			prop = new Properties();
			
			String filePath = AnnounceDAO.class.getResource("/APro/sql/announce-sql.xml").getPath();
			
			prop.loadFromXML( new FileInputStream(filePath));
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	/**게시물 수 조회 DAO
	 * @param conn
	 * @param type
	 * @return count
	 * @throws Exception
	 */
	public int getListCount(Connection conn, int type) throws Exception {
		int count = 0;
		
		try {
			String sql = prop.getProperty("listCount");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, type);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return count;
	}

	/**게시글 목록 조회
	 * @param conn
	 * @param type
	 * @param pagination
	 * @return boardList
	 * @throws Exception
	 */
	public List<AnnounceBoard> getBoardList(Connection conn, int type, Pagination pagination) throws Exception {
		List<AnnounceBoard> boardList = new ArrayList<>();
		
		try {
			String sql = prop.getProperty("boardList");
			
			int start = (pagination.getCurrentPage() - 1) * pagination.getLimit() + 1;
			int end = start + pagination.getLimit() - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, type);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AnnounceBoard b = new AnnounceBoard(rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8));
				
				boardList.add(b);
			}
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return boardList;
	}

}
