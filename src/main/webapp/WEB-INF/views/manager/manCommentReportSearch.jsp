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
    <link rel="stylesheet" href="${contextPath}/resources/css/common/footer.css">
</head>
<body id="up">
    <main>
        <jsp:include page="/WEB-INF/views/manager/manHeader.jsp"/>
    
    <div id="header-UP"></div>
    <div class="back-color-manager">
        <div class="title-content-post">신고 댓글 조회</div>
    </div>

    <jsp:include page="/WEB-INF/views/manager/managerSearchBar.jsp"/>

    <section class="mSearch-complet">
        <table class="mSearchComTable comment">
            <thead>
                <tr>
                    <th>신고<br>누적</th>
                    <th>닉네임</th>
                    <th>회원</th>
                    <th>게시판</th>
                    <th>카테고리</th>
                    <th>게시판<br>번호</th>
                    <th>게시판 제목</th>
                    <th>댓글<br>번호</th>
                    <th>댓글 제목</th>
                    <th>댓글 내용</th>
                    <th>작성일자</th>
                    <th id="ceoNumTitle">비고</th>
                </tr>
            </thead>

            <tbody class="mSearchComResult">
                <tr onclick="location.href='${contextPath}/manager/commentDetail'">
                    <td>13</td>
                    <td>방동사장</td>
                    <td>사장</td>
                    <td>사장 게시판</td>
                    <td>요식업</td>
                    <td>1234</td>
                    <td>옆집 왜이러냐</td>
                    <td>3</td>
                    <td>어쩌라고</td>
                    <td class="contentReport">
                        친구는 세월의 도둑이다.
                        봄부터 흐르는 물은 겨울이 되어도 얼지 않듯이
                        마음에서 우러나오는 우적은 역경이 닥친다고 해서 식지 않는다.
                        
                    </td>
                    <td>2024-04-03</td>
                    <td class="ceoNum">n142536-45778254</td>
                </tr>
                <tr onclick="location.href='${contextPath}/manager/commentDetail'">
                    <td>13</td>
                    <td>방동사장</td>
                    <td>사장</td>
                    <td>사장 게시판</td>
                    <td>요식업</td>
                    <td>1234</td>
                    <td>옆집 왜이러냐</td>
                    <td>3</td>
                    <td>어쩌라고</td>
                    <td class="contentReport">
                        친구는 세월의 도둑이다.
                        봄부터 흐르는 물은 겨울이 되어도 얼지 않듯이
                        마음에서 우러나오는 우적은 역경이 닥친다고 해서 식지 않는다.
                        
                    </td>
                    <td>2024-04-03</td>
                    <td class="ceoNum">n142536-45778254</td>
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
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="${contextPath}/resources/js/shy/managerSearch.js"></script>
    
</body>
</html>