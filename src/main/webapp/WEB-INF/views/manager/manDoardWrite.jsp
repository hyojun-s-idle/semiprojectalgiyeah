<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>알지예-관리자</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/boardWrite-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/annTitle-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/footer.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/manager/managerHeader.css">
    <script src="https://kit.fontawesome.com/58046189b2.js" crossorigin="anonymous"></script>
</head>
<body>
    <main>
        <jsp:include page="/WEB-INF/views/manager/manHeader.jsp"/>
        <div id="header-UP" class="all">
        </div>
        <div class="title-color">
         <div class="title-bottom" >공지사항</div>
        </div>
        <c:if test="${empty param.no}">
            <c:set var="no" value="1"/>
        </c:if>
        <c:if test="${!empty param.no}">
            <c:set var="no" value="${param.no}"/>
        </c:if>
        <section class="board-write-suround">
            <form action="${contextPath}/manager/manAnnounce/boardWrite?mode=${param.mode}&type=${param.type}&cp=${param.cp}&no=${no}" name="boardWrite" method="post">
                <div class="board-title-area">
                    <div>제목</div>
                    <input type="text" name="boardTitle" placeholder="제목을 적어주세요." value="${detail.boardTitle}" autocomplete="off">
                </div>
                <div class="board-write-area">
                    <div class="board-write-content">
                        <textarea name="boardContent" placeholder="내용을 적어주세요.">${detail.boardContent}</textarea>
                    </div>
                </div>
                <div class="btn-area">
                    <button type="submit" id="writeBtn" onclick="return writeValidate()">등록하기</button>

                    <c:if test="${param.mode == 'insert'}">
                        <button type="button" id="goToListBtn">목록으로</button>
                    </c:if>

                    <c:if test="${param.mode == 'update'}">
                        <button type="button" onclick="location.href='${header.referer}'">이전으로</button>
                    </c:if>
                </div>

                <!-- 가져가야할 값 -->
                 <input type="hidden" name="mode" value="${param.mode}">

                <!-- 공지게시판 -->
                 <input type="hidden" name="type" value="23">

                <!-- 현재 페이지 -->
                <input type="hidden" name="cp" value="${param.cp}">

                <!-- 게시글 번호 -->
                 <input type="hidden" name="no" value="${param.no}">
            </form>
        </section>

        
        
    </main>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="${contextPath}/resources/js/shy/anBoard.js"></script>
    <script src="${contextPath}/resources/js/shy/anBoardWrite.js"></script>
</body>
</html>