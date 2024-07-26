<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>찾은 회원정보</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/member/select_pw.css">
    
    <link rel="stylesheet" href="${contextPath}/resources/css/common/headerLogin.css">

        <!-- footer css -->
        <link rel="stylesheet" href="${contextPath}/resources/css/common/footer.css">
</head>


<body>
    <div class="container">
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
        <div class="content">
            <form action="changePw" method="post" onsubmit="return pwChngeValidation()">
            <div class="find-box">

                    <h1>비밀번호 변경</h1>
                    <div class="findDiv">
                        <h4>변경할 비밀번호</h4>
                        <input type="text" name="newPw" id="newPw">
                        <span class="newPwMsg" id="newPwMsg"></span>
                        <h4>비밀번호 확인</h4>
                        <input type="text" class="newPwConfirm" id="newPwConfirm">
                        <span class="newPwConMsg" id="newPwConMsg"></span>
                    </div>
					<input type="text" value="${memberId}" name="memberId" class="memberId">
					<div class="btn-area">
                        
                        <button>비밀번호 변경</button>
					</div>
                </div>
            </form>
        </div>
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>    
    </div>

    <script src="${contextPath}/resources/js/lsh/select_pw.js"></script>s
</body>
</html>