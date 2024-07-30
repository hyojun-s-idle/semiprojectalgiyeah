<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My page</title>


    <!-- 사장일 경우 -->
    <c:if test="${loginMember.memberTypeCode == 2}">
        <link rel="stylesheet" href="${contextPath}/resources/css/member/myPage-style2.css">
    </c:if>

    <!-- 알바일 경우 -->
    <c:if test="${loginMember.memberTypeCode == 1}">
        <link rel="stylesheet" href="${contextPath}/resources/css/member/myPage-style.css">
    </c:if>


    <!-- 헤더 css  -->
	<link rel="stylesheet" href="${contextPath}/resources/css/common/headerLogin.css">
	
	 <!-- footer css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/common/footer.css">
    <script src="https://kit.fontawesome.com/58046189b2.js" crossorigin="anonymous"></script>
</head>
<body>

<main>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<section class="myPage-content">

            <!-- 왼쪽 사이드 메뉴 -->
            <section class="left-side">
                <ul class="list-group">
              <li><a href="${contextPath }/member/myPage">내 정보</a></li>
                    <li><a href="${contextPath }/member/myPage/changePw">비밀번호 변경</a></li>
                    <li><a href="${contextPath }/member/myPage/secession">회원 탈퇴</a></li>
                </ul>
            </section>
		
		 <!-- 오른쪽 마이페이지 주요 내용 부분 -->
	            <section class="myPage-main">
	                <h1 class="myPage-title">비밀번호 변경</h1>
	                <span class="myPage-explanation">현재 비밀번호가 일치하는 경우 새 비밀번호로 변경할 수 있습니다.</span>
					
					<form action="MychangePw" method="post" name="myPage-form" onsubmit="return pwValidate()">
					
							<div class="myPage-row ">
								<label>현재 비밀번호</label>
								<input type="password" name="currentPw" id="currentPw" maxlength="30">
							</div>
							<div class="myPage-row">
								<label>새 비밀번호</label>
								<input type="password" name="newPw" maxlength="30">
							</div>
							<div class="myPage-row">
								<label>새 비밀번호 확인</label>
								<input type="password" name="newPwConfirm"  maxlength="30">
							</div>
	                    <button id="info-update-btn">수정하기</button>
	                </form>
	            </section>
	        </section>
		

</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<script src="${contextPath}/resources/js/lsh/myPage.js"></script>

</body>
</html>