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
public class BoardDetailDAO {

	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Properties prop;
	
	public BoardDetailDAO() {
		try {
			prop = new Properties();
			String filePath = BoardDAO.class.getResource("/APro/sql/boardDetail-sql.xml").getPath();
			prop.loadFromXML( new FileInputStream(filePath));
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/** 상세조회
	 * @param conn
	 * @param boardNo
	 * @return
	 * @throws Exception
	 */
	public BoardDetail selectBoardDetail(Connection conn, int boardNo) throws Exception{

		BoardDetail detail = null;
		
		try {

			String sql = prop.getProperty("selectBoardDetail");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);

			rs = pstmt.executeQuery();
			
			if (rs.next()) {


				detail = new BoardDetail();

				detail.setBoardNo(rs.getInt("BOARD_NO"));                      //화면
				detail.setBoardTitle(rs.getString("BOARD_TITLE"));             //화면
				detail.setBoardContent(rs.getString("BOARD_CONTENT"));         //화면
				detail.setCreateDate(rs.getString("CREATE_DT"));               //화면(택일)
				detail.setUpdateDate(rs.getString("UPDATE_DT"));               //화면(택일)
				detail.setReadCount(rs.getInt("READ_COUNT"));				   //화면
				detail.setMemberNo(rs.getInt("MEMBER_NO"));					   //조건

				
				//추후 정해야할부분 <- 쿼리스트링 어떻게 끌어올지 <- 세희님방식에서 따라가기
//				detail.setBoardTypeCd(rs.getInt("BOARD_TYPE_CD"));             //화면

				
				
				detail.setLikeCount(rs.getInt("LIKE_COUNT"));                  //화면
				
				
				detail.setProfileImage(rs.getString("PROFILE_IMGE"));          //화면
				detail.setMemberNickname(rs.getString("MEMBER_NICK"));         //화면

				detail.setReplyCount(rs.getInt("REPLY_COUNT"));                  //화면
				
				detail.setMajCategory(rs.getString("MAJ"));         //화면
				detail.setSubCategory(rs.getString("SUB"));         //화면
				
				//*******************************************************************
				//9개(화면) + 1개(조건)
				//boardNo boardName createDate   +    likeCount readCount replyCount
				//boardTitle
				//profileImage
				//boardContent
				
				//memberNo
				//*******************************************************************
				
				
			}

		} finally {
			close(rs);
			close(pstmt);
		}

		return detail;
		
	}


	/** 게시판삭제
	 * @param conn
	 * @param boardNo
	 * @return
	 * @throws Exception
	 */
	public int boardDelete(Connection conn, int boardNo) throws Exception {
		int result = 0;
		try {
			String sql = prop.getProperty("boardDelete");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);

			result = pstmt.executeUpdate();

		} finally {
			close(pstmt);
		}
		return result;
	}

	
	
	

	/** 좋아요 조회
	 * @param conn
	 * @param boardNo
	 * @param memberNo 
	 * @return
	 */
	public int boardLikeSelect(Connection conn, int boardNo) throws Exception {
		int likeCount = 0;
		
		try {

			String sql = prop.getProperty("boardLikeSelect");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);


			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				likeCount=rs.getInt(1);
			}

		} finally {
			close(rs);
			close(pstmt);
		}

		return likeCount;
	}
	
	
	/** 좋아요 상태조회
	 * @param conn
	 * @param boardNo
	 * @param memberNo
	 * @return
	 */
	public int boardLikeState(Connection conn, int boardNo, int memberNo)  throws Exception {
		int likeState = 0;
		
		try {

			String sql = prop.getProperty("boardLikeState");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			pstmt.setInt(2, memberNo);


			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				likeState=rs.getInt(1);
			}

		} finally {
			close(rs);
			close(pstmt);
		}

		return likeState;
	}

	
	
	
	
	


	/** 좋아요 Up
	 * @param conn
	 * @param boardNo
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public int boardLikeUp(Connection conn, int boardNo, int memberNo) throws Exception  {
		int result = 0;
		try {
			String sql = prop.getProperty("boardLikeUp");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			pstmt.setInt(2, memberNo);

			result = pstmt.executeUpdate();

		} finally {
			close(pstmt);
		}
		return result;
	}


	/** 좋아요 Down
	 * @param conn 
	 * @param boardNo
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public int boardLikeDown(Connection conn, int boardNo, int memberNo) throws Exception{
		int result = 0;
		try {
			String sql = prop.getProperty("boardLikeDown");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			pstmt.setInt(2, memberNo);

			result = pstmt.executeUpdate();

		} finally {
			close(pstmt);
		}
		return result;
	}


	
	
	/** 게시물 신고
	 * @param conn
	 * @param memberNo
	 * @param boardNo
	 * @param warn
	 * @return
	 */
	public int boardWarn(Connection conn, int memberNo, int boardNo, String warn)  throws Exception{
		int result = 0;
		try {
			String sql = prop.getProperty("boardWarn");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, boardNo);
			pstmt.setString(3, warn);

			result = pstmt.executeUpdate();

		} finally {
			close(pstmt);
		}
		return result;
	}


	/** 댓글신고
	 * @param conn
	 * @param memberNo
	 * @param replyNo
	 * @param warn
	 * @return
	 */
	public int replyWarn(Connection conn, int memberNo, int replyNo, String warn) throws Exception{
		int result = 0;
		try {
			String sql = prop.getProperty("replyWarn");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, replyNo);
			pstmt.setString(3, warn);

			result = pstmt.executeUpdate();

		} finally {
			close(pstmt);
		}
		return result;
	}




}
