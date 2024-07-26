<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>찾은 회원정보</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/member/select_id.css">
     <!-- footer css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/common/footer.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/headerLogin.css">
</head>


<body>
    <div class="container">
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
        <div class="content">
            <div class="find-box">
                <h1>찾은 ${info}</h1>
                    <div class="findDiv">
                        ${memberInfo}
                    </div>
					
					<div class="btn-area">
					
                    <button type="button" onclick="location.href='${contextPath}'">메인페이지</button>
                    <button type="button" onclick="location.href='loginChoice'">로그인</button>
					</div>
            </div>
        </div>
        <div class="footer">

        </div>
    </div>
</body>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>    

</html>