<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="rList" value="${detail.resonList}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>알지예-관리자</title>

    <script src="https://kit.fontawesome.com/58046189b2.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/manager/managerHeader.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/manager/managerOutTopTitle.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/manager/managerComment.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/manager/managerUp.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/footer.css">
</head>
<body id="up">
    <main>
        <jsp:include page="/WEB-INF/views/manager/manHeader.jsp"/>
    
    <div id="header-UP"></div>
    <div class="back-color-manager">
        <div class="title-content-post">신고 댓글 상세 조회</div>
    </div>

    <section class="report-post-suround">
        <table class="reportPost">
            <tr>
                <th colspan="2">댓글 번호</th>
                <td colspan="2" >${detail.replyNo}</td>
                <th colspan="2">게시판 번호</th>
                <td id="postGo" colspan="2">
                    <a href="${contextPath}/board/boardList/detail?&no=${detail.boardNo}">
                        ${detail.boardNo}
                    </a>
                </td>
                
                
            </tr>
            <tr>
                <th>닉네임</th>
                <td>${detail.memberNickname}</td>
                <th>회원</th>
                <td>${detail.memberType}</td>
                <th>게시판</th>
                <td>${detail.boardType} 게시판</td>
                <th>카테고리</th>
                <td>${detail.category}</td>
            </tr>
            <tr>
                <th colspan="2">신고 누적</th>
                <td colspan="2">${detail.replyCount}</td>
                <th colspan="2">작성일자</th>
                <c:if test="${empty detail.updateString}">
                    <td colspan="2">${detail.createDate}</td>
                </c:if>
                <c:if test="${!empty detail.updateString}">
                    <td colspan="2">${detail.updateString}</td>
                </c:if>
            </tr>
            <tr id="postContent">
                <td colspan="8">
                    ${detail.commentContent}</td>
            </tr>
        </table>

        <table class="reportReson">
            <tr>
                <th>번호</th>
                <th>신고 내용</th>
                <th>신고 일자</th>
            </tr>
            <c:forEach var="reson" items="${rList}" varStatus="vs">
                    <tr>
                    <td>${vs.count}</td>
                    <td>${reson.resonReport}</td>
                    <td>${reson.reportDate}</td>

                </tr>
                
                </c:forEach>
        </table>

        <form action="" name="reportComFormDel">
            <input type="hidden" name="postNum" value="1234">
            <input type="hidden" name="commentNum" value="3">
            <button type="button" onclick="location.href='${contextPath}/manager/commentDetail/delete?replyNo=${param.replyNo}&boardNo=${param.boardNo}&cp=${param.cp}'">삭제하기</button>
        </form>
    </section>
   
        

      
    </section>
    
    <a href="#up" class="fa-solid fa-arrow-up" id="header-up"></a>


    </main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
</body>
</html>