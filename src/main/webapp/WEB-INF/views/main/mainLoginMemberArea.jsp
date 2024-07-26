<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <article class="login-member-area">
        <c:if test="${empty loginMember.profileImage}">
            <a> <img src="${contextPath}/resources/images/user.png" id="login-member-profile-img"></a>
        </c:if>
        <c:if test="${!empty loginMember.profileImage}">
            <a> <img src="${contextPath}${loginMember.profileImage}" id="login-member-profile-img"></a>
        </c:if>
        <div class="login-member-info">
            <div>
            <a href="" id="login-member-nickname">${loginMember.memberNickname}님 환영합니다.</a>
            <a href="member/logout" id="login-member-logout-btn">로그아웃</a>
            </div>
            <p>아이디</p>
        </div>
    </article>