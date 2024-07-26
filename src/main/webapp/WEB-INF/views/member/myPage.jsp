<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>알바님 로그인</title>
    
    <link rel="stylesheet" href="${contextPath}/resources/css/member/myPage-style.css">
    <!-- 헤더 css  -->
	<link rel="stylesheet" href="${contextPath}/resources/css/common/headerLogin.css">
	
	 <!-- footer css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/common/footer.css">
	
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
</head>
<body>

<!-- 헤더 -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

     <section class="myPage-content">
            
            <!-- 왼쪽 사이드 메뉴 -->
            <section class="left-side">
                <ul class="list-group">
                    <li><a href="#">프로필</a></li>
                    <li><a href="#">내 정보</a></li>
                    <li><a href="#">비밀번호 변경</a></li>
                    <li><a href="#">회원 탈퇴</a></li>
                </ul>
            </section>

            <!-- 오른쪽 마이페이지 주요 내용 부분 -->
            <section class="myPage-main">
                <h1 class="myPage-title">내 정보</h1>
                <span class="myPage-explanation">원하는 회원 정보를 수정할 수 있습니다.</span>

                <form action="#" method="post" name="myPage-form">
                    <div class="myPage-row">
                        <label>닉네임</label>
                        <input type="text" name="memberNickname" value="로그인 회원 닉네임" maxlength="10">
                    </div>

                    <div class="myPage-row">
                        <label>전화번호</label>
                        <input type="text" name="memberTel" value="01012341234" maxlength="11">
                    </div>

					<div class="myPage-row">
                        <label>직종</label>
                        <input type="text" name="memberNickname" value="로그인 회원 닉네임" maxlength="10">
                    </div>

					<div class="myPage-row">
                        <label>성함</label>
                        <input type="text" name="memberNickname" value="로그인 회원 닉네임" maxlength="10">
                    </div>

					<div class="myPage-row">
                        <label>이메일</label>
                        <input type="text" name="memberNickname" value="로그인 회원 닉네임" maxlength="10">
                    </div>

                    <div class="myPage-row info-title">
                        <span>주소</span>
                    </div>

                    <div class="myPage-row info-address">
                        <input type="text" name="memberAddress" value="우편번호" maxlength="6">

                        <button type="button" id="info-address-btn">검색</button>
                    </div>
                    <div class="myPage-row info-address">
                        <input type="text" name="memberAddress" value="도로명주소">
                    </div>

					<div class="myPage-row info-address">
                        <input type="text" name="memberAddress" value="지번">
                    </div>

                    <div class="myPage-row info-address">
                        <input type="text" name="memberAddress" value="상세주소">
                    </div>

                    <button id="info-update-btn">수정하기</button>
                </form>
            </section>
        </section>


	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    
</body>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>    

</html>