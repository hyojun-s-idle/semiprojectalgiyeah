package APro.board.service;

import static APro.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import APro.board.dao.ReplyDAO;
import APro.board.vo.Reply;
import APro.common.Util;

public class ReplyService {
	
	ReplyDAO dao = new ReplyDAO();

	public List<Reply> selectReplyList(int boardNo) throws Exception{
		Connection conn = getConnection();
		List<Reply> rlist = dao.selectReplyList(conn,boardNo);
		close(conn);
		return rlist;
		
		
	}

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

}
