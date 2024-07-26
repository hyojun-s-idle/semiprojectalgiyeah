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

	/** 회원 목록 조회 Service
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

	/**회원 검색 목록 조회 Service
	 * @param cp
	 * @param mSearchCon
	 * @param mSearchConText
	 * @param mSearchMember
	 * @param mSecessoin
	 * @return map
	 * @throws Exception
	 */
	public Map<String, Object> getMemberList(int cp, String mSearchCon, String mSearchConText, int mSearchMember,
			String mSecessoin) throws Exception {
		
		Connection conn = getConnection();
		
		String condition = null;
		
		switch(mSecessoin) {
		case "N" : condition = " WHERE SECESSION_FL = 'N' "; break;
		case "Y" : condition = " WHERE SECESSION_FL = 'Y' "; break;
		
		}
		
		switch(mSearchCon) {
		case "id" : condition += " AND MEMBER_ID LIKE '%"+mSearchConText+"%' "; break;
		case "Nickname" : condition += " AND MEMBER_NICK LIKE '%"+mSearchConText+"%' "; break; 
		case "name" : condition += " AND MEMBER_NM LIKE '%"+mSearchConText+"%' "; break; 
		}
		
		switch(mSearchMember) {
		case 0 : break;
		case 1 : condition += " AND MEMBER_TYPE_CD = 1 "; break;
		case 2 : condition += " AND MEMBER_TYPE_CD = 2 "; break;
		}
		
		int listCount = dao.getSearchCount(conn, condition);
		
		Pagination pagination = new Pagination(cp, listCount);
		
		List<ManMember> list = dao.getSearchList(conn, condition, pagination);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("boardList", list);
		
		close(conn);
		
		return map;
	}

	/** 신고 댓글 검색 조회 Service
	 * @param cp
	 * @param mSearchCon
	 * @param mSearchConText
	 * @param mSearchMember
	 * @param allSearch
	 * @param ceoSearch
	 * @param workerSearch
	 * @param reportNum
	 * @param reportNum2 
	 * @return map
	 * @throws Exception
	 */
	public Map<String, Object> getCommentList(int cp, String mSearchCon, String mSearchConText, int mSearchMember,
			int allSearch, int ceoSearch, int workerSearch, int reportNum1, int reportNum2) throws Exception{
		
		Connection conn = getConnection();
		
		String condition1 = "";
		
		switch(mSearchCon) {
		case "name" : condition1 += " AND MEMBER_NICK LIKE '%"+mSearchConText+"%' "; break;
		case "title" : condition1 += " AND BOARD_TITLE LIKE '%"+mSearchConText+"%' "; break;
		case "content" : condition1 += " REPLY_CONTENT LIKE '%"+mSearchConText+"%' "; break;
		}
		
		
		switch(mSearchMember) {
		case 0 : break;
		case 1 : 
			if(allSearch == 0) {
				condition1 += " AND BT.PR_BOARD = " + mSearchMember;
			}else {
				condition1 += " AND B.BOARD_TYPE_CD =" + allSearch;
			}
			break;
		case 2 : 
			if(workerSearch == 0) {
				condition1 += " AND BT.PR_BOARD = " + mSearchMember;
			}else {
				condition1 += " AND B.BOARD_TYPE_CD =" + workerSearch;
			}
			break;
		case 3 : 
			if(workerSearch == 0) {
				condition1 += " AND BT.PR_BOARD = " + mSearchMember;
			}else {
				condition1 += " AND B.BOARD_TYPE_CD =" + workerSearch;
			}
			break;
		}
		
		if(reportNum2 == 0 || reportNum2 == reportNum1) {
			condition1 += " )A WHERE RCOUNT = " + reportNum1;
		}else {
			condition1 += " )A WHERE RCOUNT BETWEEN " + reportNum1 + " AND " + reportNum2;
		}
		
		int listCount = dao.getSearchCommentCount(conn, condition1);
		
		Pagination pagination = new Pagination(cp, listCount);
		
		List<ManComment> list = dao.getSearchCommentList(conn, pagination, condition1);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("boardList", list);
		
		close(conn);
		
		return map;
	}

	/**신고 게시판 검색 목록 조회
	 * @param cp
	 * @param mSearchCon
	 * @param mSearchConText
	 * @param mSearchMember
	 * @param allSearch
	 * @param ceoSearch
	 * @param workerSearch
	 * @param reportNum
	 * @param reportNum1 
	 * @return map
	 * @throws Exception
	 */
	public Map<String, Object> getPostSearchList(int cp, String mSearchCon, String mSearchConText, int mSearchMember,
			int allSearch, int ceoSearch, int workerSearch, int reportNum1, int reportNum2) throws Exception {
		
		Connection conn = getConnection();
		
		String condition = "";
		
		switch(mSearchCon) {
		case "name" : condition += " AND MEMBER_NICK LIKE '%"+mSearchConText+"%' "; break;
		case "title" : condition += " AND BOARD_TITLE LIKE '%"+mSearchConText+"%' "; break;
		case "content" : condition += " BOARD_CONTENT LIKE '%"+mSearchConText+"%' "; break;
		}
		
		switch(mSearchMember) {
		case 0 : break;
		case 1 : 
			if(allSearch == 0) {
				condition += " AND BT.PR_BOARD = " + mSearchMember;
			}else {
				condition += " AND B.BOARD_TYPE_CD =" + allSearch;
			}
			break;
		case 2 : 
			if(workerSearch == 0) {
				condition += " AND BT.PR_BOARD = " + mSearchMember;
			}else {
				condition += " AND B.BOARD_TYPE_CD =" + workerSearch;
			}
			break;
		case 3 : 
			if(workerSearch == 0) {
				condition += " AND BT.PR_BOARD = " + mSearchMember;
			}else {
				condition += " AND B.BOARD_TYPE_CD =" + workerSearch;
			}
			break;
		}
		
		if(reportNum2 == 0 || reportNum2 == reportNum1) {
			condition += " )A WHERE RCOUNT = " + reportNum1;
		}else {
			condition += " )A WHERE RCOUNT BETWEEN " + reportNum1 + " AND " + reportNum2;
		}
		
		int listCount = dao.getPostSearchCount(conn, condition);
		Pagination pagination = new Pagination(cp, listCount);
		
		List<ManPost> list = dao.getPostSearchDetail(conn, condition, pagination);
		System.out.println(list);
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("boardList", list);
		
		return map;
	}

	/** 신고 댓글 삭제 Service
	 * @param deleteType 
	 * @param boardNo
	 * @param replyNo
	 * @return result
	 * @throws Exception
	 */
	public int deleteReport(int deleteNo, char deleteType) throws Exception {
		
		Connection conn = getConnection();
		
		int result = 0;
		
		if( deleteType == 'r') {
			result = dao.deleteComment(conn, deleteNo);
		}
		
		if(deleteType == 'b') {
			result = dao.deletePost(conn, deleteNo);
			
			if(result > 0) {
				commit(conn);
				result = dao.deletePostComment(conn, deleteNo);
			}
		}
		
		if(result > 0) commit(conn);
		else			rollback(conn);
		
		close(conn);
		
		return result;
	}

}
