<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="header">
	<div class="header-background">
		<div class="header-suround">
			<div class="header-post">
				<a href="${contextPath}" id="logo-header"><img src="${contextPath}/resources/images/logo.png"></a>
				<a href="${contextPath}/board/allList" id="header-all">모두 게시판</a>
				
				<%-- <c:choose> --%>
					<%-- <c:when test=""> --%>
						<a href="${contextPath}/board/workerList" id="header-worker">알바 게시판</a>
					<%-- </c:when> --%>
					<%-- <c:when test=""> --%>
						<a href="${contextPath}/board/ceoList" id="header-ceo">사장 게시판</a>
					<%-- </c:when> --%>
			<%-- 	</c:choose> --%>
				
			</div>
			<div class="header-login">
				<a href="${contextPath}/board/search" id="search-header" class="fa-solid fa-magnifying-glass"></a>
				<%-- <c:choose>
					<c:when test="${!empty loginMember}"> --%>
						<div id="headerProfileWrapper">
							<div id="header-profile"><img src="${contextPath}/resources/images/user.png"></div>
                            <div id="headerProfileHidden">
                                <div><a href="">마이페이지</a></div>
                                <div><a href="">로그아웃</a></div>
                            </div>
                        </div>
				<%-- 	</c:when>
					<c:otherwise> --%>
						<a href="#">회원가입</a>
                        <a href="#">로그인</a>
					
				<%-- 	</c:otherwise>
				</c:choose> --%>

				<a href="${contextPath}/manager/manCommentSearch">매니저페이지</a>
			</div>

		</div>
	</div>

</header>
