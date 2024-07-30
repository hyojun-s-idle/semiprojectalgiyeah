<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
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
              <li><a href="${contextPath }/member/myPage">내 정보</a></li>
                    <li><a href="${contextPath }/member/myPage/changePw">비밀번호 변경</a></li>
                    <li><a href="${contextPath }/member/myPage/secession">회원 탈퇴</a></li>
                </ul>
            </section>

            <!-- 오른쪽 마이페이지 주요 내용 부분 -->
            <section class="myPage-main">
                <h1 class="myPage-title">내 정보</h1>
                <span class="myPage-explanation">원하는 회원 정보를 수정할 수 있습니다.</span>

                <form action="updateInfo" method="post" name="myPage-form" onsubmit="return infoValidate()">
                    <div class="myPage-row">
                        <label>닉네임</label>
                        <input type="text" name="memberNickname" value="${loginMember.memberNickname }" maxlength="10">
                    </div>

                    <div class="myPage-row">
                        <label>전화번호</label>
                        <input type="text" name="memberTel" value="${loginMember.memberTel }" maxlength="11">
                    </div>
					
					
					<div class="myPage-row">
                        <label class="jobs">직종</label>
                        
                            <!-- 알바일 경우 -->
    					<c:if test="${loginMember.memberTypeCode == 1}">
                        <input type="text" value="${loginMember.memberJob }" maxlength="10">
         					<select name="memberJob" class="select" id="memberJob">
                            <option value="1">직종 변경</option>
                            <option value="외식/음료">외식/음료</option>
                            <option value="매장 관리">매장 관리</option>
                            <option value="서비스">서비스</option>
                            <option value="사무직">사무직</option>
                            <option value="운전/배달">운전/배달</option>
                            <option value="생산">생산</option>
                            <option value="디자인">디자인</option>
                            <option value="IT">IT</option>
                            <option value="교육">교육</option>
                        </select>
                        </c:if>
                        
                        
                        <!-- 사장일 경우 -->
    					<c:if test="${loginMember.memberTypeCode == 2}">
                        <input type="text" value="${loginMember.memberJob }" maxlength="10">
         	             <select name="memberJob" class="select" id="memberJob">
                            <option value="1">직종을 선택해주세요.</option>
                            <option value="요식업">요식업</option>
                            <option value="숙박업">숙박업</option>
                            <option value="제조업">제조업</option>
                            <option value="배송업">배송업</option>
                            <option value="정보서비스업">정보서비스업</option>
                            <option value="시설관리업">시설관리업</option>
                            <option value="교육관리업">교육관리업</option>
                            <option value="여가관련업">여가관련업</option>
                        </select>
                        </c:if>
                        	
                    </div>

					<div class="myPage-row">
                        <label>성함</label>
                        <input type="text" name="memberName" value="${loginMember.memberName }" maxlength="10">
                    </div>

					<div class="myPage-row">
                        <label>이메일</label>
                        <input type="text" name="memberEmail" value="${loginMember.memberEmail }" maxlength="10">
                    </div>

                    <div class="myPage-row info-title">
                        <span>주소</span>
                    </div>
                    
					<c:set var="addr" value="${fn:split(loginMember.memberAddress, ',,') }"/>
					
                    <div class="myPage-row info-address">
                        <input type="text" name="memberAddress" value="${addr[0] }" maxlength="6">

                        <button type="button" id="info-address-btn">검색</button>
                    </div>
                    <div class="myPage-row info-address">
                        <input type="text" name="memberAddress" value="${addr[1] }">
                    </div>

					<div class="myPage-row info-address">
                        <input type="text" name="memberAddress" value="${addr[2] }">
                    </div>

                    <div class="myPage-row info-address">
                        <input type="text" name="memberAddress" value="${addr[3] }">
                    </div>

                    <button id="info-update-btn">수정하기</button>
                </form>
            </section>
        </section>


	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    
</body>

<script src="${contextPath}/resources/js/lsh/myPage.js"></script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>    

</html>