package APro.manager.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/manager/*")
public class ManagerServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = uri.substring(  (contextPath + "/manager/").length()  );
		
		try {
			if(command.equals("manCommentSearch")) {
				String path = "/WEB-INF/views/manager/manCommentReportSearch.jsp";
				req.getRequestDispatcher(path).forward(req, resp);
			}
			
			if(command.equals("manPostSearch")) {
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
