package APro.main.model.service;

import java.sql.Connection;
import java.util.List;

import APro.main.model.dao.MainDAO;
import APro.main.model.vo.HotPost;

import static APro.common.JDBCTemplate.*;

public class MainService {
	
	MainDAO dao = new MainDAO();

	/**hotPost 조회 Service
	 * @param type
	 * @return list
	 * @throws Exception
	 */
	public List<HotPost> getHotPost(int type) throws Exception {
		
		Connection conn = getConnection();
		
		List<HotPost> list = dao.getHotPost(conn, type);
		
		close(conn);
		
		return list;
	}

	/**좋아요 조회 Service
	 * @param type
	 * @return list
	 * @throws Exception
	 */
	public List<HotPost> getPopBoard(int type) throws Exception {
		
		Connection conn = getConnection();
		
		List<HotPost> list = dao.getPopBoard(conn, type);
		
		close(conn);
				
		return list;
	}

}
