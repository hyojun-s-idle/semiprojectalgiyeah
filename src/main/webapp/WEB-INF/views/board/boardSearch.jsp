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
        <link rel="stylesheet" href="${contextPath}/resources/css/shy/headerUPslide.css">
        <link rel="stylesheet" href="${contextPath}/resources/css/shy/outTopTile.css">
        <link rel="stylesheet" href="${contextPath}/resources/css/shy/tabMenu.css">
        <link rel="stylesheet" href="${contextPath}/resources/css/shy/postContent.css">
        <link rel="stylesheet" href="${contextPath}/resources/css/shy/pagination.css">
        <link rel="stylesheet" href="${contextPath}/resources/css/shy/writeButton.css">
        <link rel="stylesheet" href="${contextPath}/resources/css/shy/headerUpButton.css">
        <link rel="stylesheet" href="${contextPath}/resources/css/shy/nSearch.css">
        <link rel="stylesheet" href="${contextPath}/resources/css/shy/boardSearch.css">
    
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
                <form action="#" name="nSearchForm">
                    <select name="conSearch">
                        <option value="제목">제목</option>
                        <option value="작성자">작성자</option>
                        <option value="내용">내용</option>
                    </select>
        
                    <select name="orderSearch">
                        <option value="최신순">최신순</option> 
                         <option value="조회순">조회순</option>
                        <option value="좋아요순">좋아요순</option>
                    </select>
    
                    <!-- 게시판 카테고리 -->
                    <select name="mSearchMember" id="mSearchMember">
                        <option value="all" selected>모두</option>
                        <option value="worker">알바</option>
                        <option value="ceo">사장</option>
                    </select>
    
                    <select name="allSearch" class="category active">
                        <option value="전체">전체</option>
                        <option value="알바">알바</option>
                        <option value="사장">사장</option>
                        
                    </select>
                
                
                    <select name="businessSearch" class="category">
                        <option value="null">사업별</option>
                        <option value="요식업">요식업</option>
                        <option value="숙박업">숙박업</option>
                        <option value="제조업">제조업</option>
                        <option value="배송업">배송업</option>
                        <option value="정보서비스업">정보서비스업</option>
                        <option value="시설관리업">시설관리업</option>
                        <option value="교육관리업">교육관리업</option>
                        <option value="여가관련업">여가관련업</option>
                        <option value="기타">기타</option>
                    </select>
                
                
                    <select name="rectalSearch" class="category">
                        <option value="null">직종별</option>
                        <option value="외식/음료">외식/음료</option>
                        <option value="매장관리">매장관리</option>
                        <option value="서비스">서비스</option>
                        <option value="사무직">사무직</option>
                        <option value="운전/배달">운전/배달</option>
                        <option value="생산">생산</option>
                        <option value="디자인">디자인</option>
                        <option value="IT">IT</option>
                        <option value="교육">교육</option>
                        <option value="기타">기타</option>
                    </select>
        
                    
                    <input type="search" name="nSearch" placeholder="검색어를 입력해주세요">
        
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
    
        <script src="${contextPath}/resources/js/common/headerProfileClick.js"></script>
        <script src="${contextPath}/resources/js/shy/write.js"></script>
        <script src="${contextPath}/resources/js/shy/postContentCut.js"></script>
        <script src="${contextPath}/resources/js/shy/boardSearch.js"></script>
    </body>
    </html>