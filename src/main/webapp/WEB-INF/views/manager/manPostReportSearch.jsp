<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pagination" value="${list.pagination}"/>
<c:set var="boardList" value="${list.boardList}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>알지예-관리자</title>

    <script src="https://kit.fontawesome.com/58046189b2.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/manager/managerHeader.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/manager/managerOutTopTitle.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/manager/managerSearchTable.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/manager/managerSearchComplet.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/manager/managerPagination.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/manager/managerUp.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/footer.css">
</head>
<body id="up">
    <main>
        <jsp:include page="/WEB-INF/views/manager/manHeader.jsp"/>
    
        <div id="header-UP"></div>
        <div class="back-color-manager">
            <div class="title-content-post">신고 게시판 조회</div>
        </div>

        <section class="mSearch-section">
            <form action="manPostSearch" name="mSearchForm" onsubmit="return searchValidate()">
                <jsp:include page="/WEB-INF/views/manager/managerSearchBar.jsp"/>
            </form>
        </section>
    
        <section class="mSearch-complet">
            <table class="mSearchComTable post">
                <thead>
                    <tr>
                        <th>신고<br> 누적</th>
                        <th>닉네임</th>
                        <th>회원</th>
                        <th>게시판</th>
                        <th>카테고리</th>
                        <th>게시판<br> 번호</th>
                        <th>게시판<br> 제목</th>
                        <th>게시판 내용</th>
                        <th>작성일자</th>
                       
                    </tr>
                </thead>
    
                <tbody class="mSearchComResult">
                    <c:if test="${empty boardList}">
                        <tr><td colspan="9">신고된 게시판이 없습니다.</td></tr>
                    </c:if>

                    <c:if test="${!empty boardList}">
                        <c:forEach var="board" items="${boardList}">
                            <tr onclick="location.href='${contextPath}/manager/postDetail?boardNo=${board.boardNo}&cp=${param.cp}'">
                                <td>${board.reportCount}</td>
                                <td>${board.memberNickname}</td>
                                <td>${board.memberType}</td>
                                <td>${board.boardType} 게시판</td>
                                <td>${board.category}</td>
                                <td>${board.boardNo}</td>
                                <td class="manSTitle">${board.boardTitle}</td>
                                <td class="contentReport">${board.boardContent}</td>
                                <c:if test="${empty board.updateDate}">
                                    <td>${board.createDate}</td>
                                </c:if>
                                <c:if test="${!empty board.updateDate}">
                                    <td>${board.updateDate}</td>
                                </c:if>
                            </tr>
                        </c:forEach>

                    </c:if>
                    
                </tbody>
    
            </table>
            
            <c:if test="${!empty param.mSearchCon}">
                <c:set var="sUrl" value="&mSearchCon=${param.mSearchCon}&mSearchConText=${param.mSearchConText}&mSearchMember=${param.mSearchMember}&allSearch=${param.allSearch}&businessSearch=${param.businessSearch}&rectalSearch=${param.rectalSearch}&reportAccuSearchNum1=${param.reportAccuSearchNum1}&reportAccuSearchNum2=${param.reportAccuSearchNum2}"/>
            </c:if>
            <c:if test="${!empty boardList}">
                <div class="pagination-area">

                    
                    <c:set var="url" value="manPostSearch?cp="/>
                    
                        <ul class="pagination">
                            <li><a href="${url}1${sUrl}">&lt;&lt;</a></li>
                            <li><a href="${url}${pagination.prevPage}${sUrl}">&lt;</a></li>
        
                            <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                                <c:choose>
                                    <c:when test="${pagination.currentPage == i}">
                                        <li><a href="${url}${i}${sUrl}" class="current">${i}</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li><a href="${url}${i}${sUrl}">${i}</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
        
                            <li><a href="${url}${pagination.nextPage}${sUrl}">&gt;</a></li>
                            <li><a href="${url}${pagination.maxPage}${sUrl}">&gt;&gt;</a></li>
                        </ul>
                    
                </div>

            </c:if>

      
    </section>
    
    <a href="#up" class="fa-solid fa-arrow-up" id="header-up"></a>


    </main>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="${contextPath}/resources/js/shy/managerSearch.js"></script>
    
</body>
</html>