package semiprojectalgiyeah.announce.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/announce/*")
public class AnnounceController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = uri.substring(  (contextPath + "/announce/").length()  );
		
		if(command.equals("boardList")) {
			String path = "/WEB-INF/views/announce/boardList.jsp";
			req.getRequestDispatcher(path).forward(req, resp);
		}
		
		if(command.equals("boardList/detail")) {
			String path = "/WEB-INF/views/announce/boarDetail.jsp";
			req.getRequestDispatcher(path).forward(req, resp);
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}