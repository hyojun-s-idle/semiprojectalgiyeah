package APro.board.service;

import static APro.common.JDBCTemplate.*;

import java.sql.Connection;

import APro.board.dao.BoardDAO;
import APro.board.vo.BoardDetail;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import APro.board.dao.BoardDAO;
import APro.board.vo.Board;
import APro.board.vo.Category;
import APro.board.vo.Pagination;
import APro.common.Util;

public class BoardService {
	
	BoardDAO dao = new BoardDAO();

	
	
	
	


	
	
	
	
	/** 게시글 목록 조회 Service
	 * @param type
	 * @param cp
	 * @param cate
	 * @return boardMap
	 * @throws Exception
	 */
	public Map<String, Object> selectBoardList(int type, int cp, int cate) throws Exception {
		
		Connection conn = getConnection();
		
		// 게시판 이름
		String boardName = dao.selectBoardName(conn,type);
		
		// 키테고리 이름 변수
		List<Category> category = dao.selectCategory(conn);
		
		// 게시글 수 변수
		int listCount = 0;
		
		// 전체 선택 아닐 시
		if(cate != 0) {

			// 카테고리 선택 게시판 전체 게시글 수 조회
			listCount = dao.getListCount(conn, cate);
		}else {
			listCount = dao.getListCount(type, conn);
		}
		// 전체 게시글 수(카테고리 게시글 수) + 현재 페이지(cp)를 이용해 페이지네이션 객체 생성
		Pagination pagination = new Pagination(cp, listCount);
		
		// 게시글 목록 조회 컬렉션
		List<Board> boardList = new ArrayList<>();
		
		// 카테고리 목록 조회 DAO 호출
		if(cate != 0) {
			boardList = dao.selectBoardList(conn, cate, pagination);
		}else {
			// 전체 게시물 목록 조회
			boardList = dao.selectBoardList(conn, pagination, type);
		}
		
		// MAP객체를 생성하여 결과들 모두 저장
		Map<String, Object> boardMap = new HashMap<>();
		boardMap.put("boardName",boardName);
		boardMap.put("category", category);
		boardMap.put("pagination", pagination);
		boardMap.put("boardList", boardList);
		
		close(conn);
		
		return boardMap;
	}

	/** 모두 게시판 검색 Service
	 * @param standard
	 * @param board
	 * @param all
	 * @param search 
	 * @param cp 
	 * @return allList
	 * @throws Exception
	 */
	public Map<String, Object> searchAllBoard(String standard, int board, int all, String search, int cp) throws Exception {
		
		Connection conn = getConnection();
		
		search = Util.XSSHandling(search);
		search = Util.newLineHandling(search);
		
		// 게시판 이름
		String boardName = dao.selectBoardName(conn,board);
		
		// 카테고리 얻어오기
		List<Category> category = dao.selectCategory(conn);
		
		int listCount = dao.getSearchListCount(conn,board, all, search, standard);
		System.out.println(listCount);
		Pagination pagination = new Pagination(cp, listCount);
		
		List<Board> list = dao.searchBoardList(conn,board, all, search, pagination, standard);
		
		Map<String, Object> allList = new HashMap<>();
		allList.put("boardName", boardName);
		allList.put("category", category);
		allList.put("pagination", pagination);
		allList.put("boardList", list);
		
		close(conn);
		
		return allList;
	}

	/**모든 카테고리 Service
	 * @return category
	 * @throws Exception
	 */
	public List<Category> getCategory() throws Exception {
		
		Connection conn = getConnection();
		
		List<Category> category = dao.selectCategory(conn);
		
		close(conn);
		
		return category;
	}

}
