package APro.common;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JDBCTemplate {
	
	private static Connection conn;
	
	public static Connection getConnection() {

		try {

			// JNDI(Java Naming and Directory Interface API)
			// - 이름으로 디렉토리를 찾고 접근하는 API
			// - 디렉토리에 접근하는 Java API
			// - 애플리케이션(프로그램, 웹앱)은 JNDI를 이용해서 파일 또는 서버 Resource를 찾을 수 있음
			
			// javax - 톰캣서버에서 만들어준 객체
			Context initContext = new InitialContext();
			
			// servers -> context.xml 파일 찾기(env == 환경 == 자바의 환경)
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			
			// DBCP 세팅의 <Resource>태그를 찾아 DataSource형식의 객체로 얻어오기
			// DataSource : Contection Pool을 구현하는 객체(Conection 얻어오기 가능)
			DataSource ds = (DataSource)envContext.lookup("jdbc/oracle");
			
			conn = ds.getConnection();
			conn.setAutoCommit(false);

		}catch(Exception e) {
			e.printStackTrace();
		}

		return conn;
	}


	// close() 메소드 작성 (오버로딩 사용)

	// Connection 반환(닫는) 메소드
	public static void close(Connection conn) {

		try {

			// 참조하는 Connection이 있으면서 닫혀있지 않은 경우
			if( conn != null && !conn.isClosed() ) {
				conn.close();
			}

		}catch(Exception e) {
			e.printStackTrace();
		}

	}


	// Statement(부모) , PreparedStatement(자식) 반환(닫는) 메소드(다형성 적용)
	public static void close(Statement stmt) {

		try {

			//참조하는 Statement가 있으면서 닫혀있지 않은 경우
			if( stmt != null && !stmt.isClosed() ) {
				stmt.close();
			}

		}catch(Exception e) {
			e.printStackTrace();
		}


	}


	// ResultSet 반환(닫는) 메소드
	public static void close(ResultSet rs) {

		try {

			//참조하는 ResultSet이 있으면서 닫혀있지 않은 경우
			if( rs != null && !rs.isClosed() ) {
				rs.close();
			}

		}catch(Exception e) {
			e.printStackTrace();
		}


	}


	// 트랜잭션 제어
	
	// commit 메소드
	public static void commit(Connection conn) {

		try {

			//참조하는 Connection가 있으면서 닫혀있지 않은 경우
			if( conn != null && !conn.isClosed() ) {
				conn.commit();
			}

		}catch(Exception e) {
			e.printStackTrace();
		}


	}
	
	// rollback 메소드
	public static void rollback(Connection conn) {

		try {

			//참조하는 Connection가 있으면서 닫혀있지 않은 경우
			if( conn != null && !conn.isClosed() ) {
				conn.rollback();
			}

		}catch(Exception e) {
			e.printStackTrace();
		}


	}

}
