<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/boardWrite-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/annTitle-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/footer.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/header.css">
    <script src="https://kit.fontawesome.com/58046189b2.js" crossorigin="anonymous"></script>
</head>
<body>
    <main>
        <jsp:include page="/WEB-INF/views/commone/header.jsp"/>
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
                    <div class="board-function">
                        <select name="font-size" id="fontSize">
                            <option>10px</option>
                            <option selected>15px</option>
                            <option>20px</option>
                            <option>25px</option>
                            <option>30px</option>
                            <option>35px</option>
                            <option>40px</option>
                            <option>45px</option>
                        </select>
                        <input type="radio" name="fontStyle" value="bold" id="bold"><label for="bold">가</label>
                        <input type="radio" name="fontStyle" value="italic" id="italic"><label for="italic">가</label>
                        <input type="radio" name="fontStyle" value="underline" id="underline"><label for="underline">가</label>
                    </div>
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