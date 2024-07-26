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
            <div class="title-content-post">회원 조회</div>
        </div>

        <section class="mSearch-section">
            <form action="manMemberSearch" name="mSearchForm" onsubmit="return searchValidate()">
                <table class="mSearchTable">
                    <thead>
                        <tr>
                            <th>검색어</th>
                            <td>
                                <select name="mSearchCon" id="mSearchCon">
                                    <option value="id">아이디</option>
                                    <option value="Nickname">닉네임</option>
                                    <option value="name">이름</option>
                                </select>
                            
                            
                                <input type="search" name="mSearchConText" placeholder="검색어을 입력해주세요.">
                            </td>
                        </tr>
                    </thead>
    
                    <tbody>
                        <tr>
                            <th>회원</th>
                            <td>
                                <select name="mSearchMember" id="mSearchMember">
                                    <option value="0" selected>회원 전체</option>
                                    <option value="1">알바</option>
                                    <option value="2">사장</option>
                                </select>
                            
                            </td>
                        </tr>
                    </tbody>

                    <tfoot>
                        <tr>
                            <th>탈퇴 여부</th>
                            <td>
                                <select name="mSecession" id="mSecession">
                                    <option value="N">N</option>
                                    <option value="Y">Y</option>
                                </select>
                            </td>
                        </tr>
                    </tfoot>
    
                </table>
                <div class="mbtn-suround">
                <button id="btnMSearch">검색</button> <button type="reset">초기화</button>
                </div>
            </form>
        </section>
    
        <section class="mSearch-complet">
            <table class="mSearchComTable">
                <thead>
                    <tr>
                        <th>회원<br> 번호</th>
                        <th>회원 아이디</th>
                        <th>회원</th>
                        <th>이름</th>
                        <th>닉네임</th>
                        <th>전화번호</th>
                        <th>이메일</th>
                        <th>주소</th>
                        <th>탈퇴<br>여부</th>
                        <th >사업번호</th>
                    </tr>
                </thead>
    
                <tbody class="mSearchComResult">

                    <c:if test="${empty boardList}">
                        <tr><td colspan="10">검색 결과가 없습니다.</td></tr>
                    </c:if>

                    <c:if test="${!empty boardList}">
                        <c:forEach var="board" items="${boardList}">
                            <tr onclick="location.href=''">
                                <td>${board.memberNo}</td>
                                <td>${board.memberId}</td>
                                <td class="categoryMember">${board.memberType}</td>
                                <td>${board.memberName}</td>
                                <td>${board.memberNickname}</td>
                                <td>${board.memberTel}</td>
                                <td>${board.memberEmail}</td>
                                <td>${board.memberAddress}</td>
                                <td>${board.secessionFl}</td>
                                <td>${board.bussinessNum}</td>
                            </tr>

                        </c:forEach>
                    </c:if>
                </tbody>
    
            </table>

            <c:if test="${!empty param.mSearchCon}">
                <c:set var="sUrl" value="&mSearchCon=${param.mSearchCon}&mSearchConText=${param.mSearchConText}&mSearchMember=${param.mSearchMember}&mSecession=${param.mSecession}"/>
            </c:if>
            <c:if test="${!empty boardList}">
                <div class="pagination-area">
                    <c:set var="url" value="manMemberSearch?cp="/>
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