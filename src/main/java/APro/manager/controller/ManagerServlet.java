package APro.manager.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import APro.board.service.BoardService;
import APro.board.vo.Category;
import APro.manager.model.service.ManagerService;
import APro.manager.model.vo.ManCommentDetail;
import APro.manager.model.vo.ManPostDetail;

@WebServlet("/manager/*")
public class ManagerServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = uri.substring(  (contextPath + "/manager/").length()  );
		
		// Board 서비스 호출
		BoardService service = new BoardService();
		
		// Manager 서비스 호출
		ManagerService mService = new ManagerService();
		int cp=1;
		
		try {
			
			List<Category> category = service.getCategory();
			String path = null;
			if(command.equals("manCommentSearch")) {
				
				if(req.getParameter("cp") != null) {
					cp = Integer.parseInt(req.getParameter("cp"));
				}
				
				Map<String, Object> list = mService.getCommentList(cp);
				
				req.setAttribute("list", list);
				
				path = "/WEB-INF/views/manager/manCommentReportSearch.jsp";
			}
			
			if(command.equals("manPostSearch")) {
				
				if(req.getParameter("cp") != null) {
					cp = Integer.parseInt(req.getParameter("cp"));
				}
				
				Map<String, Object> list = mService.getPostList(cp);
				
				req.setAttribute("list", list);
				
				path = "/WEB-INF/views/manager/manPostReportSearch.jsp";
			}
			
			if(command.equals("manMemberSearch")) {
				path = "/WEB-INF/views/manager/manMemberSearch.jsp";
			}
			
			if(command.equals("commentDetail")) {
				int boardNo = Integer.parseInt(req.getParameter("boardNo"));
				int replyNo = Integer.parseInt(req.getParameter("replyNo"));
				
				ManCommentDetail detail = mService.getCommentDetail(boardNo, replyNo);
				
				req.setAttribute("detail", detail);
				
				path = "/WEB-INF/views/manager/manCommentDetail.jsp";
				
			}
			
			if(command.equals("postDetail")) {
				int boardNo = Integer.parseInt(req.getParameter("boardNo"));
				
				ManPostDetail detail = mService.getPostDetail(boardNo);
				
				req.setAttribute("detail", detail);
				
				path = "/WEB-INF/views/manager/manPostDetail.jsp";
			}
			req.setAttribute("category", category);
			req.getRequestDispatcher(path).forward(req, resp);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
