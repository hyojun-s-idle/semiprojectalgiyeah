<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="boardName" value="${list.boardName}"/>
<c:set var="category" value="${list.category}" scope="request"/>
<c:set var="pagination" value="${list.pagination}"/>
<c:set var="boardList" value="${list.boardList}"/>
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
    <link rel="stylesheet" href="${contextPath}/resources/css/common/footer.css">
</head>
<body id="up">
    <main>
        <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    
    <c:if test="${param.type == 1}">
        <c:set var="headTitle" value="all"/>
    </c:if>
    <c:if test="${param.type == 2}">
        <c:set var="headTitle" value="worker"/>
    </c:if>
    <c:if test="${param.type == 3}">
        <c:set var="headTitle" value="ceo"/>
    </c:if>
    
    <div id="header-UP" class="${headTitle}">
    </div>
    <div class="title-back-color ${headTitle} ${headTitle}-box-shadow">
     <div class="title-content-post ${headTitle}-title-boder-bottom" >${boardName} 게시판</div>
    </div>

    <section class="content-suround">
        <div class="post-content-suround">
            <jsp:include page="/WEB-INF/views/board/tabmenu.jsp"/>
    
            <ul class="post-content tab-active">
                <c:choose>
                    <c:when test="${empty boardList}">
                        <li>게시글이 없습니다.</li>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="board" items="${boardList}">
                            <li>
                                <!-- 테스트용 -->
                                <a href="${contextPath}/board/boardList/detail" class="post-suround">

                                <div class="title-div">
                                    <div class="title">${board.boardTitle}</div><div class="date">${board.createDate}</div>
                                </div>
                                <div class="content-div">
                                    <p class="content">${board.boardContent}</p>
                                </div>
                                <div class="account-div">
                                    <div class="account-div-name">
                                        <div class="account-img">
                                            <c:if test="${empty board.profileImage}">
                                                <img src="${contextPath}/resources/images/user.png">
                                            </c:if>
                                            <c:if test="${!empty board.profileImage}">
                                                <img src="${contextPath}${board.profileImage}">
                                            </c:if>
                                        </div><div class="account-name">${board.memberNickname}</div>
                                    </div>
                                    <div class="account-div-category">
                                        ${board.category}
                                    </div>
                                </div>
                                </a>
                            </li>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
                <div class="pagination-area">

                    <c:if test="${empty param.cate}">
                        <c:set var="url" value="boardList?type=${param.type}&cp="/>
                    </c:if>
                    <c:if test="${!empty param.cate}">
                        <c:set var="url" value="boardList?type=${param.type}&cate=${param.cate}&cp="/>
                    </c:if>

                    <ul class="pagination">
                        <li><a href="${url}1">&lt;&lt;</a></li>
                        <li><a href="${url}${pagination.prevPage}">&lt;</a></li>

                        <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                            <c:choose>
                                <c:when test="${pagination.currentPage == i}">
                                    <li><a href="${url}${i}" class="current">${i}</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="${url}${i}">${i}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        

                        <li><a href="${url}${pagination.nextPage}">&gt;</a></li>
                        <li><a href="${url}${pagination.maxPage}">&gt;&gt;</a></li>
                    </ul>
                </div>

            </section>

            <!--     <div class="write-suround">
        <div class="fa-solid fa-pen" id="write">
        </div>
        <a href="${contextPath}/board/allList/boardWrite" id="write-write">글쓰기</a>
    </div> -->

            <jsp:include page="/WEB-INF/views/common/write.jsp" />
            <jsp:include page="/WEB-INF/views/common/toUp.jsp" />




        </main>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />


    
    </main>
    
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="${contextPath}/resources/js/shy/write.js"></script>
    <script src="${contextPath}/resources/js/shy/postContentCut.js"></script>
    <script src="${contextPath}/resources/js/common/headerProfileClick.js"></script>
</body>
</html>
