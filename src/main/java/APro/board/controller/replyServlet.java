package APro.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import APro.board.service.ReplyService;
import APro.board.vo.Reply;

@WebServlet("/reply/*")
public class replyServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = uri.substring(  (contextPath + "/reply/").length()  );

		
		ReplyService service=new ReplyService();
		
		try {
			
			//댓글조회
			if(command.equals("selectReplyList")) {
				
				int boardNo=Integer.parseInt(req.getParameter("boardNo"));
				List<Reply> rlist=service.selectReplyList(boardNo);
				
				System.out.println(rlist);
				
				new Gson().toJson(rlist,  resp.getWriter());
				
			}
			
			
			//댓글삽입
			if(command.equals("insert")) {
				
				String replyContent=req.getParameter("replyContent");
				int memberNo=Integer.parseInt(req.getParameter("memberNo"));
				int boardNo=Integer.parseInt(req.getParameter("boardNo"));
				
				Reply reply=new Reply();
				reply.setReplyContent(replyContent);
				reply.setMemberNo(memberNo);
				reply.setBoardNo(boardNo);
				
				int result=service.replyRegister(reply);
				
				resp.getWriter().print(result);
				
			}
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
	
	
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}
}