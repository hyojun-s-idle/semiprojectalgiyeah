package APro.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import APro.board.service.BoardDetailService;

@WebServlet("/warn/*")
public class warnServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// url자르기
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = uri.substring((contextPath + "/warn/").length());

		try {

			// 게시판 신고
			if (command.equals("board")) {
				
				int boardNo = Integer.parseInt(req.getParameter("boardNo"));
				int memberNo = Integer.parseInt(req.getParameter("memberNo"));
				String warn = req.getParameter("warn");
				
				int result = new BoardDetailService().boardWarn(memberNo, boardNo, warn);
				resp.getWriter().print(result);

			}

			// 댓글 신고
			if (command.equals("reply")) {
				
				int replyNo = Integer.parseInt(req.getParameter("replyNo"));
				int memberNo = Integer.parseInt(req.getParameter("memberNo"));
				String warn = req.getParameter("warn");
				
				int result = new BoardDetailService().replyWarn(memberNo, replyNo, warn);
				resp.getWriter().print(result);

			}

			

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
