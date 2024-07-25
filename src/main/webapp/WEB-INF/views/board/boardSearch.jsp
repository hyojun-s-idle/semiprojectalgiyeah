<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="boardName" value="${list.boardName}" />
<c:set var="category" value="${list.category}" scope="session"/>
<c:set var="category" value="${category}"/>
<c:set var="pagination" value="${list.pagination}"/>
<c:set var="resultList" value="${list.boardList}"/>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>알지예</title>
    
        <script src="https://kit.fontawesome.com/58046189b2.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="${contextPath}/resources/css/common/headerLogin.css">
        <link rel="stylesheet" href="${contextPath}/resources/css/shy/headerUPslide.css">
        <link rel="stylesheet" href="${contextPath}/resources/css/shy/outTopTile.css">
        <link rel="stylesheet" href="${contextPath}/resources/css/shy/tabMenu.css">
        <link rel="stylesheet" href="${contextPath}/resources/css/shy/postContent.css">
        <link rel="stylesheet" href="${contextPath}/resources/css/shy/pagination.css">
        <link rel="stylesheet" href="${contextPath}/resources/css/shy/writeButton.css">
        <link rel="stylesheet" href="${contextPath}/resources/css/shy/headerUpButton.css">
        <link rel="stylesheet" href="${contextPath}/resources/css/shy/nSearch.css">
        <link rel="stylesheet" href="${contextPath}/resources/css/shy/boardSearch.css">
        <link rel="stylesheet" href="${contextPath}/resources/css/common/footer.css">
    
    </head>
    <body id="up">
        <main>
            <jsp:include page="/WEB-INF/views/common/header.jsp"/>
        
        <div id="header-UP" class="all">
        </div>
        <div class="title-back-color all all-box-shadow">
            <div class="title-content-post all-title-boder-bottom">게시판 검색</div>
        </div>

        <section class="nSearch-section">
            <div class="nSearch-suround all">
                <form action="search" name="nSearchForm" onsubmit="return searchValidate()">
                    <select name="conSearch">
                        
                        <option value="title" >제목</option>
                        <option value="writer" >닉네임</option>
                        <option value="content" >내용</option>
                    </select>
        
    
                    <!-- 게시판 카테고리 -->
                    <select name="mSearchMember" id="mSearchMember">

                        <c:forEach var="i" begin="0" end="2" step="1">
                            <c:set var="cat" value="${category[i]}"/>
                            <c:choose>
                                <c:when test="${param.mSearchMember == i+1}">
                                    <option value="${i+1}" selected>${cat.categoryName}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${i+1}">${cat.categoryName}</option>
                                </c:otherwise>

                            </c:choose>

                        </c:forEach>
                    </select>

                    <select name="allSearch" class="category active">
                        
                        <option value="0" >전체</option>
                        <c:forEach var="i" begin="1" end="2" step="1">
                            <c:set var="cat" value="${category[i]}"/>
                            <c:choose>
                                <c:when test="${param.allSearch == i+1}">
                                    <option value="${i+1}" selected>${cat.categoryName}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${i+1}">${cat.categoryName}</option>
                                </c:otherwise>

                            </c:choose>

                        </c:forEach>
                        
                    </select>
                
                
                    <select name="businessSearch" class="category">
                        
                        <option value="0">전체</option>

                        <c:forEach var="i" begin="13" end="21" step="1">
                            <c:set var="cat" value="${category[i]}"/>
                            <c:choose>
                                <c:when test="${param.businessSearch == i+1}">
                                    <option value="${i+1}" selected>${cat.categoryName}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${i+1}">${cat.categoryName}</option>
                                </c:otherwise>

                            </c:choose>

                        </c:forEach>

                        
                    </select>
                
                
                    <select name="rectalSearch" class="category">
                        
                        <option value="0" >전체</option>

                        <c:forEach var="i" begin="3" end="12" step="1">
                            <c:set var="cat" value="${category[i]}"/>
                            <c:choose>
                                <c:when test="${param.rectalSearch == i+1}">
                                    <option value="${i+1}" selected>${cat.categoryName}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${i+1}">${cat.categoryName}</option>
                                </c:otherwise>

                            </c:choose>

                        </c:forEach>
                        
                    </select>
        
                    
                    <input type="text" name="nSearch" placeholder="검색어를 입력해주세요" id="searchQuery">
        
                    <button class="all2">검색</button>
                </form>
            </div>
        </section>

        <section class="content-suround">
            <div class="post-content-suround">
                <c:if test="${!empty boardName}">
                    <div id="boardSearchTitle">${boardName} 게시판 검색 결과</div>
                </c:if>
        
                <ul class="post-content tab-active">
                    <c:if test="${empty resultList}">
                        <li>검색 결과가 없습니다.</li>
                    </c:if>

                    <c:if test="${!empty resultList}">
                        <c:forEach var="result" items="${resultList}">
                            <li>
                                <a href="" class="post-suround">
                                <div class="title-div">
                                    <div class="title">${result.boardTitle}</div><div class="date">${result.createDate}</div>
                                </div>
                                <div class="content-div">
                                    <p class="content">${result.boardContent}</p>
                                </div>
                                <div class="account-div">
                                    <div class="account-div-name">
                                        <div class="account-img">
                                            <c:if test="${empty board.profileImage}">
                                                <img src="${contextPath}/resources/images/user.png">
                                            </c:if>
                                            <c:if test="${!empty board.profileImage}">
                                                <img src="${contextPath}${result.profileImage}">
                                            </c:if>
                                        </div>
                                        <div class="account-name">${result.memberNickname}</div>
                                    </div>
                                    <div class="account-div-catagory">${result.category}</div>
                                </div>
                                </a>
                            </li>
                        </c:forEach>
                        <div class="pagination-area">
                            
                         
                                <c:set var="url" value="search?conSearch=${param.conSearch}&mSearchMember=${param.mSearchMember}&allSearch=${param.allSearch}&businessSearch=${param.businessSearch}&rectalSearch=${param.rectalSearch}&nSearch=${param.nSearch}&cp="/>
                            

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
                        </div>
                    </c:if>
                    
                
                </ul>
    
        </section>
        <c:remove var="list" scope="session"/>
        
        <jsp:include page="/WEB-INF/views/common/write.jsp"/>
        <jsp:include page="/WEB-INF/views/common/toUp.jsp"/>
    
        </main>
        
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
        <script src="${contextPath}/resources/js/common/headerProfileClick.js"></script>
        <script src="${contextPath}/resources/js/shy/write.js"></script>
        <script src="${contextPath}/resources/js/shy/postContentCut.js"></script>
        <script src="${contextPath}/resources/js/shy/boardSearch.js"></script>
        <script src="${contextPath}/resources/js/shy/boardList.js"></script>
    </body>
    </html>