package APro.board.dao;

import static APro.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;


import APro.board.vo.BoardDetail;


import APro.board.vo.Board;
import APro.board.vo.Category;
import APro.board.vo.Pagination;


/**
 * @author kis
 *
 */
public class BoardWriteDAO {

	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Properties prop;
	
	public BoardWriteDAO() {
		try {
			prop = new Properties();
			String filePath = BoardDAO.class.getResource("/APro/sql/boardWrite-sql.xml").getPath();
			prop.loadFromXML( new FileInputStream(filePath));
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
	
	/** 다음게시글번호 조회
	 * @param conn
	 * @return
	 */
	public int nextBoardNo(Connection conn) throws Exception{
		int boardNo = 0;

		try {

			String sql = prop.getProperty("nextBoardNo");

//			stmt = conn.createStatement();
//			rs = stmt.executeQuery(sql);

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				boardNo = rs.getInt(1);
			}

		} finally {
			close(rs);
			close(pstmt);
		}

		return boardNo;
	}



	/** 게시글등록
	 * @param conn
	 * @param detail
	 * @param boardCode
	 * @return
	 */
	public int insertBoard(Connection conn, BoardDetail detail, int boardCode) throws Exception{
		
		int result = 0;

		try {
			String sql = prop.getProperty("insertBoard");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, detail.getBoardNo());
			pstmt.setString(2, detail.getBoardTitle());
			pstmt.setString(3, detail.getBoardContent());
			pstmt.setInt(4, detail.getMemberNo());
			pstmt.setInt(5, boardCode);

			result = pstmt.executeUpdate();

		} finally {
			close(pstmt);
		}
		return result;

	}



	/**게시글수정
	 * @param conn
	 * @param detail
	 * @return
	 */
	public int updateBoard(Connection conn, BoardDetail detail) throws Exception{
		int result = 0;
		
		try {
			String sql = prop.getProperty("updateBoard");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, detail.getBoardTitle());
			pstmt.setString(2, detail.getBoardContent());
			pstmt.setInt(3, detail.getBoardNo());

			result = pstmt.executeUpdate();
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
}





