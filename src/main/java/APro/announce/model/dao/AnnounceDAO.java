package APro.announce.model.dao;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import APro.announce.model.vo.AnBoardDetail;
import APro.announce.model.vo.AnReply;
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

	/**게시물 상제 조회 DAO
	 * @param conn
	 * @param no
	 * @return detail
	 * @throws Exception
	 */
	public AnBoardDetail getBoardDetail(Connection conn, int no) throws Exception {
		AnBoardDetail detail = null;
		
		try {
			String sql = prop.getProperty("getBoardDetail");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				detail = new AnBoardDetail();
				detail.setBoardNo(rs.getInt("BOARD_NO"));
				detail.setBoardTitle(rs.getString("BOARD_TITLE"));
				detail.setBoardContent(rs.getString("BOARD_CONTENT"));
				detail.setCreateDate(rs.getString("CREATE_DT"));
				detail.setUpdateDate(rs.getString("UPDATE_DT"));
				detail.setProfileImage(rs.getString("PROFILE_IMGE"));
				detail.setMemberNickname(rs.getString("MEMBER_NICK"));
				detail.setReadCount(rs.getInt("READ_COUNT"));
				detail.setMemberNo( rs.getInt("MEMBER_NO"));
			}
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return detail;
	}

	/**조회수 증가 DAO
	 * @param conn
	 * @param no
	 * @return result
	 * @throws Exception
	 */
	public int setReadCount(Connection conn, int no) throws Exception {
		int result = 0;
		
		try {
			String sql = prop.getProperty("setReadCount");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	/**게시물 댓글 조회 DAO
	 * @param conn
	 * @param no
	 * @return list
	 * @throws Exception
	 */
	public List<AnReply> getReplyList(Connection conn, int no) throws Exception {
		List<AnReply> list = new ArrayList<>();
		
		try {
			String sql = prop.getProperty("replyList");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AnReply r = new AnReply();
				r.setReplyNo(rs.getInt("REPLY_NO"));
				r.setReplyContent(rs.getString("REPLY_CONTENT"));
				r.setCreateDate(rs.getString("CREATE_DT"));
				r.setMemberNickname(rs.getString("MEMBER_NICK"));
				r.setMemberNo(rs.getInt("MEMBER_NO"));
				r.setProfileImage(rs.getString("PROFILE_IMGE"));
				r.setUpdateDate(rs.getString("UPDATE_DT"));
				
				list.add(r);
			}
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	/**게시물 수정 DAO
	 * @param conn
	 * @param detail
	 * @return result
	 * @throws Exception
	 */
	public int updatePost(Connection conn, AnBoardDetail detail) throws Exception {
		int result = 0;
		
		try {
			String sql = prop.getProperty("updatePost");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, detail.getBoardTitle());
			pstmt.setString(2, detail.getBoardContent());
			pstmt.setInt(3, detail.getBoardNo());
			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	/**게시물 삭제 DAO
	 * @param conn
	 * @param type
	 * @param no
	 * @return result
	 * @throws Exception
	 */
	public int deletePost(Connection conn, int type, int no) throws Exception {
		int result = 0;
		
		try {
			String sql = prop.getProperty("deletePost");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setInt(2, type);
			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	/**게시물 등록 DAO
	 * @param conn
	 * @param detail
	 * @param type
	 * @return result 
	 * @throws Exception
	 */
	public int insertPost(Connection conn, AnBoardDetail detail, int type) throws Exception {
		int result = 0;
		
		try {
			String sql = prop.getProperty("insertPost");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, detail.getBoardTitle());
			pstmt.setString(2, detail.getBoardContent());
			pstmt.setInt(3, detail.getMemberNo());
			pstmt.setInt(4, type);
			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	/**공지사항 게시물 검색 수 조회
	 * @param conn
	 * @param type
	 * @param condition
	 * @return listCount
	 * @throws Exception
	 */
	public int getBoardListCount(Connection conn, int type, String condition) throws Exception {
		int listCount = 0;
		
		try {
			String sql = prop.getProperty("searchListCount") + condition;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, type);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return listCount;
	}

	/**공지사항 게시물 검색 목록 조회 DAO
	 * @param conn
	 * @param condition
	 * @param pagination
	 * @param type
	 * @return list
	 */
	public List<AnnounceBoard> searchBoardList(Connection conn, String condition, Pagination pagination, int type) throws Exception {
		List<AnnounceBoard> list = new ArrayList<>();
		
		try {
			String sql = prop.getProperty("searchBoardList1") + condition + prop.getProperty("searchBoardList2");
			
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
				
				list.add(b);
			}
			
		}catch(Exception e) {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

}
