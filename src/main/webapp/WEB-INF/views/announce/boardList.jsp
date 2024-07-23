<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="boardName" value="${list.boardName}"/>
<c:set var="pagination" value="${list.pagination}"/>
<c:set var="boardList" value="${list.boardList}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/boardList-style.css">
    <!-- <link rel="stylesheet" href="${contextPath}/resources/css/shy/manager/managerHeader.css"> -->
    <link rel="stylesheet" href="${contextPath}/resources/css/common/footer.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/annTitle-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/headerLogin.css">
    <script src="https://kit.fontawesome.com/58046189b2.js" crossorigin="anonymous"></script>
</head>
<body>
    <main>
        <jsp:include page="/WEB-INF/views/common/header.jsp"/>
        <!-- <c:if test="${loginMember.memberType == 2 || loginMember.memberType == 3}"> -->
       <!--  </c:if> -->

       <!-- <c:if test="${loginMember.memberType == 0}">
            <jsp:include page="/WEB-INF/views/manager/manHeader.jsp"/>
       </c:if>   -->
        <div id="header-UP" class="all">
        </div>
        <div class="title-color">
         <div class="title-bottom" >공지사항</div>
        </div>

        <section class="board-list">
            <form action="" method="get" id="boardSearch">
                <select name="anBoardSearch">
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                    <option value="titleCon">제목+내용</option>
                </select>
                <input type="text" name="query" placeholder="검색어를 입력해주세요.">
                <button>검색</button>
            </form>

            <div class="list_wrapper">
                <table class="list-table">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성일</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:if test="${empty boardList}">
                            <tr><td colspan="3">게시글이 없습니다.</td></tr>
                        </c:if>

                        <c:if test="${!empty boardList}">
                            <c:forEach var="board" items="${boardList}" varStatus="v">
                                <tr onclick="location.href='boardList/detail?type=23&no=${board.boardNo}&cp=${pagination.currentPage}'">
                                    <td>${v.count}</td>
                                    <td>
                                        ${board.boardTitle}
                                    </td>
                                    <td>${board.createDate}</td>
                                </tr>

                            </c:forEach>
                        </c:if>
                        
                    </tbody>
                </table>
            </div>

            <c:if test="${empty param.cp}">
                <c:set var="cp" value="1"/>
            </c:if>

            <c:if test="${!empty param.cp}">
                <c:set var="cp" value="${param.cp}"/>
            </c:if>
            <div class="btn-area">
                <a href="${contextPath}/manager/manAnnounce/boardWrite?mode=insert&type=${param.type}&cp=${cp}" id="insertBtn">글쓰기</a>
            </div>

            <div class="pagination-area">

                <c:set var="url" value="boardList?type=${param.type}&cp="/>
                    
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
        
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>