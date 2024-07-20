package APro.board.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import APro.board.dao.BoardDAO;
import APro.board.service.BoardService;

@WebServlet("/board/*")
public class BoardListServelt extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = uri.substring(  (contextPath + "/board/").length()  );
		
		int cp = 1;
		int cate = 0; // 전체 선택 시
		
		try {
			
			// BoardService
			BoardService service = new BoardService();
			
			if(command.equals("boardList")) {
				int type = Integer.parseInt( req.getParameter("type") ); 
				
				if( req.getParameter("cp") != null ) {
					cp = Integer.parseInt(req.getParameter("cp"));
					System.out.println(cp);
				}
				
				if( req.getParameter("cate") != null) {
					cate = Integer.parseInt(req.getParameter("cate"));
				}
				
				Map<String, Object> boardList = service.selectBoardList(type, cp, cate);
				
				req.setAttribute("list", boardList);
				
				String path = "/WEB-INF/views/board/allBoardList.jsp";
				req.getRequestDispatcher(path).forward(req, resp);
			}
			
			
			//상세조회
			if(command.equals("boardList/detail")) {
				String path = "/WEB-INF/views/board/boardDetail.jsp";
				req.getRequestDispatcher(path).forward(req, resp);
			}
			
			//글쓰기
			if(command.equals("boardList/boardWrite")) {
				String path = "/WEB-INF/views/board/boardWrite.jsp";
				req.getRequestDispatcher(path).forward(req, resp);
			}
			
			
			//사이드 게시판
			if(command.equals("side/twelveBoard")) {
				String path = "/WEB-INF/views/board/side/twelveBoard.jsp";
				req.getRequestDispatcher(path).forward(req, resp);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
