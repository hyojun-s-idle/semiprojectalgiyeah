<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

            <!-- url자르기 -->
            <!-- /detail -->
            <c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}" />
            <c:set var="sub" value="${url.substring((contextPath+='/board/').length())}" />
            <c:set var="type" value="${sub.substring(0,sub.length()-7)}" />

            <!-- 변수설정 -->

            <c:set var="type" value="${param.type}" />
            <c:set var="no" value="${param.no}" />





            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Document</title>
                <script src="https://code.jquery.com/jquery-3.7.1.min.js"
                    integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
                <link rel="stylesheet"
                    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

                <!-- 헤더 -->
                <script src="https://kit.fontawesome.com/58046189b2.js" crossorigin="anonymous"></script>

                <link rel="stylesheet" href="${contextPath}/resources/css/common/headerLogin.css">

                <!-- 게시판 -->
                <link rel="stylesheet" href="${contextPath}/resources/css/kis/board.css">
                <link rel="stylesheet" href="${contextPath}/resources/css/kis/board_reply.css">
                <link rel="stylesheet" href="${contextPath}/resources/css/kis/board_replyWrite.css">
                <link rel="stylesheet" href="${contextPath}/resources/css/kis/board_replyNested.css">
                <link rel="stylesheet" href="${contextPath}/resources/css/kis/board_color.css">
                <link rel="stylesheet" href="${contextPath}/resources/css/kis/board_js.css">
                <link rel="stylesheet" href="${contextPath}/resources/css/kis/updateReply.css">





                <!-- 색채 -->
                <c:if test="${type==1}">
                    <style>
                        :root {
                            --clr: var(--all);
                            --clb: var(--alB);
                        }
                    </style>
                </c:if>
                <c:if test="${type==2}">
                    <style>
                        :root {
                            --clr: var(--wor);
                            --clb: var(--woB);
                        }
                    </style>
                </c:if>
                <c:if test="${type==3}">
                    <style>
                        :root {
                            --clr: var(--ceo);
                            --clb: var(--ceB);
                        }
                    </style>
                </c:if>

            </head>


            <!-- 배경색 -->

            <body>

                <jsp:include page="/WEB-INF/views/common/header.jsp" />


                <div class="container">
                    <div class="containerContent">
                        <div class="boardBox" id="boardBox">

                            <!-- 게시글숨김버튼 -->
                            <div class="buttonBox">
                                <button class="button" id="boardButton">
                                    <span class="material-symbols-outlined arrowBoard">
                                        arrow_right

                                    </span>

                                    <!-- <span class="material-symbols-outlined" id="boardButtonLogo">
                                    ad_off
                                </span> -->

                                </button>
                            </div>


                            <!-- 게시판 -->
                            <div class="board" id="board">
                                <div id="boardHeader">
                                    <div class="boardHeaderPart boardHeaderTop">
                                        <div>
                                            <span id="boardNumber">
                                                ${detail.majCategory}
                                            </span>
                                            <span id="boardCategory">
                                                ${detail.subCategory}
                                            </span>
                                            <span id="boardDate">${detail.createDate}</span>
                                        </div>

                                        <!-- 가운데버튼 -->
                                        <div>



                                            <button class="icon liking" type="button">
                                                <p class="numbering"><br></p>
                                                <span class="material-symbols-outlined">
                                                    heart_plus
                                                </span>
                                                <p class="numbering likeNum">${detail.likeCount}</p>
                                            </button>




                                            <button class="icon viewing" type="button">
                                                <p class="numbering"><br></p>
                                                <span class="viewing material-symbols-outlined" id="viewingBoard">
                                                    visibility
                                                </span>
                                                <p class="numbering">${detail.readCount}</p>
                                            </button>

                                            <button class="icon replyCounting" type="button">
                                                <p class="numbering"><br></p>
                                                <span class="material-symbols-outlined ">
                                                    speaker_notes
                                                </span>
                                                <!-- 나중에넣기 -->
                                                <p class="numbering ">${detail.replyCount}</p>

                                            </button>




                                        </div>



                                        <!-- 우측버튼 -->
                                        <div>



                                            <c:if test="${loginMember.memberNo==detail.memberNo}">


                                                <!-- 게시글 삭제버튼 -->
                                                <button class="icon deleting" id="deletingBoard"
                                                    onclick="location.href='detail/delete?type=${type}&no=${no}'">
                                                    <span class="material-symbols-outlined">
                                                        delete
                                                    </span>
                                                </button>

                                                <!-- 게시글 수정버튼 -->
                                                <button class="icon updating" id="updatingBoard"
                                                    onclick="location.href='../write?mode=update&type=${param.type}&cp=${param.cp}&no=${param.no}'">
                                                    <span class="material-symbols-outlined">
                                                        refresh
                                                    </span>
                                                </button>

                                            </c:if>

                                            <button class="icon warning" id="warningBoard">
                                                <span class="material-symbols-outlined">
                                                    warning
                                                </span>
                                            </button>

                                        </div>
                                    </div>
                                    <hr>
                                    <div class="boardHeaderPart boardHeaderMiddle">
                                        <span id="boardDate">
                                            ${detail.boardTitle}
                                        </span>
                                    </div>
                                    <div class="boardHeaderPart boardHeaderBottom">
                                        <div id="boardWriter">
                                            <div id="boardWriterPhotoBox">

                                                <!-- 이미지form -->
                                                <c:if test="${empty detail.profileImage}">
                                                    <img src="${contextPath}/resources/images/user.png"
                                                        id="boardWriterPhoto">
                                                </c:if>
                                                <c:if test="${!empty detail.profileImage}">
                                                    <img src="${contextPath}${detail.profileImage}"
                                                        id="boardWriterPhoto">
                                                </c:if>


                                            </div>


                                            <span>
                                                ${detail.memberNickname}
                                            </span>

                                        </div>
                                    </div>
                                </div>
                                <div id="boardContent">
                                    <p>
                                        ${detail.boardContent}
                                    </p>
                                </div>

                                <div id="boardClick">

                                    <button class="icon boardLiking">
                                        <p><br></p>
                                        <span class="material-symbols-outlined boardLike">
                                            favorite
                                        </span>
                                        <p class="likeNum">${detail.likeCount}</p>
                                    </button>

                                </div>
                            </div>

                        </div>

                        <!-- 댓글박스(전체) -->
                        <div id="replyBox">

                            <!-- 댓글숨김 -->
                            <div class="buttonBox">

                                <button class="button" id="replyMinusButton">
                                    <span class="material-symbols-outlined arrowReplyList">
                                        arrow_right
                                    </span>
                                </button>

                            </div>


                            <!------------------------------------------------------------------------------------------>
                            <!-- 댓글목록 -->



                            <jsp:include page="/WEB-INF/views/board/detail/reply.jsp" />















                        </div>



                        <!-- 댓글작성 버튼-->
                        <div class="buttonBox">
                            <button class="button" id="replyButton">
                                <span class="material-symbols-outlined arrowReplyWriting">
                                    arrow_right
                                </span>
                            </button>
                        </div>

                        <!-- 댓글작성 -->

                        <!-- <div id="replyWrite"> -->
                        <div id="replyWrite" method="get" action="detail">
                            <!-- no도 같이보내는법 -->


                            <div class="replyContentBox">
                                <div class="replyWriterPhotoBox">


                                    <c:if test="${empty loginMember.profileImage}">
                                        <img src="${contextPath}/resources/images/user.png" id="boardWriterPhoto">
                                    </c:if>
                                    <c:if test="${!empty loginMember.profileImage}">
                                        <img src="${contextPath}${loginMember.profileImage}" id="boardWriterPhoto">
                                    </c:if>

                                    <!-- <img src="${contextPath}/resources/images/user.png" id="replyWriterPhoto"> -->

                                </div>
                                <div class="replyView">
                                    <div class="replyWriter" id="replyWriter">
                                        <div>


                                            <span>${loginMember.memberNickname}</span>
                                            <span class="todayDate"></span>


                                        </div>

                                        <!-- 버튼박스 -->
                                        <div class="replyButtonBox replyNestedButtonBox">

                                            <button class="icon deleting deletingReply">
                                                <span class="material-symbols-outlined">
                                                    delete
                                                </span>
                                            </button>
                                            <button class="icon updating">
                                                <span class="material-symbols-outlined">
                                                    refresh
                                                </span>
                                            </button>


                                            <button class="icon warning">
                                                <span class="material-symbols-outlined">
                                                    warning
                                                </span>
                                            </button>



                                            <button class="icon replyingNested">
                                                <span class="rNToggle material-symbols-outlined">
                                                    arrow_right
                                                </span>
                                            </button>

                                        </div>


                                    </div>

                                    <div class="textareaReplyBox">

                                        <textarea name="replycontent" class="textarea textareaReply" id="textareaReply"
                                            rows="7"></textarea>


                                        <!-- 대댓글 추가위해 영역할당 -->
                                        <div class="nestedBox"></div>

                                    </div>






                                    <!-- 숨김용!!!(form) -->
                                    <!-- 대댓글작성 -->
                                    <div class="nested">


                                        <div class="textareaBox replyNestedRight">
                                            <textarea name="" class="textarea textareaReplyNested" rows="2"></textarea>
                                        </div>
                                        <div class="replyNestedRightEnd">
                                            <div class="replyWriterPhotoBox replyNestedWriterPhotoBox">


                                                <img src="${contextPath}/resources/images/user.png"
                                                    id="replyWriterPhoto">


                                            </div>
                                            <span>낭만헌터</span><br>
                                            <span>2024.06.22</span><br>
                                            <button class="replyNestedRegister" id="replyNestedRegister">등록</button>

                                        </div>

                                    </div>




                                </div>
                            </div>

                            <c:if test="${!empty loginMember}">
                                <button class="replyRegister" id="replyRegister" type="submit">등록</button>
                            </c:if>

                            <!-- onclick="location.href='${contextPath}/board/allList/datail/reply/insert?no=${detail.boardNo}'" -->

                        </div>

                    </div>
                </div>



                <script src="${contextPath}/resources/js/kis/board.js"></script>
                <script src="${contextPath}/resources/js/kis/board_mainButton.js"></script>
                <script src="${contextPath}/resources/js/kis/board_boardButton.js"></script>
                <script src="${contextPath}/resources/js/kis/board_replyButton.js"></script>
                <script src="${contextPath}/resources/js/kis/board_replyInnerButton.js"></script>
                <script src="${contextPath}/resources/js/kis/board_replyWrite.js"></script>

                <!-- ajax위한(JS) 변수선언 -->
                <script>
                    // 댓글
                    const contextPath = "${contextPath}";
                    const boardNo = "${detail.boardNo}";
                    const loginMemberNo = "${loginMember.memberNo}";
                    const loginMemberNickname = "${loginMember.memberNickname}";


                </script>
                <script src="${contextPath}/resources/js/kis/reply.js"></script>
                <script src="${contextPath}/resources/js/kis/updateReply.js"></script>
                <script src="${contextPath}/resources/js/kis/like.js"></script>
                <script src="${contextPath}/resources/js/common/headerProfileClick.js"></script>
            </body>

            </html>