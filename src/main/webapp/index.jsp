<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>








<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알지예</title>

<!-- 헤더 -->
<script src="https://kit.fontawesome.com/58046189b2.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/common/headerLogin.css">

    <!-- 구글아이콘 -->
    <link rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

   <!-- favicon.ico 404 오류우회 -->
   <link rel="shortcut icon" href="#">

    <!-- CSS -->
    <!-- 헤더 -->
    <link rel="stylesheet" href="${contextPath}/resources/css/common/headerLogin.css">

    <!-- 이부분 여쭤보기!!! 헤더 세희님 어느링크인지!!! -->
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/headerUPslide.css">


    <link rel="stylesheet" href="${contextPath}/resources/css/main/main-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main/mainTopNotice.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main/mainHotSlide.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main/main-banner-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main/main-user-login.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main/main-pop-post-title-10.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main/main-login-member-area.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main/graph_minumunWage_housingPrice.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main/graph_minimumWage_Donut.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main/minimumwageNumbering.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main/treemap.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main/jukeBox.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main/mainSide.css">
    
    <link rel="stylesheet" href="${contextPath}/resources/css/main/calc.css">
    
    <!-- footer css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/common/footer.css">

</head>
<body>

    <main class="main-suround">
        
        <jsp:include page="/WEB-INF/views/common/header.jsp"/>

        <div class="main-top-notice">
            ! 알림사항 ! 
            &nbsp;&nbsp;&nbsp;
            바람직한 인터넷 문화를 위해 생활 속 건전한 인터넷 문화를 만들어 갑시다.
            &nbsp;&nbsp;&nbsp;
            생활 속 작은 변화가 건강한 사이버 공간을 만듭니다. 
            &nbsp;&nbsp;&nbsp;
            인터넷은 우리가 함께 만들어가는 
            소중한 공간입니다. 
            &nbsp;&nbsp;&nbsp;
            댓글 작성 시 타인에 대한 배려와 책임을 담아주세요.
        </div>
        
        <section class="main-content-suround">
            
            <section class="main-left-side">
                <jsp:include page="/WEB-INF/views/main/mainBanner.jsp"/>

                <jsp:include page="/WEB-INF/views/main/mainHotPost.jsp"/>
                
                <jsp:include page="/WEB-INF/views/main/mainGraphMinimumWage.jsp"/>


            </section>

            <section class="main-right-side">
				
				<c:if test="${empty loginMember}">
                <jsp:include page="/WEB-INF/views/main/mainLoginSignUp.jsp"/>
				</c:if>
				
				<c:if test="${!empty loginMember}">
				<jsp:include page="/WEB-INF/views/main/mainLoginMemberArea.jsp"/>
				</c:if>
				
                

                <jsp:include page="/WEB-INF/views/main/mainPopPostTitle10.jsp"/>
                
				<!-- 계산기영역-->
                <jsp:include page="/WEB-INF/views/main/calc.jsp"/>
                



                <jsp:include page="/WEB-INF/views/main/mainTreemap.jsp"/>

                <jsp:include page="/WEB-INF/views/main/mainSide.jsp"/>


                <jsp:include page="/WEB-INF/views/main/mainJukeBox.jsp"/>

            </section>
            

        </section>
    </main>


	<!-- footer jsp -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>    

    <!-- JS -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
    integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>


    <!-- 헤더 -->
    <script src="${contextPath}/resources/js/common/headerProfileClick.js"></script>
    <script>
        const contextPath = "${contextPath}";
    </script>
	
    <script src="${contextPath}/resources/js/main/popTabMenu.js"></script>
    <script src="${contextPath}/resources/js/jquery.marquee.min.js"></script>
    <script src="${contextPath}/resources/js/shy/headerUPSlidAuto.js"></script>
    <script src="${contextPath}/resources/js/main/mainTopNotice.js"></script>
    <script src="${contextPath}/resources/js/main/mainHotSlide.js"></script>
    <script src="${contextPath}/resources/js/shy/mainHot.js"></script>
    <script src="${contextPath}/resources/js/shy/mainPop10.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <script src="${contextPath}/resources/js/main/graph_minimumWage.js"></script>
    <script src="${contextPath}/resources/js/main/graph_minumunWage_housingPrice.js"></script>
    <script src="${contextPath}/resources/js/main/graph_minimumWage_Donut.js"></script>
    <script src="${contextPath}/resources/js/main/minimumwageNumbering.js"></script>
    <script src="${contextPath}/resources/js/main/treemap.js"></script>
    <script src="${contextPath}/resources/js/main/jukeBox.js"></script>
	    <script src="${contextPath}/resources/js/main/calc.js"></script>
	
</body>
</html>

