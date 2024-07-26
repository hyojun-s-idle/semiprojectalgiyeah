<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 선택</title>

    <link rel="stylesheet" href="../resources/css/member/choice.css">
     <!-- footer css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/common/footer.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/headerLogin.css">
    
<body>
   <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <div class="content">

        <form action="${contextPath}/member/abSignUp">
        <button class="arbite"><h1>알바 회원가입</h1></button>
        </form>

        <form action="${contextPath}/member/ceoSignUp">
        <button class="boss"><h1>사장 회원가입</h1></button>
        </form>

    </div>
</body>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>    

</html>