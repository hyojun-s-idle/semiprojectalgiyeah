package APro.announce.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
				System.out.println(detail);
				path = "/WEB-INF/views/announce/boarDetail.jsp";
			}
			
			if(command.equals("boardList/anDelete")) {
				type = Integer.parseInt(req.getParameter("type"));
				no = Integer.parseInt(req.getParameter("no"));
				cp = Integer.parseInt(req.getParameter("cp"));
				
				int result = service.deletePost(type,no);
				resp.sendRedirect(req.getContextPath() + "/announce/boardList?cp="+cp+"&type="+type);
				return;
			}
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
