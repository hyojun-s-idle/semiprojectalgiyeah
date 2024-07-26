package APro.board.controller;

import java.io.IOException;

import java.util.List;

import java.util.Map;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import APro.board.dao.BoardDAO;
import APro.board.service.BoardService;

import APro.board.service.ReplyService;
import APro.board.vo.BoardDetail;
import APro.board.vo.Reply;



@WebServlet("/board/boardList")
public class BoardListServelt extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		BoardService service = new BoardService();
		

		int cp = 1;
		int cate = 0; // 전체 선택 시
		
		
		try {

			// BoardService
			
			/*목록 가져오는 페이지 네이션*/
			
				
				int type = Integer.parseInt( req.getParameter("type") ); 
				
				if( req.getParameter("cp") != null ) {
					cp = Integer.parseInt(req.getParameter("cp"));
				}
				
				if( req.getParameter("cate") != null) {
					cate = Integer.parseInt(req.getParameter("cate"));
				}
				
				Map<String, Object> boardList = service.selectBoardList(type, cp, cate);
				
				req.setAttribute("list", boardList);
				
				String path = "/WEB-INF/views/board/allBoardList.jsp";

				req.getRequestDispatcher(path).forward(req, resp);
			
			
			

		} catch (Exception e) {

			e.printStackTrace();
		}
			
	}
	
		
	//doPost -> doGet
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}


}
