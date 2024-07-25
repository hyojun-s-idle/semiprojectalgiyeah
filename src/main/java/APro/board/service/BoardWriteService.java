package APro.board.service;

import static APro.common.JDBCTemplate.*;

import java.sql.Connection;

import APro.board.dao.BoardDetailDAO;
import APro.board.dao.BoardWriteDAO;
import APro.board.vo.BoardDetail;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import APro.board.vo.Board;
import APro.board.vo.Category;
import APro.board.vo.Pagination;
import APro.common.Util;


public class BoardWriteService {
	
	BoardWriteDAO dao = new BoardWriteDAO();

	
	
	
	/** 게시판 삽입
	 * @param detail
	 * @param boardCode
	 * @return
	 * @throws Exception 
	 */
	public int insertBoard(BoardDetail detail, int boardCode) throws Exception {
		
		Connection conn = getConnection();
		int boardNo = dao.nextBoardNo(conn);
		detail.setBoardNo(boardNo); 
		
		System.out.println("boardNo : "+boardNo);
		
		detail.setBoardTitle(Util.XSSHandling(detail.getBoardTitle()));
		detail.setBoardContent(Util.XSSHandling(detail.getBoardContent()));
		detail.setBoardContent(Util.newLineHandling(detail.getBoardContent()));
		
		
		int result = dao.insertBoard(conn, detail, boardCode);
		
		if (result > 0)	commit(conn);
		else  	rollback(conn);
		
		close(conn);
		return boardNo;
	}




	/** 게시글수정
	 * @param detail
	 * @return
	 * @throws Exception
	 */
	public int updateBoard(BoardDetail detail) throws Exception{
		Connection conn=getConnection();
		detail.setBoardTitle(Util.XSSHandling(detail.getBoardTitle()));
		detail.setBoardContent(Util.XSSHandling(detail.getBoardContent()));
		detail.setBoardContent(Util.newLineHandling(detail.getBoardContent()));
		int result=dao.updateBoard(conn,detail);
		
		if(result>0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
	}

	
}
