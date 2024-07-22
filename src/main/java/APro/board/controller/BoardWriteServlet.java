package APro.board.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import APro.board.service.BoardService;

@WebServlet("/board/boardList/write")
public class BoardWriteServlet extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = uri.substring(  (contextPath + "/board/").length()  );
		
		
//		BoardService service = new BoardService();
		

		
		
		try {
			


			
			//댓글등록
			if(command.equals("allList/datail/reply/insert")) {
				
				int boardNo=Integer.parseInt(req.getParameter("no"));
				String replyContent=req.getParameter("replyContent");
				
				HttpSession session=req.getSession();
				session.getAttribute("loginMember");
//				String[] loginMember =  session.getAttributeValues("loginMember");

				System.out.println(session.getAttribute("loginMember"));
				
				System.out.println(boardNo);
				System.out.println(replyContent);
				
//				String path = "../../detail?no="+boardNo;
				String path=req.getHeader("referer");
				resp.sendRedirect(path);
				
				System.out.println(path);

				
			}
			
			
      



  
			//상세조회
			if(command.equals("boardList/detail")) {
				String path = "/WEB-INF/views/board/boardDetail.jsp";
				req.getRequestDispatcher(path).forward(req, resp);
			}
			
      
			//글쓰기
			if(command.equals("boardList/boardWrite")) {
				String path = "/WEB-INF/views/board/boardWrite.jsp";
				req.getRequestDispatcher(path).forward(req, resp);
			}

			
			
			//사이드 게시판
			if(command.equals("side/twelveBoard")) {
				String	path = "/WEB-INF/views/board/side/twelveBoard.jsp";
				req.getRequestDispatcher(path).forward(req, resp);
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
