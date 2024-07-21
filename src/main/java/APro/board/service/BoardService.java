package APro.board.service;

import static APro.common.JDBCTemplate.*;

import java.sql.Connection;

import APro.board.dao.BoardDAO;
import APro.board.vo.BoardDetail;

public class BoardService {
	
	BoardDAO dao = new BoardDAO();

	
	
	
	
	
	public BoardDetail selectBoardDetail(int boardNo) throws Exception{
		
		Connection conn = getConnection();
		BoardDetail detail = dao.selectBoardDetail(conn, boardNo);

		
		
		close(conn);
		return detail;
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
