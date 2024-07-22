package APro.common;

public class Util {
	
	// 개행 문자 -> <br>변경 메소드
	public static String newLineHandling(String content) {
		return content.replaceAll("(\n\r|\r\n|\n|\r)", "<br>");
								// 단일 \n이 먼저 나와 았어 \r\n이 나왔을 때 두번 개행문자를 해석한다.
		// textarea의 엔터 : \r\n
		// \r : 캐리지 리턴(첫번째 돌아가기) -> 옜날 타자기
		// \n : new line(다음줄로 이동)
	}
	
	// Cross Site Scripting(XSS, 크로스 사이트 스크립팅) 공격 방지 처리 메소드
	public static String XSSHandling(String content) {
		// <, >, &, " 문자를 HTML코드가 아닌 문자 그대로 보이도록 변경
		
		// <h1>
		content = content.replaceAll("&", "&amp;"); // <h1>
		content = content.replaceAll("<", "&lt;"); // &lt;h1>
		content = content.replaceAll(">", "&gt;"); // &lt;h1&gt;
		content = content.replaceAll("\"", "&quot;"); // &lt;h1&gt;
		
		return content;
		
	}

}
