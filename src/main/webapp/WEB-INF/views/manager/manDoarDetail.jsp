<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/reply-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/annTitle-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/shy/boardDetail-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/footer.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/manager/managerHeader.css">
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

        <section class="board-detail">

            <!-- 제목 -->
            <div class="board-title">제목</div>

            <!-- 프로필 + 닉네임 + 작성일 + 조회수 -->
            <div class="board-header">
                <div class="board-writer">
                    <img src="../resources/images/user.png">
                    <span>운영자</span>
                </div>

                <div class="board-info">
                    <p><span>작성일</span> 2024년 07월 10일 10:16:23</p>
                    <p><span>마지막 수정일</span> 2024년 07월 10일 10:16:23</p>
                    <p><span>조회수</span> 45</p>
                </div>
            </div>

            <!-- 내용 -->
            <div class="board-content">
                내용입니다.<br>
                내용입니다.<br>
                내용입니다.<br>
                내용입니다.<br>
                내용입니다.<br>
                내용입니다.<br>
                내용입니다.<br>
            </div>

            <!-- 버튼 영역 -->
            <div class="board-btn-area">
                <button id="updateBtn">수정</button>
                <button id="delectBtn">삭제</button>
                <button id="goToListBtn">목록으로</button>
            </div>

        </section>

        <div id="reply-area">

            <!-- 댓글 목록 -->
            <div class="reply-list-area">
                <ul id="reply-list">
                    <li class="reply-row">
                        <p class="reply-writer">
                            <img src="${contextPath}/resources/images/user.png">
                            <span>댓글 작성자 닉네임</span>
                            <span class="reply-date">(2024.07.11 10:09:30)</span>
                        </p>
        
                        <p class="reply-content">
                            댓글 내용입니다.<br>
                            댓글 내용입니다.<br>
                        </p>
        
                        <div class="reply-btn-area">
                            <button>수정</button>
                            <button>삭제</button>
                        </div>
                    </li>
                    
                </ul>
        
            </div>
        
            <!-- 댓글 작성 부분 -->
            <div class="reply-write-area">
                <textarea id="replyContent"></textarea>
                <button id="addReply">
                    댓글<br>
                    등록
                </button>
            </div>
            
        </div>
        
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>