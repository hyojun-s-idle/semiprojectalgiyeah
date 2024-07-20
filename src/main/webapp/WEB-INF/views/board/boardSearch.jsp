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
        <c:if test="${param.conSearch == 'title'}">
            <c:set var="tselect" value="selected"/>
        </c:if>
        <c:if test="${param.conSearch == 'writer'}">
            <c:set var="wselect" value="selected"/>
        </c:if>
        <c:if test="${param.conSearch == 'content'}">
            <c:set var="cselect" value="selected"/>
        </c:if>

        <section class="nSearch-section">
            <div class="nSearch-suround all">
                <form action="board/search" name="nSearchForm">
                    <select name="conSearch">
                        
                        <option value="title" ${tselect}>제목</option>
                        <option value="writer" ${wselect}>닉네임</option>
                        <option value="content" ${cselect}>내용</option>
                    </select>
        
    
                    <!-- 게시판 카테고리 -->
                    <select name="mSearchMember" id="mSearchMember">
                        <option value="1">모두</option>
                        <option value="2">알바</option>
                        <option value="3">사장</option>
                    </select>
    
                    <select name="allSearch" class="category active">
                        <option value="0">전체</option>
                        <option value="2">알바</option>
                        <option value="3">사장</option>
                        
                    </select>
                
                
                    <select name="businessSearch" class="category">
                        <option value="0">전체</option>
                        <option value="14">요식업</option>
                        <option value="15">숙박업</option>
                        <option value="16">제조업</option>
                        <option value="17">배송업</option>
                        <option value="18">정보서비스업</option>
                        <option value="19">시설관리업</option>
                        <option value="20">교육관리업</option>
                        <option value="21">여가관련업</option>
                        <option value="22">기타</option>
                    </select>
                
                
                    <select name="rectalSearch" class="category">
                        <option value="0">전체</option>
                        <option value="4">외식/음료</option>
                        <option value="5">매장관리</option>
                        <option value="6">서비스</option>
                        <option value="7">사무직</option>
                        <option value="8">운전/배달</option>
                        <option value="9">생산</option>
                        <option value="10">디자인</option>
                        <option value="11">IT</option>
                        <option value="12">교육</option>
                        <option value="13">기타</option>
                    </select>
        
                    
                    <input type="text" name="nSearch" placeholder="검색어를 입력해주세요">
        
                    <button class="all2">검색</button>
                </form>
            </div>
        </section>
    
        <section class="content-suround">
            <div class="post-content-suround">
                <div id="boardSearchTitle">모두 게시판 검색 결과</div>
        
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
                        <a href="" class="post-suround"></a>
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
        <c:remove var="list" scope="session"/>
        
        <jsp:include page="/WEB-INF/views/common/write.jsp"/>
        <jsp:include page="/WEB-INF/views/common/toUp.jsp"/>
    
        </main>
        
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
        <script src="${contextPath}/resources/js/common/headerProfileClick.js"></script>
        <script src="${contextPath}/resources/js/shy/write.js"></script>
        <script src="${contextPath}/resources/js/shy/postContentCut.js"></script>
        <script src="${contextPath}/resources/js/shy/boardSearch.js"></script>
    </body>
    </html>