package APro.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import APro.board.dao.BoardDAO;
import APro.board.service.BoardService;
import APro.board.service.ReplyService;
import APro.board.vo.BoardDetail;
import APro.board.vo.LoginMember;
import APro.board.vo.Reply;

@WebServlet("/board/*")
public class BoardListServelt extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = uri.substring(  (contextPath + "/board/").length()  );
		
		
		
		
		BoardService service = new BoardService();
		
		try {
			
			//목록조회
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
			
			
			
			
			//상세조회
			int boardNo=0;
			if(command.equals("allList/detail")) {
				
				
				//게시판
				boardNo=Integer.parseInt(req.getParameter("no"));
				
				BoardDetail detail=service.selectBoardDetail(boardNo);
				req.setAttribute("detail", detail);
				
				
				//댓글
				if (detail != null) {
					List<Reply> rList = new ReplyService().selectReplyList(boardNo);
					req.setAttribute("rList", rList);
				}

				
				
				
				//로그인 테스트용 - 추후지울것 !!!
				//***************************************************
				LoginMember loginMember=new LoginMember(); 
				loginMember.setMemberNo(19);
				loginMember.setMemberNickname("닉네임");
				HttpSession session=req.getSession();
				session.setAttribute("loginMember", loginMember);
				//***************************************************
				
				
				String path = "/WEB-INF/views/board/detail/boardDetail.jsp";
				req.getRequestDispatcher(path).forward(req, resp);
				
				
				

				
				
				
				
				
				
			}
			if(command.equals("workerList/detail")) {
				String path = "/WEB-INF/views/board/detail/boardDetail.jsp";
				req.getRequestDispatcher(path).forward(req, resp);
			}
			if(command.equals("ceoList/detail")) {
				String path = "/WEB-INF/views/board/detail/boardDetail.jsp";
				req.getRequestDispatcher(path).forward(req, resp);
			}
			
			
			
			//댓글등록
			if(command.equals("allList/datail/reply/insert")) {
				
				boardNo=Integer.parseInt(req.getParameter("no"));
				String replyContent=req.getParameter("replyContent");
				
				HttpSession session=req.getSession();
				session.getAttribute("loginMember");
//				String[] loginMember =  session.getAttributeValues("loginMember");

				System.out.println(session.getAttribute("loginMember"));
				
				System.out.println(boardNo);
				System.out.println(replyContent);
				
				String path = "../../detail?no="+boardNo;
				resp.sendRedirect(path);
				
//				System.out.println(path);

				
				
			}
			
			
			
			
			
			//글쓰기
			if(command.equals("allList/boardWrite")) {
				String path = "/WEB-INF/views/board/boardWrite.jsp";
				req.getRequestDispatcher(path).forward(req, resp);
			}
			if(command.equals("workerList/boardWrite")) {
				String path = "/WEB-INF/views/board/boardWrite.jsp";
				req.getRequestDispatcher(path).forward(req, resp);
			}
			if(command.equals("ceoList/boardWrite")) {
				String path = "/WEB-INF/views/board/boardWrite.jsp";
				req.getRequestDispatcher(path).forward(req, resp);
			}

			
			
			//사이드 게시판
			if(command.equals("side/twelveBoard")) {
				String path = "/WEB-INF/views/board/side/twelveBoard.jsp";
				req.getRequestDispatcher(path).forward(req, resp);
			}
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	
	}
	
	
	
	
	
	//doPost -> doGet
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
