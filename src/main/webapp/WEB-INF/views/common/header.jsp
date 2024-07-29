<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<header class="header">
			<div class="header-background">
				<div class="header-suround">
					<div class="header-post">
						<a href="${contextPath}" id="logo-header"><img
								src="${contextPath}/resources/images/logo.png"></a>

						<!-- <c:set var="type" value="${param.type}" /> -->

						<a href="${contextPath}/board/boardList?type=1" id="header-all">모두 게시판</a>

						<c:if test="${loginMember.memberTypeCode == 1 }">
							<a href="${contextPath}/board/boardList?type=2" id="header-worker">알바 게시판</a>
						</c:if>

						<c:if test="${loginMember.memberTypeCode == 2 }">
							<a href="${contextPath}/board/boardList?type=3" id="header-ceo">사장 게시판</a>
						</c:if>
						<a href="${contextPath}/announce/boardList?type=23" id="heade-announce">공지사항</a>

					</div>
					<div class="header-login">
						<a href="${contextPath}/board/search" id="search-header"
							class="fa-solid fa-magnifying-glass"></a>
					
								<c:if test="${!empty loginMember}">
									<div id="headerProfileWrapper">
										<c:if test="${empty loginMember.profileImage}">
											<div id="header-profile"><img src="${contextPath}/resources/images/user.png">
										</c:if>
										<c:if test="${!empty loginMember.profileImage}">
											<div id="header-profile"><img src="${contextPath}${loginMember.profileImage}">
										</c:if>
										</div>
										<div id="headerProfileHidden">
											<div><a href="">마이페이지</a></div>
											<div><a href="${contextPath}/member/logout">로그아웃</a></div>
										</div>
									</div>
								</c:if>
								
								<c:if test="${empty loginMember}">
									<a href="${contextPath}/member/singUpChoice">회원가입</a>
									<a href="${contextPath}/member/loginChoice">로그인</a>
								</c:if>


								
								<c:if test="${loginMember.memberTypeCode == 0 }">
									<a href="${contextPath}/manager/manCommentSearch">매니저페이지</a>
								</c:if>
											 

					</div>

				</div>
			</div>

		</header>