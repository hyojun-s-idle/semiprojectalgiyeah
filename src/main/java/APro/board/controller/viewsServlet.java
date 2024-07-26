package APro.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import APro.board.service.BoardDetailService;

@WebServlet("/views")
public class viewsServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			
			int boardNo = Integer.parseInt(req.getParameter("boardNo"));
			
			int viewsCount=new BoardDetailService().viewsCount(boardNo);
					
			resp.getWriter().print(viewsCount);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
