package APro.manager.model.service;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import APro.board.vo.Pagination;
import APro.manager.model.dao.ManagerDAO;
import APro.manager.model.vo.ManComment;
import APro.manager.model.vo.ManCommentDetail;
import APro.manager.model.vo.ManMember;
import APro.manager.model.vo.ManPost;
import APro.manager.model.vo.ManPostDetail;
import APro.manager.model.vo.ReportReson;

import static APro.common.JDBCTemplate.*;

public class ManagerService {
	
	ManagerDAO dao = new ManagerDAO();

	/**신고 댓글 목록 조회 Service
	 * @param cp 
	 * @return map
	 * @throws Exception
	 */
	public Map<String, Object> getCommentList(int cp) throws Exception {
		
		Connection conn = getConnection();
		
		int listCount = dao.getCommentListCount(conn);
		
		Pagination pagination = new Pagination(cp, listCount);
		
		List<ManComment> list = dao.getCommentList(conn, pagination);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("boardList", list);
		
		close(conn);
		
		return map;
	}

	/** 신고 게시판 목록 조회 Service
	 * @param cp
	 * @return map
	 * @throws Exception
	 */
	public Map<String, Object> getPostList(int cp) throws Exception {
		
		Connection conn = getConnection();
		
		int listCount = dao.getPostListCount(conn);
		
		Pagination pagination = new Pagination(cp, listCount);
		
		List<ManPost> list = dao.getPostList(conn, pagination);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("boardList", list);
		
		return map;
	}

	/**신고 댓글 상세 조회 Service
	 * @param boardNo
	 * @param replyNo
	 * @return detail
	 * @throws Exception
	 */
	public ManCommentDetail getCommentDetail(int boardNo, int replyNo) throws Exception {
		
		Connection conn = getConnection();
		
		ManCommentDetail detail = dao.getCommentDetail(conn, replyNo);
		
		List<ReportReson> rList = null;
		
		if(detail != null) {
			rList = dao.getReportReson(conn,replyNo);
			detail.setResonList(rList);
		}
		
		close(conn);
		
		return detail;
	}

	/**신고 게시판 상세 조회 Service
	 * @param boardNo
	 * @return detail
	 * @throws Exception
	 */
	public ManPostDetail getPostDetail(int boardNo) throws Exception {
		Connection conn = getConnection();
				
		ManPostDetail detail = dao.getPostDetail(conn,boardNo);
		
		if(detail != null) {
			List<ReportReson> rList = dao.getReportResonPost(conn, boardNo);
			detail.setrList(rList);
		}
		
		close(conn);
		
		return detail;
	}

	/** 회원 목록 조회
	 * @param cp
	 * @return map
	 * @throws Exception
	 */
	public Map<String, Object> getMemberList(int cp) throws Exception {
		Connection conn = getConnection();
		
		int listCount = dao.getMemberCount(conn);
		
		Pagination pagination = new Pagination(cp, listCount);
		
		List<ManMember> list = dao.getMemberList(conn, pagination);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("boardList", list);
		
		close(conn);
		
		return map;
	}

}
