package semiprojectalgiyeah.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/*")
public class BoardListServelt extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = uri.substring(  (contextPath + "/board/").length()  );
		
		if(command.equals("allList")) {
			String path = "/WEB-INF/views/board/allBoardList.jsp";
			req.getRequestDispatcher(path).forward(req, resp);
			
		}
		
		if(command.equals("workerList")) {
			String path = "/WEB-INF/views/board/workerBoardList.jsp";
			req.getRequestDispatcher(path).forward(req, resp);
		}
		
		if(command.equals("ceoList")) {
			String path = "/WEB-INF/views/board/ceoBoardList.jsp";
			req.getRequestDispatcher(path).forward(req, resp);
		}
		
	}

}
