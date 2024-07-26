package APro.board.service;

import static APro.common.JDBCTemplate.*;

import java.sql.Connection;

import APro.board.dao.BoardDetailDAO;
import APro.board.vo.BoardDetail;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import APro.board.vo.Board;
import APro.board.vo.Category;
import APro.board.vo.Pagination;
import APro.common.Util;

public class BoardDetailService {

	BoardDetailDAO dao = new BoardDetailDAO();

	/**
	 * 게시판 상세조회
	 * 
	 * @param boardNo
	 * @return
	 * @throws Exception
	 */
	public BoardDetail selectBoardDetail(int boardNo) throws Exception {

		Connection conn = getConnection();
		BoardDetail detail = dao.selectBoardDetail(conn, boardNo);

		close(conn);
		return detail;

	}

	/**
	 * 게시판 삭제
	 * 
	 * @param boardNo
	 * @return
	 * @throws Exception
	 */
	public int boardDelete(int boardNo) throws Exception {
		Connection conn = getConnection();
		int result = dao.boardDelete(conn, boardNo);
		if (result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;

	}

	
	
	
	
	
	
	
	/**게시판 좋아요 Select
	 * @param boardNo
	 * @param memberNo 
	 * @return
	 */
	public int boardLikeSelect(int boardNo) throws Exception {
		Connection conn = getConnection();
		int likeCount = dao.boardLikeSelect(conn, boardNo);

		close(conn);
		return likeCount;
	}


	/** 게시판 좋아요 상태
	 * @param boardNo
	 * @param memberNo
	 * @return
	 */
	public int boardLikeState(int boardNo, int memberNo) throws Exception{
		Connection conn = getConnection();
		int likeState = dao.boardLikeState(conn, boardNo, memberNo);

		close(conn);
		return likeState;
	}
	
	
	/** 게시판 좋아요 Up
	 * @param boardNo
	 * @param memberNo
	 * @return
	 */
	public int boardLikeUp(int boardNo, int memberNo) throws Exception{
		Connection conn = getConnection();
		int result = dao.boardLikeUp(conn, boardNo, memberNo);

		if (result > 0) commit(conn);
		else rollback(conn);

		close(conn);
		return result;
	}
	
	

	/** 게시판 좋아요 Down
	 * @param boardNo
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public int boardLikeDown(int boardNo, int memberNo) throws Exception{
		Connection conn = getConnection();
		int result = dao.boardLikeDown(conn, boardNo, memberNo);

		if (result > 0)	commit(conn);
		else rollback(conn);

		close(conn);
		return result;
	}

	
	/** 게시물 신고
	 * @param memberNo
	 * @param boardNo
	 * @param warn
	 * @return
	 */
	public int boardWarn(int memberNo, int boardNo, String warn)  throws Exception{
		
		Connection conn = getConnection();
		int result = dao.boardWarn(conn, memberNo, boardNo, warn);

		if (result > 0)	commit(conn);
		else rollback(conn);

		close(conn);
		return result;
	}

	
	/** 댓글 신고
	 * @param memberNo
	 * @param replyNo
	 * @param warn
	 * @return
	 */
	public int replyWarn(int memberNo, int replyNo, String warn) throws Exception{
		Connection conn = getConnection();
		int result = dao.replyWarn(conn, memberNo, replyNo, warn);

		if (result > 0)	commit(conn);
		else rollback(conn);

		close(conn);
		return result;
	}

	

}
