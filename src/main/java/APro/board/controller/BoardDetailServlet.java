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
import APro.board.vo.LoginMember;
import APro.board.vo.Reply;

@WebServlet("/board/boardList/detail/*")
public class BoardDetailServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String uri = req.getRequestURI();

		String contextPath = req.getContextPath();
		String command = uri.substring( (contextPath + "/board/boardList/").length() );



		
		/* ********************
		 * uri : queryString(x)
		 * uri : ? 이하부분(x)
		 * *********************/

		BoardDetailService service = new BoardDetailService();

		

		
		try {

			// 게시글 상세조회
			if (command.equals("detail")) {

				// 게시판
				int boardNo = Integer.parseInt(req.getParameter("no"));
				BoardDetail detail = service.selectBoardDetail(boardNo);
				req.setAttribute("detail", detail);

				// 댓글
				if (detail != null) {
					List<Reply> rList = new ReplyService().selectReplyList(boardNo);
					req.setAttribute("rList", rList);
				}

				
				
				// 로그인 테스트용 - 추후지울것 !!!
				// ***************************************************
				LoginMember loginMember = new LoginMember();
//				loginMember.setMemberNo(19);
				loginMember.setMemberNo(1);
				loginMember.setMemberNickname("닉네임");
				HttpSession session = req.getSession();
				session.setAttribute("loginMember", loginMember);
				// ***************************************************

				
				
				String path = "/WEB-INF/views/board/detail/boardDetail.jsp";
				req.getRequestDispatcher(path).forward(req, resp);
				
			}
			
			
			
			
			
			// 게시글 삭제
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
