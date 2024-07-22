<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link rel="stylesheet" href="${contextPath}/resources/css/common/headerLogin.css">
    <script src="https://kit.fontawesome.com/58046189b2.js" crossorigin="anonymous"></script>
</head>
<body>
    <main>
        <jsp:include page="/WEB-INF/views/common/header.jsp"/>
        <div id="header-UP" class="all">
        </div>
        <div class="title-color">
         <div class="title-bottom" >공지사항</div>
        </div>

        <section class="board-detail">

            <!-- 제목 -->
            <div class="board-title">${detail.boardTitle}</div>

            <!-- 프로필 + 닉네임 + 작성일 + 조회수 -->
            <div class="board-header">
                <div class="board-writer">
                    <c:if test="${empty detail.profileImage}">
                        <img src="${contextPath}/resources/images/user.png">
                    </c:if>

                    <c:if test="${!empty detail.profileImage}">
                        <img src="${contextPath}%{detail.profileImage}">
                    </c:if>
                    <span>${detail.memberNickname}</span>
                </div>

                <div class="board-info">
                    <p><span>작성일</span> ${detail.createDate}</p>
                    <c:if test="${!empty detail.updateDate}">
                        <p><span>마지막 수정일</span> ${detail.updateDate}</p>
                    </c:if>
                    <p><span>조회수</span> ${detail.readCount}</p>
                </div>
            </div>

            <!-- 내용 -->
            <div class="board-content">
                ${detail.boardContent}
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

                        <c:forEach var="reply" items="${detail.replyList}">
                            <li class="reply-row">
                                <p class="reply-writer">
                                    <c:if test="${empty reply.profileImage}">
                                        <img src="${contextPath}/resources/images/user.png">
                                    </c:if>
                                    <c:if test="${!empty reply.profileImage}">
                                        <img src="${contextPath}${reply.profileImage}">
                                    </c:if>

                                    <span>${reply.memberNickname}</span>
                                    <c:if test="${empty detail.updateDate}">
                                        <span class="reply-date">${reply.createDate}</span>
                                    </c:if>
                                    <c:if test="${!empty detail.updateDate}">
                                        <span class="reply-date">${reply.updateDate}</span>
                                    </c:if>
                                </p>
                
                                <p class="reply-content">
                                    ${reply.replyContent}
                                </p>
                
                                <div class="reply-btn-area">
                                    <button>수정</button>
                                    <button>삭제</button>
                                </div>
                            </li>

                        </c:forEach>
                        
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