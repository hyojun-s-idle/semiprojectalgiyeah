package APro.board.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import APro.board.service.BoardDetailService;
import APro.board.service.BoardService;
import APro.board.service.BoardWriteService;
import APro.board.vo.BoardDetail;

import APro.member.model.vo.Member;

@WebServlet("/board/write")
public class BoardWriteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String mode=req.getParameter("mode"); 

			if(mode.equals("update")) {
				
				int boardNo = Integer.parseInt(req.getParameter("no"));
				BoardDetail detail = new BoardDetailService().selectBoardDetail(boardNo);
				detail.setBoardContent(detail.getBoardContent().replaceAll("<br>", "\n"));	
				req.setAttribute("detail", detail);
				
			}
			
			
			String path="/WEB-INF/views/board/boardWrite.jsp";
			req.getRequestDispatcher(path).forward(req, resp);
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			// insert/update 구분없이 전달받은 파라미터 모두꺼내서 변수에저장
			String boardTitle=req.getParameter("boardTitle");
			String boardContent=req.getParameter("boardContent");
			
			
			int type=Integer.parseInt(req.getParameter("type"));
			
			int boardCode = Integer.parseInt(req.getParameter("boardCode"));
			String mode=req.getParameter("mode");
			
			
			System.out.println("type: "+type);
			System.out.println("boardCode: "+boardCode);

			
			
			

			HttpSession session = req.getSession();
			Member loginMember=(Member)session.getAttribute("loginMember");
			int memberNo=loginMember.getMemberNo(); 

			

			
			
			
			BoardDetail detail=new BoardDetail();
			detail.setBoardTitle(boardTitle);
			detail.setBoardContent(boardContent);
			detail.setMemberNo(memberNo);
			
			
			
			
			

			
			
			String path=null;
			
			//삽입
			if(mode.equals("insert")) { 
				
				
				int boardNo=new BoardWriteService().insertBoard(detail, boardCode);
				
				
				if(boardNo >0) { 
					session.setAttribute("message", "게시글등록 성공");
					path="boardList/detail?no="+boardNo +"&type="+type;
					
					
				}else {
					session.setAttribute("message", "게시글등록 실패");
					path=req.getHeader("referer");
				}
				
				resp.sendRedirect(path);
				
			}

			
			
			
			//수정
			if(mode.equals("update")) { 
				
				int boardNo=Integer.parseInt(req.getParameter("no"));
				int cp=Integer.parseInt(req.getParameter("cp"));
			
				detail.setBoardNo(boardNo);
				int result=new BoardWriteService().updateBoard(detail);
				
				
				session=req.getSession();
				String contextPath = req.getContextPath();
				if(result>0) {
					session.setAttribute("message", "게시글이 수정되었습니다.");
					path=contextPath + "/board/boardList/detail?no="+boardNo+"&cp="+cp +"&type="+type;
				}else {
					session.setAttribute("message", "게시글수정에 실패하였습니다.");
					path=req.getHeader("referer");

				}
				
				
				
				resp.sendRedirect(path);
				
			}
			
			
			
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
