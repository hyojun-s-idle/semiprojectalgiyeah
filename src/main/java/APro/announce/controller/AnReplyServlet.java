package APro.announce.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import APro.announce.model.service.ReplyService;
import APro.announce.model.vo.Reply;




@WebServlet("/areply/*")
public class AnReplyServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = uri.substring(  (contextPath + "/Areply/").length()  );
		
		ReplyService service = new ReplyService();
		
		try {
			// 댓글 목록 조회 요청인 경우
			if(command.equals("selectReplyList")) {
				
				int boardNo = Integer.parseInt( req.getParameter("boardNo"));
				
				// 댓글 목록 조회 서비스 호출 후 결과 반환 받기
				List<Reply> rList = service.selectReplyList(boardNo);
				
				// JSON 변환 + 응답
				new Gson().toJson(rList, resp.getWriter());
				
			}
			
			if(command.equals("insert")) {
				// 파라미터 얻어오기
				int boardNo = Integer.parseInt( req.getParameter("boardNo"));
				int memberNo = 4;
						//Integer.parseInt( req.getParameter("memberNo"));
				String replyContent = req.getParameter("replyContent");
				System.out.println(boardNo);
				
				// Reply 객체를 생성해서 파라미터 담기
				Reply r = new Reply();
				r.setBoardNo(boardNo);
				r.setMemberNo(memberNo);
				r.setReplyContent(replyContent);
				
				// 댓글 등록 서비스 호출 수 결과 반환 받기
				int result = service.insertReply(r);
				System.out.println(result);
				// 서비스 호출 결과를 그대로 응답 데이터로 내보내기
				resp.getWriter().print(result);
				
				
			}
			
			if(command.equals("delete")){
				int replyNo = Integer.parseInt( req.getParameter("replyNo"));
				
				
				int result = service.deleteReply(replyNo);
				
				resp.getWriter().print(result);
			}
			
			if(command.equals("update")) {
				int replyNo = Integer.parseInt( req.getParameter("replyNo"));
				String content = req.getParameter("content");
				
				int result =service.updateReply(replyNo, content);
				resp.getWriter().print(result);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
