package APro.announce.model.service;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import APro.announce.model.dao.AnnounceDAO;
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

}
