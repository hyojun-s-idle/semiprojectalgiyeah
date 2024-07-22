package APro.board.service;

import static APro.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import APro.board.dao.ReplyDAO;
import APro.board.vo.Reply;

public class ReplyService {
	
	ReplyDAO dao = new ReplyDAO();

	public List<Reply> selectReplyList(int boardNo) throws Exception{
		Connection conn = getConnection();
		List<Reply> rlist = dao.selectReplyList(conn,boardNo);
		close(conn);
		return rlist;
		
		
	}

}
