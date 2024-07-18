package APro.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/*")
public class MemberController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = url.substring( (contextPath + "/member/").length() );
		
		if(command.equals("singUpChoice")){
			req.getRequestDispatcher("/WEB-INF/views/member/singup_Choice.jsp").forward(req, resp);
		}
		
		if(command.equals("loginChoice")) {
			req.getRequestDispatcher("/WEB-INF/views/member/login_Choice.jsp").forward(req, resp);
		}
		
		if(command.equals("abLogin")) {
			req.getRequestDispatcher("/WEB-INF/views/member/Arbite_login.jsp").forward(req, resp);
		}
		
		if(command.equals("ceoLogin")) {
			req.getRequestDispatcher("/WEB-INF/views/member/CEO_login.jsp").forward(req, resp);
		}
		
		
		if(command.equals("abSignUp")){
			req.getRequestDispatcher("/WEB-INF/views/member/Arbite_signup.jsp").forward(req, resp);
		}
		
		if(command.equals("ceoSignUp")){
			req.getRequestDispatcher("/WEB-INF/views/member/CEO_signup.jsp").forward(req, resp);
		}
		
		if(command.equals("findId")) {
			req.getRequestDispatcher("/WEB-INF/views/member/find_id.jsp").forward(req, resp);
		}
		
		
		if(command.equals("findPw")) {
			req.getRequestDispatcher("/WEB-INF/views/member/find_pw.jsp").forward(req, resp);
		}
		

		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}




