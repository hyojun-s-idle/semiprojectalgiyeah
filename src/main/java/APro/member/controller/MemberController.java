package APro.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import APro.member.model.service.MemberService;
import APro.member.model.vo.Member;
import APro.member.model.vo.MemberQA;

@WebServlet("/member/*")
public class MemberController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = url.substring( (contextPath + "/member/").length() );
		// 회원가입 선택 페이지
		if(command.equals("singUpChoice")){
			req.getRequestDispatcher("/WEB-INF/views/member/singup_Choice.jsp").forward(req, resp);
		}
		// 로그인 선택 페이지
		if(command.equals("loginChoice")) {
			req.getRequestDispatcher("/WEB-INF/views/member/login_Choice.jsp").forward(req, resp);
		}
		// 알바 로그인 페이지
		if(command.equals("abLogin")) {
			req.getRequestDispatcher("/WEB-INF/views/member/Arbite_login.jsp").forward(req, resp);
		}
		// 사장 로그인 페이지
		if(command.equals("ceoLogin")) {
			req.getRequestDispatcher("/WEB-INF/views/member/CEO_login.jsp").forward(req, resp);
		}
		// 알바 회원가입 페이지
		if(command.equals("abSignUp")){
			req.getRequestDispatcher("/WEB-INF/views/member/Arbite_signup.jsp").forward(req, resp);
		}

		// 사장 회원가입
		if(command.equals("ceoSignUp")){
			req.getRequestDispatcher("/WEB-INF/views/member/CEO_signup.jsp").forward(req, resp);
		}
		// 아이디 찾기
		if(command.equals("findId")) {

			req.getRequestDispatcher("/WEB-INF/views/member/find_id.jsp").forward(req, resp);

		}

		// 비밀번호 찾기
		if(command.equals("findPw")) {
			req.getRequestDispatcher("/WEB-INF/views/member/find_pw.jsp").forward(req, resp);
		}

		// 마이페이지
		if(command.equals("myPage")) {
			req.getRequestDispatcher("/WEB-INF/views/member/myPage.jsp").forward(req, resp);

		}
		
		// 마이페이지 비밀번호 변경 화면
		if(command.equals("myPage/changePw")) {
			req.getRequestDispatcher("/WEB-INF/views/member/myPage-changePw.jsp").forward(req, resp);

		}
		
		// 마이페이지 회원탈퇴 화면
		if(command.equals("myPage/secession")) {
			req.getRequestDispatcher("/WEB-INF/views/member/myPage-secession.jsp").forward(req, resp);

		}
		
		// 마이페이지 회원탈퇴
		if(command.equals("myPage/Mysecession")) {
			String currentPw = req.getParameter("currentPw");
			
			
			System.out.println(currentPw);
			// 세션 얻어오기
			HttpSession session = req.getSession();
			Member loginMember = (Member)session.getAttribute("loginMember");
			
			int memberNo = loginMember.getMemberNo();
			try {
				MemberService service = new MemberService();
				
				int result = service.memberSecession(currentPw,memberNo);
				
				String path = null; // 리다이렉트 경로

				if(result > 0) {
					// 로그아웃 방법 1
					//path = req.getContextPath() + "/member/logout"; //로그아웃 요청으로 리다이렉트
					
					// 로그아웃 방법 2 
					session.invalidate(); // 세션 무효화
					// -> 세션을 무효화 해버려서 메세지가 전달되지 않는 문제가 발생
					
					// [해결방법]
					// 새로운 세션을 얻어와서 메세지 세팅
					session = req.getSession(); // 무효화 후 새로 생서된 세션 얻어오기
					// 성공 -> 탈퇴 되었습니다. 알림창 출력 후 로그아웃
					session.setAttribute("message", "탈퇴 되었습니다.");
					path = req.getContextPath(); // 메인 페이지
					
					loginMember = (Member)session.getAttribute("loginMember");
					
					Cookie c = new Cookie("saveId", "");// 쿠기 생성
					c.setMaxAge(0); // 쿠기 수명
					c.setPath(req.getContextPath()); // 쿠기 경로 설정
					resp.addCookie(c); // 쿠기 저장

				}else {
					// 실패 -> 비밀번호가 일치하지 않습니다.
					session.setAttribute("message", "비밀번호가 일치하지 않습니다.");
					req.getRequestDispatcher("/WEB-INF/views/member/myPage-secession.jsp").forward(req, resp);
				}
				
				resp.sendRedirect(path);
			}catch(Exception e) {
				
			}

		}
		
		// 마이페이지 비밀번호 변경 
		if(command.equals("myPage/MychangePw")) {
			// 파라미터(현재 비밀번호, 새 비밀번호) 얻어오기
			String currentPw = req.getParameter("currentPw");
			String newPw = req.getParameter("newPw");
			
			System.out.println(currentPw);
			System.out.println(newPw);
			// Session에 있는 loginMember가져오기
			HttpSession session = req.getSession();
			Member loginMember = (Member)session.getAttribute("loginMember");
			
			// ** Service로 전달할 값이 많은데 VO로 해결할 수 없는 경우**
			// 1. 매개변수로 하나하나 따로 전달한다.
			// -> 최대 4개를 넘지 않는 것을 권장 -> 이거 사용
			
			// 2. VO 새로 만들기(1회성으로 사용하면 비효율적)
			
			System.out.println(loginMember.getMemberNo());
			
			try {
				MemberService service = new MemberService();
				
				int result = service.MychangePw(currentPw, newPw, loginMember.getMemberNo());
				
				if(result > 0) {
					// 성공 -> 비밀번호가 변경 되었습니다. (알림)
					// 내 정보 페이지로 돌아오기
					session.setAttribute("message", "비밀번호가 변경되었습니다.");
					resp.sendRedirect(req.getContextPath() + "/member/myPage");
					
				}else {
					// 실패 -> 현재 비밀번호가 일치하지 않습니다.
					// 비밀번호 변경 페이지로 돌아오기
					session.setAttribute("message", "현재 비밀번호가 일치하지 않습니다.");
					resp.sendRedirect(req.getContextPath() + "/member/myPage/changePw");
				}
				
			}catch(Exception e) {
				
			}
			

		}
		
		

		if(command.equals("updateInfo")) {


			// *** 세션에서 로그인한 회원의 정보 얻어오기
			HttpSession session = req.getSession();
			
			String memberNickname = req.getParameter("memberNickname");
			String memberTel = req.getParameter("memberTel");
			String memberJob = req.getParameter("memberJob");
			String memberName = req.getParameter("memberName");
			String memberEmail = req.getParameter("memberEmail");
			String[] address = req.getParameterValues("memberAddress");
			String memberAddress = null;
			
			if(memberJob.equals("1")) {
				Member jobmem = (Member)session.getAttribute("loginMember");
				memberJob = jobmem.getMemberJob();
			}

			if(!address.equals("")) {
				memberAddress = String.join(",,", address);
			}


			// 앝은 복사(세션에 있는 회원 정보 객체 주소)
			// -> loginMember를 수정하면 세션에 저장된 내용이 수정된다!
			Member loginMember = (Member)session.getAttribute("loginMember");

			int memberNo = loginMember.getMemberNo(); // 회원번호 얻어오기

			// 업데이트에 필요한 정보를 모아둔 Member 객체 생성
			Member mem = new Member();
			mem.setMemberNo(memberNo);
			mem.setMemberNickname(memberNickname);
			mem.setMemberTel(memberTel);
			mem.setMemberJob(memberJob);
			mem.setMemberName(memberName);
			mem.setMemberEmail(memberEmail);
			mem.setMemberAddress(memberAddress);


			try {
				MemberService service = new MemberService();

				int result = service.updateMyInfo(mem);

				// 수정 성공/실패에 따른 메시지 출력
				if(result > 0) { // 성공
					session.setAttribute("message", "회원정보 수정을 성공하셨습니다.");

					// DB는 수정되었지만
					// 로그인한 회원 정보가 답겨있는  Session정보는 그대로다!
					// -> 동기화 작업
					loginMember.setMemberNickname(memberNickname);
					loginMember.setMemberTel(memberTel);
					loginMember.setMemberJob(memberJob);
					loginMember.setMemberName(memberName);
					loginMember.setMemberEmail(memberEmail);
					loginMember.setMemberAddress(memberAddress);

				}else { // 실패
					session.setAttribute("message", "회원정보 수정을 실패하셨습니다.");
				}

				// 성공/실패 여부 관계없이 "내 정보" 화면 재요청

				// 절대경로
				resp.sendRedirect(req.getContextPath() + "/member/myPage");

				// 상대경로
				//resp.sendRedirect("info");
			}catch(Exception e) {
				e.printStackTrace();
			}

		}



		// 비밀번호 변경
		if(command.equals("changePw")) {
			String newPw = req.getParameter("newPw");
			String memberId = req.getParameter("memberId");
			System.out.println(newPw);
			System.out.println(memberId);
			MemberService service = new MemberService();
			HttpSession session = req.getSession();

			try {
				int result = service.changePw(newPw, memberId);


				if(result > 0) {
					session.setAttribute("message", "비밀번호가 변경되었습니다.");
				} else {
					session.setAttribute("message", "비밀번호가 변경에 실패하였습니다.");
				}
				resp.sendRedirect(req.getContextPath());
			}catch (Exception e) {
				e.printStackTrace();
			}
		}




		// 찾은 아이디 
		if(command.equals("selectId")) {
			String memberEail = req.getParameter("mamberEmail");
			String memberTel = req.getParameter("memberTel");
			String memberQ = req.getParameter("memberQ");
			String memberA = req.getParameter("memberA");
			System.out.println(memberEail);
			System.out.println(memberTel);
			System.out.println(memberQ);
			System.out.println(memberA);

			MemberService service = new MemberService();
			try {
				String memberId = service.selectId(memberEail,memberTel,memberQ,memberA);

				if(memberId != null) {
					req.setAttribute("memberInfo", memberId);
				}else {
					memberId = "일치하는 회원이 없습니다";
					req.setAttribute("memberInfo", memberId);
				}
				req.setAttribute("info", "아이디");
				req.getRequestDispatcher("/WEB-INF/views/member/select_info.jsp").forward(req, resp);

				System.out.println(memberId);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 찾은 비밀번호
		if(command.equals("selectPw")) {
			String memberId = req.getParameter("memberId");
			String memberTel = req.getParameter("memberTel");
			String memberQ = req.getParameter("memberQ");
			String memberA = req.getParameter("memberA");
			System.out.println(memberId);
			System.out.println(memberTel);
			System.out.println(memberQ);
			System.out.println(memberA);

			MemberService service = new MemberService();

			try {
				int result = service.selectPw(memberId,memberTel,memberQ,memberA);

				System.out.println(result);

				if(result > 0) {
					req.setAttribute("memberId", memberId);
					req.getRequestDispatcher("/WEB-INF/views/member/select_pw.jsp").forward(req, resp);

				} else{
					req.setAttribute("info", "비밀번호");
					req.setAttribute("memberInfo", "일치하는 회원 정보가 없습니다");
					req.getRequestDispatcher("/WEB-INF/views/member/select_info.jsp").forward(req, resp);
				}

			}catch (Exception e) {
				e.printStackTrace();
			}
		}






		// 회원가입
		if(command.equals("signUp")) {
			String memberId = req.getParameter("memberId");
			String memberPw=req.getParameter("memberPw");
			String memberName=req.getParameter("memberName");
			int memberBirth = Integer.parseInt(req.getParameter("memberBirth"));
			String memberEmail = req.getParameter("memberEmail");
			String memberTel=req.getParameter("memberTel");
			String memberNickname=req.getParameter("memberNickname");
			String[] address=req.getParameterValues("memberAddress");
			String memberAddress=String.join(",,", address);
			String memberJob = req.getParameter("memberJob");
			String memberQ = req.getParameter("memberQ");
			String memberA = req.getParameter("memberA");
			int memberTypeCode = Integer.parseInt( req.getParameter("type") );

			if(memberTypeCode == 2) {

			} 

			HttpSession session = req.getSession();
			Member mem = new Member();
			MemberQA qa = new MemberQA();

			mem.setMemberId(memberId);
			mem.setMemberPw(memberPw);
			mem.setMemberName(memberName);
			mem.setMemberBirth(memberBirth);
			mem.setMemberEmail(memberEmail);
			mem.setMemberTel(memberTel);
			mem.setMemberNickname(memberNickname);
			mem.setMemberAddress(memberAddress);
			mem.setMemberJob(memberJob);
			mem.setMemberTypeCode(memberTypeCode);

			if(memberTypeCode == 2) {
				String businessNum = req.getParameter("businessNum");
				mem.setBusinessNum(businessNum);
			}

			qa.setMemberA(memberA);
			qa.setMemberQ(memberQ);

			try {
				//회원가입서비스 호출후 결과반환받기
				MemberService service=new MemberService();

				int result=service.signUp(mem);

				if(result != 0) {
					memberId = mem.getMemberId();
					result = service.updateQa(memberId,qa);
				}




				if(result!=0) {
					session.setAttribute("message", "회원가입에 성공하셨습니다.");
				}else { 
					session.setAttribute("message", "회원가입 실패 ㅠㅠ");
				}
				resp.sendRedirect(req.getContextPath());
			}catch (Exception e) {
				e.printStackTrace();
			}

		}


		// 로그인
		if(command.equals("login")) {
			String inputId = req.getParameter("inputId");
			String inputPw = req.getParameter("inputPw");
			int type = Integer.parseInt( req.getParameter("type") );

			Member mem=new Member();
			mem.setMemberId(inputId);
			mem.setMemberPw(inputPw);


			try {
				MemberService service=new MemberService();
				Member loginMember=service.login(mem,type);

				System.out.println(loginMember);

				HttpSession session=req.getSession();

				if(loginMember==null) {

					session.setAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");

				}else {
					session.setAttribute("loginMember", loginMember);

					if(loginMember.getMemberTypeCode() == 0) {

						String path = req.getContextPath()+"/manager/manPostSearch";
						resp.sendRedirect( path );
						return;
					}

				}

				resp.sendRedirect(req.getContextPath());


			}catch (Exception e) {
				e.printStackTrace();
			}

		}

		// 아이디 중복체크
		if(command.equals("idDupCheck")) {
			String memberId = req.getParameter("memberId");

			try {
				MemberService service = new MemberService();

				int result = service.idDupCheck(memberId);

				resp.getWriter().print(result);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}


		// 닉네임 중복체크
		if(command.equals("nickDupCheck")) {
			String memberNickname = req.getParameter("memberNickname");

			try {
				MemberService service = new MemberService();

				int result = service.nickDupCheck(memberNickname);

				resp.getWriter().print(result);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}



		// 로그아웃
		if(command.equals("logout")) {

			HttpSession session = req.getSession();

			session.invalidate();

			resp.sendRedirect( req.getContextPath() );

		}
	}







	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}




