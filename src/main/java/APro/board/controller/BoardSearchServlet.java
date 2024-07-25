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

import org.apache.catalina.Session;

import APro.board.service.BoardService;
import APro.board.vo.Category;
import APro.board.vo.SearchBoard;

@WebServlet("/board/search")
public class BoardSearchServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardService service = new BoardService();
		HttpSession session = req.getSession();
		try {
		if(req.getParameter("conSearch") != null) {
			String standard = req.getParameter("conSearch");
			int board = Integer.parseInt(req.getParameter("mSearchMember"));
			String search = req.getParameter("nSearch");
			int all = 0;
			int worker = 0;
			int ceo = 0;
			int cp = 1;
			
				
				if(req.getParameter("cp") != null) {
					cp = Integer.parseInt(req.getParameter("cp"));
				}
				if(board == 1) {
					all = Integer.parseInt(req.getParameter("allSearch"));
					Map<String, Object> allList = service.searchAllBoard(standard, board, all, search,cp);
					req.setAttribute("list", allList);
					
				}
				
				if(board == 2 ) {
					worker = Integer.parseInt(req.getParameter("rectalSearch"));
					Map<String, Object> allList = service.searchAllBoard(standard, board, worker, search,cp);
					req.setAttribute("list", allList);
				}
				
				if(board == 3) {
					ceo = Integer.parseInt( req.getParameter("businessSearch"));
					Map<String, Object> allList = service.searchAllBoard(standard, board, ceo, search,cp);
					req.setAttribute("list", allList);
				}
		} 
		if(req.getParameter("conSearch") == null){
			
				List<Category> category = service.getCategory();
				req.setAttribute("category", category);
				
		}
		
		String path= "/WEB-INF/views/board/boardSearch.jsp";
		req.getRequestDispatcher(path).forward(req, resp);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
	}

}
