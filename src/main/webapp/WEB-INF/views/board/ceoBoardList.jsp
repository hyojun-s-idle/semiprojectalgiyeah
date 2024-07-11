<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <script src="https://kit.fontawesome.com/58046189b2.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/common/headerLogin.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/outTopTile.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/tabMenu.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/postContent.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/pagination.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/writeButton.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/headerUpButton.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/headerUPslide.css">
</head>
<body id="up">
    <main>
        <jsp:include page="/WEB-INF/views/common/header.jsp"/>
        
        <div id="header-UP" class="ceo">
        </div>
        <div class="title-back-color ceo ceo-box-shadow">
            <div class="title-content-post ceo-title-boder-bottom">사장 게시판</div>
        </div>
        <section class="content-suround">
            
            
            <div class="post-content-suround">
                <ul class="tab-menu">
                    <li class="tab-item tab-active"><a href="#all">요식업</a></li>
                    <li class="tab-item"><a href="#worker">숙박업</a></li>
                    <li class="tab-item"><a href="#ced">제조업</a></li>
                    <li class="tab-item"><a href="#deliver">배송업</a></li>
                    <li class="tab-item"><a href="#infor">정보서비스업</a></li>
                    <li class="tab-item"><a href="#facilitie">시설관리업</a></li>
                    <li class="tab-item"><a href="#edu">교육관리업</a></li>
                    <li class="tab-item"><a href="#hobbyIn">여가관련업</a></li>
                    <li class="tab-item"><a href="#ext">기타</a></li>
                </ul>
    
            <ul class="post-content tab-active">
                <li>
                    <a href="" class="post-suround">
                    <div class="title-div">
                        <div class="title">아니다 그들은 커다란 이상</div><div class="date">2024.01.01</div>
                    </div>
                    <div class="content-div">
                        <p class="content">꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다. 
                            사랑의 풀이 없으면 인간은 사막이다. 오아이스도 없는 사빅이다. 
                            보이는 끝까지 찾아다녀도 목</p>
                    </div>
                    <div class="account-div">
                        <div class="account-div-name">
                            <div class="account-img"></div><div class="account-name">계정이름</div>
                        </div>
                        <div class="account-div-category">
                            카테고리
                        </div>
                    </div>
                    </a>
                </li>
                
                <div class="pagination-area">
                    <ul class="pagination">
                        <li><a href="#">&lt;&lt;</a></li>
                        <li><a href="#">&lt;</a></li>

                        <li><a class="current">1</a></li>
                        <li><a href="">2</a></li>
                        <li><a href="">3</a></li>
                        <li><a href="">4</a></li>
                        <li><a href="">5</a></li>
                        <li><a href="">6</a></li>
                        <li><a href="">7</a></li>
                        <li><a href="">8</a></li>
                        <li><a href="">9</a></li>
                        <li><a href="">10</a></li>

                        <li><a href="#">&gt;</a></li>
                        <li><a href="#">&gt;&gt;</a></li>
                    </ul>
                </div>
            </ul>
            

            
        </div>   

        

        
    </section>
    <jsp:include page="/WEB-INF/views/common/write.jsp"/>
    <jsp:include page="/WEB-INF/views/common/toUp.jsp"/>


    </main>

    <script src="${contextPath}/resources/js/shy/write.js"></script>
    <script src="${contextPath}/resources/js/shy/postContentCut.js"></script>
    <script src="${contextPath}/resources/js/common/headerProfileClick.js"></script>
</body>
</html>