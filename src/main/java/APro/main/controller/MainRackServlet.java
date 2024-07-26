package APro.main.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import APro.main.model.service.MainService;
import APro.main.model.vo.HotPost;

@WebServlet("/hotPost/*")
public class MainRackServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = uri.substring(  (contextPath + "/hotPost/").length()  );
		
		MainService service = new MainService();
		
		try {
			if(command.equals("all")) {
				int type = Integer.parseInt(req.getParameter("type"));
				
				List<HotPost> list = service.getHotPost(type);
				System.out.println(list);
						
				new Gson().toJson(list, resp.getWriter());
			}
			
			if(command.equals("pop")) {
				int type = Integer.parseInt(req.getParameter("type"));
				
				List<HotPost> list = service.getPopBoard(type);
				
				new Gson().toJson(list, resp.getWriter());
			}
			
		}catch(Exception e) {
			
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
