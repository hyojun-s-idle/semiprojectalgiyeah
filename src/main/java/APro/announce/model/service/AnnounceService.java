package APro.announce.model.service;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import APro.announce.model.dao.AnnounceDAO;
import APro.announce.model.vo.AnBoardDetail;
import APro.announce.model.vo.AnReply;
import APro.announce.model.vo.AnnounceBoard;
import APro.board.vo.Pagination;

import static APro.common.JDBCTemplate.*;


public class AnnounceService {
	
	AnnounceDAO dao = new AnnounceDAO();

	/**공지사항 목록 조회 Service
	 * @param type
	 * @param cp
	 * @return list
	 * @throws Exception
	 */
	public Map<String, Object> selectBoardList(int type, int cp) throws Exception {
		Connection conn = getConnection();
		
		int listCount = dao.getListCount(conn, type);
		
		Pagination pagination = new Pagination(cp, listCount);
		
		List<AnnounceBoard> boardList = dao.getBoardList(conn, type, pagination);
		
		Map<String, Object> list = new HashMap<>();
		
		list.put("pagination", pagination);
		list.put("boardList", boardList);
		
		close(conn);
		
		return list;
	}

	/**게시물 상세 조회 Service
	 * @param no
	 * @return detail
	 * @throws Exception
	 */
	public AnBoardDetail getBoardDetail(int no) throws Exception {
		
		Connection conn = getConnection();
		
		AnBoardDetail detail = dao.getBoardDetail(conn , no);
		
		int result = dao.setReadCount(conn, no);
		
		if(result > 0) {
			commit(conn);
			
			detail.setReadCount( detail.getReadCount()+1 );
		}else {
			rollback(conn);
		}
		
		List<AnReply> replyList = dao.getReplyList(conn, no);
		detail.setReplyList(replyList);
		
		close(conn);
		
		return detail;
	}

}
