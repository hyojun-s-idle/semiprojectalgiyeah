package APro.board.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import APro.board.service.BoardService;

@WebServlet("/board/search")
public class BoardSearchServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getParameter("conSearch") != null) {
			
			String standard = req.getParameter("conSearch");
			int board = Integer.parseInt(req.getParameter("mSearchMember"));
			String search = req.getParameter("nSearch");
			int all = 0;
			int worker = 0;
			int ceo = 0;
			int cp = 1;
			
			try {
				BoardService service = new BoardService();
				HttpSession session = req.getSession();
				if(req.getParameter("cp") != null) {
					cp = Integer.parseInt(req.getParameter("cp"));
				}
				if(board == 1) {
					all = Integer.parseInt(req.getParameter("allSearch"));
					Map<String, Object> allList = service.searchAllBoard(standard, board, all, search,cp);
					System.out.println(allList);
					session.setAttribute("list", allList);
					
				}
				
				resp.sendRedirect("search");
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else {
			String path= "/WEB-INF/views/board/boardSearch.jsp";
			req.getRequestDispatcher(path).forward(req, resp);
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
	}

}
