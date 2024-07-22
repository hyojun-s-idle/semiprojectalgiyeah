package APro.announce.model.service;

import static APro.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import APro.announce.model.dao.ReplyDAO;
import APro.announce.model.vo.Reply;
import APro.common.Util;



public class ReplyService {
	
	private ReplyDAO dao = new ReplyDAO();

	/** 댓글 목록 조회 Service
	 * @param boardNo
	 * @return replyList
	 * @throws Exception
	 */
	public List<Reply> selectReplyList(int boardNo) throws Exception {
		
		Connection conn = getConnection();
		
		List<Reply> replyList = dao.selectReplyList(conn, boardNo);
		
		close(conn);
		
		return replyList;
	}

	/**댓글 등록 Service
	 * @param r
	 * @return result
	 * @throws Exception
	 */
	public int insertReply(Reply r) throws Exception {
		
		Connection conn = getConnection();
		
		r.setReplyContent( Util.XSSHandling(r.getReplyContent()) );
		
		r.setReplyContent( Util.newLineHandling(r.getReplyContent()));
		
		int result = dao.insertReply(r, conn);
		
		if(result > 0) commit(conn);
		else			rollback(conn);
		
		close(conn);
		
		return result;
	}

	/**댓글 삭제 Service
	 * @param replyNo
	 * @return result
	 * @throws Exception
	 */
	public int deleteReply(int replyNo) throws Exception {
		
		Connection conn = getConnection();
		
		int result = dao.deleteReply(conn, replyNo);
		
		if(result > 0) commit(conn);
		else			rollback(conn);
		
		close(conn);
		
		return result;
	}

	/** 댓글 수정 Service
	 * @param rep
	 * @return result
	 * @throws Exception
	 */
	public int updateReply(int replyNo, String content) throws Exception {
		Connection conn = getConnection();
		
		// XSS 처리
		content =  Util.XSSHandling( content );
		
		// 개행문자 처리
		content =  Util.newLineHandling( content );
		
		int result = dao.updateReply(conn, replyNo, content);
		
		if(result > 0) commit(conn);
		else 			rollback(conn);
		
		close(conn);
		
		return result;
	}

	
	

}
