<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    <div id="header-UP" class="all">
    </div>
    <div class="title-back-color all all-box-shadow">
     <div class="title-content-post all-title-boder-bottom" >모두 게시판</div>
    </div>

    <section class="content-suround">
        <div class="post-content-suround">
            <jsp:include page="/WEB-INF/views/board/allTabmenu.jsp"/>
    
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
                        <div class="account-div-catagory">카테고리</div>
                    </div>
                    </a>
                </li>
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
                            <div class="account-div-catagory">카테고리</div>
                        </div>
                    </a>
                </li>
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
                            <div class="account-div-catagory">카테고리</div>
                        </div>
                    </a>
                </li>
                
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
                            <div class="account-div-catagory">카테고리</div>
                        </div>
                    </a>
                </li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
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

    </section>
    <div class="write-suround">
        <div class="fa-solid fa-pen" id="write">
        </div>
        <a href="" id="write-write">글쓰기</a>
    </div>
    <a href="#up" class="fa-solid fa-arrow-up" id="header-up"></a>

    </main>

    <script src="${contextPath}/resources/js/shy/write.js"></script>
    <script src="${contextPath}/resources/js/shy/postContentCut.js"></script>
    <script src="${contextPath}/resources/js/common/headerProfileClick.js"></script>
</body>
</html>