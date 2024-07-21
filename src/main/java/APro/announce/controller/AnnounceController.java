package APro.announce.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import APro.announce.model.service.AnnounceService;
import APro.board.service.BoardService;

@WebServlet("/announce/*")
public class AnnounceController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = uri.substring(  (contextPath + "/announce/").length()  );
		int cp = 1;
		int cate= 0;
		AnnounceService service = new AnnounceService();
		
		if(command.equals("boardList")) {
			int type = Integer.parseInt( req.getParameter("type") ); 
			
			if( req.getParameter("cp") != null ) {
				cp = Integer.parseInt(req.getParameter("cp"));
				System.out.println(cp);
			}
			
			try {
				Map<String, Object> boardList = service.selectBoardList(type, cp);
				req.setAttribute("list", boardList);
				String path = "/WEB-INF/views/announce/boardList.jsp";
				req.getRequestDispatcher(path).forward(req, resp);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(command.equals("boardList/detail")) {
			String path = "/WEB-INF/views/announce/boarDetail.jsp";
			req.getRequestDispatcher(path).forward(req, resp);
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
