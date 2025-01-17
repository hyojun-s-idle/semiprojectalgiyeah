package APro.common.wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptWrapper extends HttpServletRequestWrapper{

	public EncryptWrapper(HttpServletRequest request) {
		super(request);
	}
	
	@Override
	public String getParameter(String name) {
		

		String value = null;
		
		
		switch(name) {
		case "inputPw":
		case "memberPw":
		case "currentPw":
		case "newPw":
			System.out.println("암호화전 : " +value);
			value = getSha512(super.getParameter(name)); // 암호화 메소드 호출
			System.out.println("암호화후 : " + value);
			break;
			
		// 암호화 되는 경우가 아니라면 기존 getParameter()메소드의 형태를 유지
		default : value = super.getParameter(name);// 원래 기존 값
		}
		return value;
		
	}
	
	private String getSha512(String pw) {
		// 매개변수 pw : 암호화 되기 전 비밀번호
		String encryptPw = null; // 암호화된 비밀번호 저장할 변수
		
		// 1. 해시 함수를 수행할 객체를 참조할 변수 선언
		MessageDigest md = null;
		
		try {// 해시 함수 수행할 수 있는 객체를 얻어올때 문제가 일어남
			
			// 2. SHA-512 방식의 해시 함수를 수행할 수 있는 객체를 얻어옴
			md = MessageDigest.getInstance("SHA-512");
			
			// 3. md를 이용해 암호화를 진행할 수 있도록 pw를 byte[] 형태로 변환
			byte[] bytes = pw.getBytes(Charset.forName("UTF-8"));
			
			// 4. 암호화 수행 -> 암호화 결과가 md 내부에 저장됨
			md.update(bytes);
			
			// 5. 암호화된 비밀번호를 encryptPw에 대입
			// -> byte[]을 String으로 변환해야함
			//    Base64 : byte 코드를 문자열로 변환하는 객체
			encryptPw = Base64.getEncoder().encodeToString(md.digest());
			
			System.out.println("암호화 전 : " + pw);
			System.out.println("암호화 후 : " + encryptPw);
			
			
		}catch(NoSuchAlgorithmException e){
			// SHA-512 해시 함수가 존재하지 않을 때 예외 발생
			e.printStackTrace();
		}
		
		return encryptPw;
	}
}
