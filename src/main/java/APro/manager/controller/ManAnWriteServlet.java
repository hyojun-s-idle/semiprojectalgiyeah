package APro.manager.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import APro.announce.model.service.AnnounceService;
import APro.announce.model.vo.AnBoardDetail;

@WebServlet("/manager/manAnnounce/boardWrite")
public class ManAnWriteServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		String mode = req.getParameter("mode");
		
		AnnounceService service = new AnnounceService();
		
			if(mode.equals("update")) {
				int boardNo = Integer.parseInt(req.getParameter("no"));
				
				AnBoardDetail detail = service.getBoardDetail(boardNo);
				
				detail.setBoardContent(detail.getBoardContent().replace("<br>", "\n"));
				
				req.setAttribute("detail", detail);
				
			}
		
		String path="/WEB-INF/views/manager/manDoardWrite.jsp";
		req.getRequestDispatcher(path).forward(req, resp);
		
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mode = req.getParameter("mode");
		String title = req.getParameter("boardTitle");
		String content = req.getParameter("boardContent");
		int type = Integer.parseInt(req.getParameter("type"));
		int cp = Integer.parseInt( req.getParameter("cp"));
		int boardNo = Integer.parseInt(req.getParameter("no"));
		HttpSession session = req.getSession();
		// Member loginMember = session.getAttribute("loginMember");
		int memberNo = 5;
		
		AnBoardDetail detail = new AnBoardDetail();
		detail.setBoardNo(boardNo);
		detail.setBoardTitle(title);
		detail.setBoardContent(content);
		detail.setMemberNo(memberNo);
		
		AnnounceService service = new AnnounceService();
		
		try {
			String path = null;
			String message = null;
			if(mode.equals("insert")) {
				
				int result = service.insertPost(detail,type);
				
				if(result > 0) {
					path = req.getContextPath() + "/announce/boardList?type="+type + "&cp="+ cp;
					message = "게시물 등록을 완료했습니다.";
				}else {
					path = req.getHeader("referer");
					message = "게시물 등록을 실패했습니다. 등록 페이지로 이동합니다.";
				}
				System.out.println(result);
			}
			
			if(mode.equals("update")) {
				
				int result = service.updatePost(detail);
				
				if(result > 0) {
					message = "수정을 완료했습니다.";
					path = req.getContextPath() + "/announce/boardList/detail?type="+type+"&no="+boardNo + "&cp="+ cp;
				}else {
					message = "수정을 실패했습니다. 수정 페이지로 돌아갑니다.";
					path = req.getHeader("referer");
				}
				System.out.println(result);
				
			}
			session.setAttribute("message", message);
			resp.sendRedirect(path);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
