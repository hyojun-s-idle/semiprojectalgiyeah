<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <script src="https://kit.fontawesome.com/58046189b2.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/manager/managerHeader.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/manager/managerOutTopTitle.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/manager/managerSearchTable.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/manager/managerSearchComplet.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/manager/managerPagination.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/manager/managerUp.css">
</head>
<body id="up">
    <main>
        <jsp:include page="/WEB-INF/views/manager/manHeader.jsp"/>
    
        <div id="header-UP"></div>
        <div class="back-color-manager">
            <div class="title-content-post">회원 조회</div>
        </div>

        <section class="mSearch-section">
            <form action="" name="mSearchForm">
                <table class="mSearchTable">
                    <thead>
                        <tr>
                            <th>검색어</th>
                            <td>
                                <select name="mSearchCon" id="mSearchCon">
                                    <option value="id">아이디</option>
                                    <option value="name">회원명</option>
                                    <option value="email">이메일</option>
                                    <option value="tel">전화번호</option>
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
                                    <option value="null" selected>회원</option>
                                    <option value="worker">알바</option>
                                    <option value="ceo">사장</option>
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
                            </td>
                        </tr>
                    </tbody>
    
                    <tfoot>
                        <tr>
                            <th>가입날짜</th>
                            <td><input type="text" name="entryDateStart" placeholder="년도-0월-0일" id="entryDateStart"> ~ 
                                <input type="text" name="entryDateEnd" placeholder="년도-0월-0일" id="entryDateEnd">
    
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
                        <th>카테고리</th>
                        <th>가입일</th>
                        <th>이름</th>
                        <th>닉네임</th>
                        <th>전화번호</th>
                        <th>이메일</th>
                        <th>주소</th>
                        <th id="ceoNumTitle">비고</th>
                    </tr>
                </thead>
    
                <tbody class="mSearchComResult">
                    <tr>
                        <td>n1234</td>
                        <td>user01</td>
                        <td class="categoryMember">요식업</td>
                        <td>2024-03-01</td>
                        <td>방방길</td>
                        <td>방길사잗</td>
                        <td>01032569856</td>
                        <td>user01@kh.or.kr</td>
                        <td>대한민국 어딘가 어느시 어느역로</td>
                        <td class="ceoNum">n142536-4578869</td>
                    </tr>
                </tbody>
    
            </table>
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

      
    </section>
    
    <a href="#up" class="fa-solid fa-arrow-up" id="header-up"></a>


    </main>

    <script src="${contextPath}/resources/js/shy/managerSearch.js"></script>
    
</body>
</html>