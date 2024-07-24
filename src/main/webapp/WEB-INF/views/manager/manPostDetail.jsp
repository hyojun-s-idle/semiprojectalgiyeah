<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>알지예-관리자</title>

    <script src="https://kit.fontawesome.com/58046189b2.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/manager/managerHeader.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/manager/managerOutTopTitle.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/manager/managerPost.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/manager/managerUp.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/footer.css">
</head>
<body id="up">
    <main>
        <jsp:include page="/WEB-INF/views/manager/manHeader.jsp"/>
    
    <div id="header-UP"></div>
    <div class="back-color-manager">
        <div class="title-content-post">신고 게시판 상세 조회</div>
    </div>

    <section class="report-post-suround">
        <table class="reportPost">
            <tr>
                <th>제목</th>
                <td colspan="4">옆집 왜 이러냐</td>
                <th>게시판 번호</th>
                <td colspan="2" id="postGo"><a href="게시판 상세 페이지 이동">1234</a></td>
            </tr>
            <tr>
                <th>닉네임</th>
                <td>방동사장</td>
                <th>회원</th>
                <td>사장</td>
                <th>게시판</th>
                <td>사장 게시판</td>
                <th>카테고리</th>
                <td>요식업</td>
            </tr>
            <tr>
                <th colspan="2">신고 누적</th>
                <td colspan="2">13</td>
                <th colspan="2">작성일자</th>
                <td colspan="2">2024-04-03</td>
            </tr>
            <tr id="postContent">
                <td colspan="8">
                    친구는 세월의 도둑이다.
                    봄부터 흐르는 물은 겨울이 되어도 얼지 않듯이
                    마음에서 우러나오는 우적은 역경이 닥친다고 해서 식지 않는다.
                    불행했을 때 만난 친구는 가장 소중히 여겨야 한다.
                    행복했을 때 함께 기쁨을 누리는 친구보다
                    힘들 떄 슬픔을 덜어지는 친구를 더 많이 신뢰할 수 있다.
                    부유했을 때는 친구를 사귀기 쉽지만,
                    어려울 때는 눈을 씻고 찾아봐도 친구를 찾기 어렵다.
                    누군가 진정한 우정을 나누고 있다 할지라도 그 우정을 지키려면 오랜 시간이 걸린다.
                    짧은 시간 안에 많은 친구를 얻기란 불가능하다. 왜냐하면
                    그들은 진정한 친구가 아니기 때문이다.
                    친구란 말하자면 또 하나의 자신이다.
                    친구를 보면 그 사람을 알 수 있다.
                    현명한 사람과 어리석은 사람은 서로 어울리지 않는다.
                    친구는 나를 동정하는 자가 아니라 나를 돕는 자다.
                    서로가 고통을 덜어 주지 않는다면 우리는 무엇을 위해 사는 것일까?
                    우리는 모두 적막한 세계를 떠도는 나그네다.</td>
            </tr>
        </table>

        <table class="reportReson">
            <tr>
                <th>번호</th>
                <th>신고 내용</th>
                <th>신고 일자</th>
            </tr>
            <tr>
                <td>1</td>
                <td>신고 내용</td>
                <td>2024.07.23</td>
            </tr>
            
        </table>

        <form action="" name="reportPostFormDel">
            <input type="hidden" name="postNum" value="1234">
            <button>삭제하기</button>
        </form>
    </section>
   
        

      
    </section>
    
    <a href="#up" class="fa-solid fa-arrow-up" id="header-up"></a>


    </main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    
</body>
</html>