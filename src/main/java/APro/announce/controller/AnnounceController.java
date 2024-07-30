package APro.announce.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import APro.announce.model.service.AnnounceService;
import APro.announce.model.vo.AnBoardDetail;
import APro.board.service.BoardService;

@WebServlet("/announce/*")
public class AnnounceController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = uri.substring(  (contextPath + "/announce/").length()  );
		int cp = 1;
		int type = 0;
		int no = 0;
		
		AnnounceService service = new AnnounceService();
		try {
			
			String path = null;
			HttpSession session = req.getSession();
			if(command.equals("boardList")) {
				type = Integer.parseInt( req.getParameter("type") ); 

				if( req.getParameter("cp") != null ) {
					cp = Integer.parseInt(req.getParameter("cp"));
					System.out.println(cp);
				}
				Map<String, Object> boardList = null;
				if(req.getParameter("anBoardSearch") == null) {
					boardList = service.selectBoardList(type, cp);
					
				}else {
					String searchType = req.getParameter("anBoardSearch");
					String query = req.getParameter("query");
					
					boardList = service.searchBoardList(type, cp, searchType, query);
				}
				req.setAttribute("list", boardList);
				path = "/WEB-INF/views/announce/boardList.jsp";
			}

			if(command.equals("boardList/detail")) {
				no = Integer.parseInt(req.getParameter("no"));
				type = Integer.parseInt(req.getParameter("type"));

				AnBoardDetail detail = service.getBoardDetail(no);
				req.setAttribute("detail", detail);
				path = "/WEB-INF/views/announce/boarDetail.jsp";
			}
			
			if(command.equals("boardList/detail/delete")) {
				type = Integer.parseInt(req.getParameter("type"));
				no = Integer.parseInt(req.getParameter("no"));
				cp = Integer.parseInt(req.getParameter("cp"));
				
				int result = service.deletePost(type,no);
				if(result > 0) {
					path = req.getContextPath() + "/announce/boardList?type="+type+"&cp="+cp;
					session.setAttribute("message", "게시물을 삭제했습니다.");
					resp.sendRedirect(path);
					return;
				}else {
					path = req.getHeader("referer");
					session.setAttribute("message", "게시물 삭제를 실패했습니다.");
					resp.sendRedirect(path);
					return;
				}
			}
			System.out.println(1);
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
