package APro.board.service;

import static APro.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import APro.board.dao.ReplyDAO;
import APro.board.vo.Reply;
import APro.common.Util;

public class ReplyService {
	
	ReplyDAO dao = new ReplyDAO();

	/** 댓글조회
	 * @param boardNo
	 * @return
	 * @throws Exception
	 */
	public List<Reply> selectReplyList(int boardNo) throws Exception{
		Connection conn = getConnection();
		List<Reply> rlist = dao.selectReplyList(conn,boardNo);
		close(conn);
		return rlist;
		
		
	}

	/** 댓글등록
	 * @param reply
	 * @return
	 * @throws Exception
	 */
	public int replyRegister(Reply reply) throws Exception {
		Connection conn=getConnection();
		reply.setReplyContent( Util.XSSHandling(reply.getReplyContent())     );
		reply.setReplyContent( Util.newLineHandling(reply.getReplyContent()) );
		int result=dao.replyRegister(conn,reply);
		
		if(result>0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
		
	}

	/** 댓글삭제
	 * @param replyNo
	 * @return
	 * @throws Exception
	 */
	public int replyDelete(int replyNo) throws Exception  {
		Connection conn=getConnection();
		int result=dao.replyDelete(conn,replyNo);
		
		if(result>0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
		
		
	}

	public int replyUpdate(int replyNo, String replyContent) throws Exception {
		Connection conn=getConnection();

		replyContent=Util.XSSHandling(replyContent);
		replyContent=Util.newLineHandling(replyContent);

		int result=dao.replyUpdate(conn,replyNo,replyContent);
		
		if(result>0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
	}

}
