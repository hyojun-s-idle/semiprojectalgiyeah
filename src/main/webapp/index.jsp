<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알지예</title>
<script src="https://kit.fontawesome.com/58046189b2.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/common/headerLogin.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/headerUPslide.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main/main-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main/mainTopNotice.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main/mainHotSlide.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main/main-banner-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main/main-user-login.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main/main-pop-post-title-10.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main/main-login-member-area.css">
</head>
<body>
    <main class="main-suround">
        
        <jsp:include page="/WEB-INF/views/common/header.jsp"/>

        <div class="main-top-notice">
            ! 알림사항 ! 바람직한 인터넷 문화를 위해 생활 속 건전한 인터넷 문화를 만들어 갑시다.
            생활 속 작은 변화가 건강한 사이버 공간을 만듭니다. 인터넷은 우리가 함께 만들어가는 
            소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요.
        </div>
        
        <section class="main-content-suround">
            
            <section class="main-left-side">
                <jsp:include page="/WEB-INF/views/main/mainBanner.jsp"/>

                <jsp:include page="/WEB-INF/views/main/mainHotPost.jsp"/>
            </section>

            <section class="main-right-side">

                <jsp:include page="/WEB-INF/views/main/mainLoginSignUp.jsp"/>

                <jsp:include page="/WEB-INF/views/main/mainLoginMemberArea.jsp"/>

                <jsp:include page="/WEB-INF/views/main/mainPopPostTitle10.jsp"/>


            </section>

        </section>
    </main>

    <script src="${contextPath}/resources/js/common/headerUPSlidAuto.js"></script>
    <script src="${contextPath}/resources/js/main/popTabMenu.js"></script>
    <script src="${contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <script src="${contextPath}/resources/js/jquery.marquee.min.js"></script>
    <script src="${contextPath}/resources/js/headerUPSlidAuto.js"></script>
    <script src="${contextPath}/resources/js/main/mainTopNotice.js"></script>
    <script src="${contextPath}/resources/js/main/mainHotSlide.js"></script>
</body>
</html>