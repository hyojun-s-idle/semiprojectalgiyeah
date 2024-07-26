package APro.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
					
					if(loginMember.getMemberTypeCode() == 0) {
						
						String path = req.getContextPath()+"/manager/manPostSearch";
						resp.sendRedirect( path );
						
				}
					session.setAttribute("loginMember", loginMember);
					
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




