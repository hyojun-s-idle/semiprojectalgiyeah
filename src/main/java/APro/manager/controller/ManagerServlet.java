package APro.manager.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		// 페이지 네이션
		int cp=1;
		
		// Session 생성
		HttpSession session = req.getSession();
		
		try {
			
			List<Category> category = service.getCategory();
			String path = null;
			
			// 신고 댓글 조회
			if(command.equals("manCommentSearch")) {
				
				if(req.getParameter("cp") != null) {
					cp = Integer.parseInt(req.getParameter("cp"));
				}
				// 신고 댓글 검색
				if(req.getParameter("mSearchCon") != null) {
					
					String mSearchCon = req.getParameter("mSearchCon");
					String mSearchConText = req.getParameter("mSearchConText");
					int mSearchMember = Integer.parseInt(req.getParameter("mSearchMember")); 
					int allSearch = Integer.parseInt(req.getParameter("allSearch"));
					int ceoSearch = Integer.parseInt(req.getParameter("businessSearch"));
					int workerSearch = Integer.parseInt(req.getParameter("rectalSearch"));
					int reportNum1 = Integer.parseInt(req.getParameter("reportAccuSearchNum1"));
					int reportNum2 = 0;
					
					if(req.getParameter("reportAccuSearchNum2") != "" && req.getParameter("reportAccuSearchNum2") != null) {
						reportNum2 = Integer.parseInt(req.getParameter("reportAccuSearchNum2"));
					}
					
					Map<String, Object> list = mService.getCommentList(cp, mSearchCon, mSearchConText, mSearchMember,
																		allSearch, ceoSearch, workerSearch, reportNum1,reportNum2);
					
					req.setAttribute("list", list);
					
				}else {
					
					Map<String, Object> list = mService.getCommentList(cp);
					
					req.setAttribute("list", list);
				}
				
				path = "/WEB-INF/views/manager/manCommentReportSearch.jsp";
			}
			
			// 신고 게시판 조회
			if(command.equals("manPostSearch")) {
				
				if(req.getParameter("cp") != null) {
					cp = Integer.parseInt(req.getParameter("cp"));
				}
				
				// 신고 게시판 검색 조회
				if(req.getParameter("mSearchCon") != null) {
					
					String mSearchCon = req.getParameter("mSearchCon");
					String mSearchConText = req.getParameter("mSearchConText");
					int mSearchMember = Integer.parseInt(req.getParameter("mSearchMember")); 
					int allSearch = Integer.parseInt(req.getParameter("allSearch"));
					int ceoSearch = Integer.parseInt(req.getParameter("businessSearch"));
					int workerSearch = Integer.parseInt(req.getParameter("rectalSearch"));
					int reportNum1 = Integer.parseInt(req.getParameter("reportAccuSearchNum1"));
					int reportNum2 = 0;
					if(req.getParameter("reportAccuSearchNum2") != "" && req.getParameter("reportAccuSearchNum2") != null) {
						reportNum2 = Integer.parseInt(req.getParameter("reportAccuSearchNum2"));
					}
					
					Map<String, Object> list = mService.getPostSearchList(cp,mSearchCon, mSearchConText, mSearchMember,
																	allSearch, ceoSearch, workerSearch, reportNum1,reportNum2);
					req.setAttribute("list", list);
				}else {
					
					Map<String, Object> list = mService.getPostList(cp);
					req.setAttribute("list", list);
				}
				
				path = "/WEB-INF/views/manager/manPostReportSearch.jsp";
			}
			
			// 회원 조회
			if(command.equals("manMemberSearch")) {
				
				if(req.getParameter("cp") != null) {
					cp = Integer.parseInt(req.getParameter("cp"));
				}
				
				// 회원 검색
				if(req.getParameter("mSearchCon") != null) {
					
					String mSearchCon = req.getParameter("mSearchCon");
					String mSearchConText = req.getParameter("mSearchConText");
					int mSearchMember = Integer.parseInt(req.getParameter("mSearchMember"));
					String mSecessoin = req.getParameter("mSecession");
					
					Map<String, Object> list = mService.getMemberList(cp,mSearchCon,mSearchConText,mSearchMember,mSecessoin);
					
					req.setAttribute("list", list);
					
				}else {
					Map<String, Object> list = mService.getMemberList(cp);
					
					req.setAttribute("list", list);
					
				}
				
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
			
			if(command.equals("commentDetail/delete")) {
				int replyNo = Integer.parseInt(req.getParameter("replyNo"));
				int boardNo = Integer.parseInt(req.getParameter("boardNo"));
				char deleteType = 'r';
				
				int result = mService.deleteReport(replyNo, deleteType);
				
				if(result > 0) {
					session.setAttribute("message", "신고 댓글을 삭제했습니다.");
				}else {
					session.setAttribute("message", "신고 댓글 삭제를 실패했습니다.");
				}
				path ="/manager/manCommentSearch";
			}
			
			if(command.equals("postDetail/delete")) {
				
				int boardNo = Integer.parseInt(req.getParameter("boardNo"));
				char deleteType = 'b';
				
				int result = mService.deleteReport(boardNo, deleteType);
				
				if(result > 0) {
					session.setAttribute("message", "신고 댓글을 삭제했습니다.");
				}else {
					session.setAttribute("message", "신고 댓글 삭제를 실패했습니다.");
				}
				path = "/manager/manPostSearch";
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
