package APro.board.dao;

import static APro.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;




import APro.board.vo.Board;
import APro.board.vo.BoardDetail;
import APro.board.vo.Category;
import APro.board.vo.Pagination;


/**
 * @author shy62
 *
 */
public class BoardDAO {
	
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Properties prop;
	
	public BoardDAO() {
		try {
			prop = new Properties();
			
			String filePath = BoardDAO.class.getResource("/APro/sql/board-sql.xml").getPath();
			
			prop.loadFromXML( new FileInputStream(filePath));
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
	

	
	/** 게시판 이름 가져오기 DAO
	 * @param conn
	 * @param type
	 * @return boardName
	 * @throws Exception
	 */
	public String selectBoardName(Connection conn, int type) throws Exception {
		String boardName = null;
		
		try {
			String sql = prop.getProperty("selectBoardName");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, type);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				boardName = rs.getString(1);
			}
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return boardName;
	}

	/** 공지사항 게시물 수 조회 DAO
	 * @param conn
	 * @param condition
	 * @return listCount
	 * @throws Exception
	 */
	public int getListCount(Connection conn, String condition) throws Exception {
		int listCount = 0;
		
		try {
			String sql = prop.getProperty("getListCountCate") + condition;
			
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



	/**게시판 카테고리 조회
	 * @param conn
	 * @param cate
	 * @return category
	 * @throws Exception
	 */
	public List<Category> selectCategory(Connection conn) throws Exception {
		List<Category> category = new ArrayList<>();
		
		try {
			String sql = prop.getProperty("selectCategoryAll");
			
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				Category c = new Category( rs.getInt(1), rs.getString(2), rs.getInt(3));
				category.add(c);			}
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return category;
	}

	/** 게시물 목록 조회 DAO
	 * @param conn
	 * @param condition
	 * @param pagination
	 * @return boardList
	 * @throws Exception
	 */
	public List<Board> selectBoardList(Connection conn, String condition, Pagination pagination) throws Exception {
		List<Board> boardList = new ArrayList<>();
		
		try {
			String sql = prop.getProperty("selectCategoryList1") + condition + prop.getProperty("selectCategoryList2");
			
			// between 구문에 들어갈 범위 계산
			int start = (pagination.getCurrentPage() - 1) * pagination.getLimit() + 1;
			int end = start + pagination.getLimit() - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board b = new Board( rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8) );
				
				boardList.add(b);
			}
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return boardList;
	}


	/**게시물 검색 수 DAO
	 * @param conn
	 * @param all 
	 * @param search
	 * @param standard 
	 * @return listCount
	 * @throws Exception
	 */
	public int getSearchListCount(Connection conn, String condition, String standard) throws Exception {
		int listCount = 0;
		try {
			String sql = prop.getProperty("searchBoardCount") + condition;
			
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

	/**검색 게시물 목록 조회 DAO
	 * @param conn
	 * @param all 
	 * @param search
	 * @param pagination
	 * @return list
	 * @throws Exception
	 */
	public List<Board> searchBoardList(Connection conn, String condition, Pagination pagination) throws Exception {
		List<Board> list = new ArrayList<>();
		
		try {
			String sql = prop.getProperty("searchBoardList1") + condition + prop.getProperty("searchBoardList2");
			
			int start = (pagination.getCurrentPage() - 1) * pagination.getLimit() + 1;
			int end = start + pagination.getLimit() - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board b = new Board( rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8) );
				
				list.add(b);
			}
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		return list;
	}



}
