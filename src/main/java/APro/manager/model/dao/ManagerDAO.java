package APro.manager.model.dao;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import APro.board.dao.BoardDAO;
import APro.board.vo.Pagination;
import APro.manager.model.vo.ManComment;
import APro.manager.model.vo.ManCommentDetail;
import APro.manager.model.vo.ManMember;
import APro.manager.model.vo.ManPost;
import APro.manager.model.vo.ManPostDetail;
import APro.manager.model.vo.ReportReson;

import static APro.common.JDBCTemplate.*;

public class ManagerDAO {
	
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Properties prop;
	
	public ManagerDAO() {
		try {
			prop = new Properties();
			
			String filePath = BoardDAO.class.getResource("/APro/sql/manager-sql.xml").getPath();
			
			prop.loadFromXML( new FileInputStream(filePath));
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	/**신고 댓글 수 조회 DAO
	 * @param conn
	 * @return listCount
	 * @throws Exception
	 */
	public int getCommentListCount(Connection conn) throws Exception {
		int listCount = 0;
		
		try {
			String sql = prop.getProperty("CountComment");
			
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return listCount;
	}

	/**신고 댓글 목록 조회
	 * @param conn
	 * @param patination
	 * @return list
	 * @throws Exception
	 */
	public List<ManComment> getCommentList(Connection conn, Pagination pagination) throws Exception {
		List<ManComment> list = new ArrayList<>();
		
		try {
			String sql = prop.getProperty("commentList");
			
			int start = (pagination.getCurrentPage() - 1) * pagination.getLimit() + 1;
			int end = start + pagination.getLimit() - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ManComment com = new ManComment();
			
				com.setBoardTitle(rs.getString("BOARD_TITLE"));
				com.setBoardType(rs.getString("PR_BOARD"));
				com.setCategory(rs.getString("CATEGORY"));
				com.setBoardNo(rs.getInt("BOARD_NO"));
				com.setReplyNo(rs.getInt("REPLY_NO"));
				com.setReportCount(rs.getInt("RCOUNT"));
				com.setCommentContent(rs.getString("REPLY_CONTENT"));
				com.setMemberNickname(rs.getString("MEMBER_NICK"));
				com.setMemberType(rs.getString("MEMBER_TYPE_NM"));
				com.setCreateDate(rs.getString("CREATE_DT"));
				com.setUpdateDate(rs.getString("UPDATE_DT"));
				
				list.add(com);
				
			}
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	/**신고 게시물 수 DAO
	 * @param conn
	 * @return listCount
	 * @throws Exception
	 */
	public int getPostListCount(Connection conn) throws Exception {
		int listCount = 0;
		
		try {
			String sql = prop.getProperty("postCount");
			
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
			
		}finally {
			close(rs);
			close(stmt);
		}
		
		return listCount;
	}

	/**신고 게시판 목록 조회
	 * @param conn
	 * @param pagination
	 * @return list
	 * @throws Exception
	 */
	public List<ManPost> getPostList(Connection conn, Pagination pagination) throws Exception {
		List<ManPost> list = new ArrayList<>();
		
		try {
			String sql = prop.getProperty("postList");
			
			int start = (pagination.getCurrentPage() - 1) * pagination.getLimit() + 1;
			int end = start + pagination.getLimit() - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
				
			while(rs.next()) {
				ManPost p = new ManPost();
				
				p.setBoardNo(rs.getInt("BOARD_NO"));
				p.setBoardTitle(rs.getString("BOARD_TITLE"));
				p.setBoardContent(rs.getString("BOARD_CONTENT"));
				p.setBoardType(rs.getString("PR_BOARD"));
				p.setCategory(rs.getString("CATEGORY"));
				p.setMemberNickname(rs.getString("MEMBER_NICK"));
				p.setMemberType(rs.getString("MEMBER_TYPE_NM"));
				p.setReportCount(rs.getInt("RCOUNT"));
				p.setCreateDate(rs.getString("CREATE_DT"));
				p.setUpdateDate(rs.getString("UPDATE_DT"));
				
				list.add(p);
				
			}
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	/**신고 댓글 상세 조회 DAO
	 * @param conn
	 * @param replyNo
	 * @return
	 */
	public ManCommentDetail getCommentDetail(Connection conn, int replyNo) throws Exception {
		ManCommentDetail com = null;
		
		try {
			String sql = prop.getProperty("commentDetail");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, replyNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				com = new ManCommentDetail();
				
				com.setBoardNo(rs.getInt("BOARD_NO"));
				com.setCategory(rs.getString("CATEGORY"));
				com.setBoardType(rs.getString("PR_BOARD"));
				com.setMemberNickname(rs.getString("MEMBER_NICK"));
				com.setMemberType(rs.getString("MEMBER_TYPE_NM"));
				com.setReplyCount(rs.getInt("RCOUNT"));
				com.setReplyNo(rs.getInt("REPLY_NO"));
				com.setCommentContent(rs.getString("REPLY_CONTENT"));
				com.setCreateDate(rs.getString("CREATE_DT"));
				com.setUpdateString(rs.getString("UPDATE_DT"));
			}
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return com;
	}

	/** 신고 댓글 사유 목록 조회 DAO
	 * @param conn
	 * @param replyNo
	 * @param reportType
	 * @return rList
	 * @throws Exception
	 */
	public List<ReportReson> getReportReson(Connection conn, int replyNo) throws Exception {
		List<ReportReson> rList = new ArrayList<>();
		
		try {
			String sql = prop.getProperty("commentReson");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, replyNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReportReson r = new ReportReson();
				
				r.setResonReport(rs.getString(1));
				r.setReportDate(rs.getString(2));
				
				rList.add(r);
						
			}
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return rList;
	}

	/**신고 게시판 상세 조회 DAO
	 * @param conn 
	 * @param boardNo
	 * @return detail
	 * @throws Exception
	 */
	public ManPostDetail getPostDetail(Connection conn, int boardNo) throws Exception {
		ManPostDetail detail = null;
		
		try {
			String sql = prop.getProperty("postDetail");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				detail = new ManPostDetail();
				
				detail.setBoardNo(rs.getInt("BOARD_NO"));
				detail.setBoardTitle(rs.getString("BOARD_TITLE"));
				detail.setBoardContent(rs.getString("BOARD_CONTENT"));
				detail.setCategory(rs.getString("CATEGORY"));
				detail.setBoardType(rs.getString("PR_BOARD"));
				detail.setMemberNickname(rs.getString("MEMBER_NICK"));
				detail.setMemberType(rs.getString("MEMBER_TYPE_NM"));
				detail.setReportCount(rs.getInt("RCOUNT"));
				detail.setCreateDate(rs.getString("CREATE_DT"));
				detail.setUpdateDate(rs.getString("UPDATE_DT"));
			}
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return detail;
	}

	/**신고 게시판 신고 사유 목록 조회 DAO
	 * @param conn
	 * @param boardNo
	 * @return rList
	 * @throws Exception
	 */
	public List<ReportReson> getReportResonPost(Connection conn, int boardNo) throws Exception {
		List<ReportReson> rList = new ArrayList<>();
		
		try {
			String sql = prop.getProperty("postReson");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReportReson r = new ReportReson();
				r.setResonReport(rs.getString(1));
				r.setReportDate(rs.getString(2));
				
				rList.add(r);
			}
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return rList;
	}

	/**회원수 조회 DAO
	 * @param conn
	 * @return listCount
	 * @throws Exception
	 */
	public int getMemberCount(Connection conn) throws Exception {
		int listCount = 0;
		
		try {
			String sql = prop.getProperty("memberCount");
			
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
			
		}finally {
			close(rs);
			close(stmt);
		}
		
		return listCount;
	}

	/**회원 목록 조회 DAO
	 * @param conn
	 * @param pagination
	 * @return list
	 * @throws Exception
	 */
	public List<ManMember> getMemberList(Connection conn, Pagination pagination) throws Exception {
		List<ManMember> list = new ArrayList<>();
		
		try {
			String sql = prop.getProperty("memberList");
			
			int start = (pagination.getCurrentPage() - 1) * pagination.getLimit() + 1;
			int end = start + pagination.getLimit() - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ManMember m = new ManMember();
				
				m.setMemberNo(rs.getInt("MEMBER_NO"));
				m.setMemberId(rs.getString("MEMBER_ID"));
				m.setMemberType(rs.getString("MEMBER_TYPE_NM"));
				m.setMemberName(rs.getString("MEMBER_NM"));
				m.setMemberNickname(rs.getString("MEMBER_NICK"));
				m.setMemberTel(rs.getString("MEMBER_TEL"));
				m.setMemberEmail(rs.getString("MEMBER_EMAIL"));
				m.setMemberAddress(rs.getString("MEMBER_ADRR"));
				m.setBussinessNum(rs.getString("BUSINESS_NUM"));
				m.setSecessionFl(rs.getString("SECESSION_FL").toUpperCase().charAt(0));
				
				list.add(m);
				
			}
		}finally {
			close(rs);
			close(stmt);
		}
		
		return list;
	}

	/**검색 회원 수 조회 DAO
	 * @param conn
	 * @param condition
	 * @return listCount
	 * @throws Exception
	 */
	public int getSearchCount(Connection conn, String condition) throws Exception {
		int listCount = 0;
		
		try {
			String sql = prop.getProperty("searchCount") + condition;
			
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
			
		}finally {
			close(rs);
			close(stmt);
		}
		
		return listCount;
	}

	/**회원 검색 목록 조회 DAO
	 * @param conn
	 * @param condition
	 * @param pagination
	 * @return list
	 * @throws Exception
	 */
	public List<ManMember> getSearchList(Connection conn, String condition, Pagination pagination) throws Exception {
		List<ManMember> list = new ArrayList<>();
		
		try {
			String sql = prop.getProperty("memberSearchList1") + condition + prop.getProperty("memberSearchList2");
			
			int start = (pagination.getCurrentPage() - 1) * pagination.getLimit() + 1;
			int end = start + pagination.getLimit() - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ManMember m = new ManMember();
				
				m.setMemberNo(rs.getInt("MEMBER_NO"));
				m.setMemberId(rs.getString("MEMBER_ID"));
				m.setMemberType(rs.getString("MEMBER_TYPE_NM"));
				m.setMemberName(rs.getString("MEMBER_NM"));
				m.setMemberNickname(rs.getString("MEMBER_NICK"));
				m.setMemberTel(rs.getString("MEMBER_TEL"));
				m.setMemberEmail(rs.getString("MEMBER_EMAIL"));
				m.setMemberAddress(rs.getString("MEMBER_ADRR"));
				m.setBussinessNum(rs.getString("BUSINESS_NUM"));
				m.setSecessionFl(rs.getString("SECESSION_FL").toUpperCase().charAt(0));
				
				list.add(m);
			}
			
		}finally {
			close(rs);
			close(stmt);
		}
		
		return list;
	}

	/** 신고 댓글 검색 수 조회 DAO
	 * @param conn
	 * @param condition1
	 * @return listCount
	 * @throws Exception
	 */
	public int getSearchCommentCount(Connection conn, String condition1) throws Exception {
		int listCount = 0;
		
		try {
			String sql = prop.getProperty("searchCommentCount") + condition1 +" )";
			
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
			
		}finally {
			close(rs);
			close(stmt);
		}
		
		return listCount;
	}

	/**신고 댓글 검색 목록 조회 DAO
	 * @param conn
	 * @param pagination
	 * @param condition1
	 * @return list
	 * @throws Exception
	 */
	public List<ManComment> getSearchCommentList(Connection conn, Pagination pagination, String condition1) throws Exception {
		
		List<ManComment> list = new ArrayList<>();
		
		try {
			String sql = prop.getProperty("commentSearchList1") + condition1 + prop.getProperty("commentSearchList2");
			
			int start = (pagination.getCurrentPage() - 1) * pagination.getLimit() + 1;
			int end = start + pagination.getLimit() - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ManComment com = new ManComment();
			
				com.setBoardTitle(rs.getString("BOARD_TITLE"));
				com.setBoardType(rs.getString("PR_BOARD"));
				com.setCategory(rs.getString("CATEGORY"));
				com.setBoardNo(rs.getInt("BOARD_NO"));
				com.setReplyNo(rs.getInt("REPLY_NO"));
				com.setReportCount(rs.getInt("RCOUNT"));
				com.setCommentContent(rs.getString("REPLY_CONTENT"));
				com.setMemberNickname(rs.getString("MEMBER_NICK"));
				com.setMemberType(rs.getString("MEMBER_TYPE_NM"));
				com.setCreateDate(rs.getString("CREATE_DT"));
				com.setUpdateDate(rs.getString("UPDATE_DT"));
				
				list.add(com);
				
			}
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	/** 신고 게시판 검색 수 조회 DAO
	 * @param conn
	 * @param condition
	 * @return listCount
	 * @throws Exception
	 */
	public int getPostSearchCount(Connection conn, String condition) throws Exception {
		int listCount = 0;
		
		try {
			String sql = prop.getProperty("postSearchCount") + condition + ")";
			
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
					
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
			
		}finally {
			close(rs);
			close(stmt);
		}
		
		return listCount;
	}

	/** 신고 게시판 검색 조회 목록
	 * @param conn
	 * @param condition
	 * @param pagination
	 * @return list
	 * @throws Exception
	 */
	public List<ManPost> getPostSearchDetail(Connection conn, String condition, Pagination pagination) throws Exception {
		List<ManPost> list = new ArrayList<>();
		
		try {
			String sql = prop.getProperty("postSearchList1") + condition + prop.getProperty("postSearchList2");
			
			int start = (pagination.getCurrentPage() - 1) * pagination.getLimit() + 1;
			int end = start + pagination.getLimit() - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
				
			while(rs.next()) {
				ManPost p = new ManPost();
				
				p.setBoardNo(rs.getInt("BOARD_NO"));
				p.setBoardTitle(rs.getString("BOARD_TITLE"));
				p.setBoardContent(rs.getString("BOARD_CONTENT"));
				p.setBoardType(rs.getString("PR_BOARD"));
				p.setCategory(rs.getString("CATEGORY"));
				p.setMemberNickname(rs.getString("MEMBER_NICK"));
				p.setMemberType(rs.getString("MEMBER_TYPE_NM"));
				p.setReportCount(rs.getInt("RCOUNT"));
				p.setCreateDate(rs.getString("CREATE_DT"));
				p.setUpdateDate(rs.getString("UPDATE_DT"));
				
				list.add(p);
				
			}
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	/** 신고 댓글 삭제 DAO
	 * @param conn
	 * @param boardNo
	 * @param replyNo
	 * @return result
	 * @throws Exception
	 */
	public int deleteComment(Connection conn, int deleteNo) throws Exception {
		int result = 0;
		
		try {
			String sql = prop.getProperty("deleteComment");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, deleteNo);
			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	/**신고 게시판 삭제 DAO
	 * @param conn
	 * @param deleteNo
	 * @return result
	 * @throws Exception
	 */
	public int deletePost(Connection conn, int deleteNo) throws Exception {
		int result = 0;
		
		try {
			String sql = prop.getProperty("deletePost");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, deleteNo);
			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	/**신고 게시판 삭제 안에 댓글 삭제 DAO
	 * @param conn
	 * @param deleteNo
	 * @return result
	 * @throws Exception
	 */
	public int deletePostComment(Connection conn, int deleteNo) throws Exception {
		int result = 0;
		
		try {
			String sql = prop.getProperty("deletePostComment");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, deleteNo);
			
			result = pstmt.executeUpdate();
			
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	/**게시판 댓글 수 확인 DAO
	 * @param conn
	 * @param deleteNo
	 * @return replCount
	 * @throws Exeption
	 */
	public int countComment(Connection conn, int deleteNo) throws Exception {
		int replyCount = 0;
		
		try {
			String sql = prop.getProperty("countComment");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, deleteNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				replyCount = rs.getInt(1);
			}
					
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return replyCount;
	}

}
