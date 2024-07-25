<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사장님 로그인</title>
    <link rel="stylesheet" href="../resources/css/member/CEO_login.css">
    
    <link rel="stylesheet" href="${contextPath}/resources/css/common/headerLogin.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
</head>
<body>
   <jsp:include page="/WEB-INF/views/common/header.jsp"/>

   <div class="content">
    <form action="${contextPath}/member/login" method="post"onsubmit="return loginValidate()">
        <fieldset>
            <div class="login-box" id="login-box">
                <h1>사장님 로그인</h1>
                <h3>아이디</h3>
                <input type="text" name="inputId" placeholder="4자~20자">
                <h3>비밀번호</h3> 
                <input type="password" name="inputPw" placeholder="8자~16자">
                <span id="find"><a href="${contextPath }/member/findId">아이디</a> <span> | </span> <a href="${contextPath }/member/findPw">비밀번호 찾기</a>
                <button id="signup" type="button"><a href="singUpChoice">회원가입</a></button></span>
                <button id="login">로그인</button>
            </div>
            <input type="text" value="2" id="type" name="type">

            </fieldset>
        </form>
    </div>



    
    <script src="JS/Arbite_login.js"></script>
</body>
</html>