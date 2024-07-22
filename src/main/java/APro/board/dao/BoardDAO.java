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


import APro.board.vo.BoardDetail;


import APro.board.vo.Board;
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

	/**카테고리 게시판 게시글 수 조회
	 * @param conn
	 * @param cate
	 * @return listCount
	 * @throws Exception
	 */
	public int getListCount(Connection conn, int cate) throws Exception {
		int listCount = 0;
		
		try {
			String sql = prop.getProperty("getListCountCate");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cate);
			
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


	/**게시판 전체 게시글 수 조회
	 * @param type
	 * @param conn
	 * @return listCount
	 * @throws Exception
	 */
	public int getListCount(int type, Connection conn) throws Exception {
		int listCount = 0;
		
		try {
			String sql = prop.getProperty("getListCount");
			
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

	/** 카테고리 게시물 목록 조회
	 * @param conn
	 * @param cate
	 * @param pagination
	 * @return boardList
	 * @throws Exception
	 */
	public List<Board> selectBoardList(Connection conn, int cate, Pagination pagination) throws Exception {
		List<Board> boardList = new ArrayList<>();
		
		try {
			String sql = prop.getProperty("selectCategoryList");
			
			// between 구문에 들어갈 범위 계산
			int start = (pagination.getCurrentPage() - 1) * pagination.getLimit() + 1;
			int end = start + pagination.getLimit() - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cate);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
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

	/** 게시판 전체 조회 목록
	 * @param conn
	 * @param pagination
	 * @param type
	 * @return boardList
	 * @throws Exception
	 */
	public List<Board> selectBoardList(Connection conn, Pagination pagination, int type) throws Exception {
		List<Board> boardList = new ArrayList<>();
		
		try {
			String sql = prop.getProperty("selectBoardList");
			
			// between 구문에 들어갈 범위 계산
			int start = (pagination.getCurrentPage() - 1) * pagination.getLimit() + 1;
			int end = start + pagination.getLimit() - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, type);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
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

	/**카테고리 제목 검색 수 DAO
	 * @param conn
	 * @param all
	 * @param all 
	 * @param search
	 * @param standard 
	 * @return listCount
	 * @throws Exception
	 */
	public int getSearchListCount(Connection conn, int board, int all, String search, String standard) throws Exception {
		int listCount = 0;
		System.out.println(search);
		try {
			String sql = null;
			if(all == 0) {
				switch(standard) {
				case "title" : sql = prop.getProperty("searchTitleAll"); break;
				case "writer" : sql = prop.getProperty("searchWriterAll"); break;
				case "content" : sql = prop.getProperty("searchContentAll"); break;
				}
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, board);
				pstmt.setString(2, search);
				
			}else {
				switch(standard) {
				case "title" : sql = prop.getProperty("searchTitle"); break;
				case "writer" : sql = prop.getProperty("searchWriter"); break;
				case "content" : sql = prop.getProperty("searchContent"); break;
				}
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, all);
				pstmt.setString(2, search);
			}
			
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

	/**검색 게시물 목록 조회 DAO
	 * @param conn
	 * @param all
	 * @param all 
	 * @param search
	 * @param pagination
	 * @param standard 
	 * @return list
	 * @throws Exception
	 */
	public List<Board> searchBoardList(Connection conn, int board, int all, String search, Pagination pagination, String standard) throws Exception {
		List<Board> list = new ArrayList<>();
		
		try {
			String sql = null;
			
			int start = (pagination.getCurrentPage() - 1) * pagination.getLimit() + 1;
			int end = start + pagination.getLimit() - 1;
			
			if(all == 0) {
				switch(standard) {
				case "title" : sql = prop.getProperty("searchListTitleAll"); break;
				case "writer" : sql = prop.getProperty("searchListWriterAll"); break;
				case "content" : sql = prop.getProperty("searchListConAll"); break;
				}
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, board);
				pstmt.setString(2, search);
				pstmt.setInt(3, start);
				pstmt.setInt(4, end);
			}else {
				switch(standard) {
				case "title" : sql = prop.getProperty("searchListTitle"); break;
				case "writer" : sql = prop.getProperty("searchListWriter"); break;
				case "content" : sql = prop.getProperty("searchListCon"); break;
				}
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, all);
				pstmt.setString(2, search);
				pstmt.setInt(3, start);
				pstmt.setInt(4, end);
			}
			
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
