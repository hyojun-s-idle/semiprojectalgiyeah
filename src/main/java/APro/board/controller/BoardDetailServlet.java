package APro.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import APro.board.service.BoardDetailService;
import APro.board.service.BoardService;
import APro.board.service.ReplyService;
import APro.board.vo.BoardDetail;
import APro.board.vo.Reply;

@WebServlet("/board/boardList/detail/*")
public class BoardDetailServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String uri = req.getRequestURI();

		String contextPath = req.getContextPath();
		String command = uri.substring( (contextPath + "/board/boardList/").length() );



		
		BoardDetailService service = new BoardDetailService();

		

		
		try {

			//게시글 상세조회
			if (command.equals("detail")) {

				System.out.println(1);
				
				// 게시판
				int boardNo = Integer.parseInt(req.getParameter("no"));
				BoardDetail detail = service.selectBoardDetail(boardNo);
				req.setAttribute("detail", detail);

				// 댓글
				if (detail != null) {
					List<Reply> rList = new ReplyService().selectReplyList(boardNo);
					req.setAttribute("rList", rList);
				}

				
				

				String path = "/WEB-INF/views/board/detail/boardDetail.jsp";
				req.getRequestDispatcher(path).forward(req, resp);
				
			}
			
			
			
			
			
			//게시글 삭제
			if (command.equals("detail/delete")) {
				
				int boardNo = Integer.parseInt(req.getParameter("no"));
				int result=service.boardDelete(boardNo);
				
				
				int type = Integer.parseInt(req.getParameter("type"));
				resp.sendRedirect("../../"+"boardList"+"?type="+type);
				
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
