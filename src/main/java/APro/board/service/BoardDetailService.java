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

	public int boardDelete(int boardNo)  throws Exception {
		Connection conn = getConnection();
		int result = dao.boardDelete(conn, boardNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;

	}

}
