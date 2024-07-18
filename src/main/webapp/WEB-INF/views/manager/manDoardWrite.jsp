<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
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

        <section class="board-write-suround">
            <form action="" name="boardWrite">
                <div class="board-title-area">
                    <div>제목</div>
                    <input type="text" name="boardTilte" placeholder="제목을 적어주세요.">
                </div>
                <div class="board-write-area">
                    <div class="board-write-content">
                        <textarea name="boardContent" placeholder="내용을 적어주세요."></textarea>
                    </div>
                </div>
                <div class="btn-area">
                    <button>등록하기</button>
                    <button>목록으로</button>
                </div>
            </form>
        </section>

        
        
    </main>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>