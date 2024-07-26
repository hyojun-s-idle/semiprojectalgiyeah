package APro.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import APro.board.service.BoardDetailService;
import APro.board.vo.BoardDetail;
import APro.board.vo.BoardLike;
import APro.board.vo.Reply;
import APro.member.model.vo.Member;

/**
 * 좋아요
 * 
 * @author kis
 * @comment 경로: likeServlet -> BoardDetailService -> BoardDAO -> boardDetail-sql
 *          controller분설 service병합 DAO병합 sql병합
 */
@WebServlet("/like/*")
public class likeServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String uri = req.getRequestURI();
			String contextPath = req.getContextPath();
			String command = uri.substring((contextPath + "/like/").length());

			int boardNo = Integer.parseInt(req.getParameter("boardNo"));

			int memberNo = 0;
			if (req.getSession().getAttribute("loginMember") != null) {
				memberNo = ((Member) req.getSession().getAttribute("loginMember")).getMemberNo();

				
				
				// 좋아요 select (좋아요개수 + 좋아요상태)
				if (command.equals("select")) {

					int likeCount = new BoardDetailService().boardLikeSelect(boardNo);
					int likeState = new BoardDetailService().boardLikeState(boardNo, memberNo);

					BoardLike boardLike = new BoardLike();
					boardLike.setLikeCount(likeCount);
					boardLike.setLikeState(likeState);

					new Gson().toJson(boardLike, resp.getWriter());

				}

				
				
				
				// 좋아요 Up
				if (command.equals("up")) {
					int result = new BoardDetailService().boardLikeUp(boardNo, memberNo);
					resp.getWriter().print(result);
				}

				// 좋아요 Down
				if (command.equals("down")) {
					int result = new BoardDetailService().boardLikeDown(boardNo, memberNo);
					resp.getWriter().print(result);
				}
				
				
				
			}

	
			
			

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
