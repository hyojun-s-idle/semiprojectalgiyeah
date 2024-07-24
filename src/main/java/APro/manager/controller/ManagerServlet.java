package APro.manager.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import APro.board.service.BoardService;
import APro.board.vo.Category;

@WebServlet("/manager/*")
public class ManagerServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = uri.substring(  (contextPath + "/manager/").length()  );
		BoardService service = new BoardService();
		try {
			List<Category> category = service.getCategory();
			if(command.equals("manCommentSearch")) {
				req.setAttribute("category", category);
				String path = "/WEB-INF/views/manager/manCommentReportSearch.jsp";
				req.getRequestDispatcher(path).forward(req, resp);
			}
			
			if(command.equals("manPostSearch")) {
				req.setAttribute("category", category);
				String path = "/WEB-INF/views/manager/manPostReportSearch.jsp";
				req.getRequestDispatcher(path).forward(req, resp);
			}
			
			if(command.equals("manMemberSearch")) {
				String path = "/WEB-INF/views/manager/manMemberSearch.jsp";
				req.getRequestDispatcher(path).forward(req, resp);
			}
			
			if(command.equals("commentDetail")) {
				String path = "/WEB-INF/views/manager/manCommentDetail.jsp";
				req.getRequestDispatcher(path).forward(req, resp);
				
			}
			if(command.equals("postDetail")) {
				String path = "/WEB-INF/views/manager/manPostDetail.jsp";
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
