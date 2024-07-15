<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- url자르기 -->
<!-- /detail -->
<c:set var="sub" value="${requestScope['javax.servlet.forward.request_uri'].substring((contextPath+='/board/').length())}"/>
<c:set var="type" value="${sub.substring(0,sub.length()-7)}"/>
 

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

                <link rel="stylesheet" href="${contextPath}/resources/css/kis/board.css">
                <link rel="stylesheet" href="${contextPath}/resources/css/kis/board_reply.css">
                <link rel="stylesheet" href="${contextPath}/resources/css/kis/board_replyNested.css">
                <link rel="stylesheet" href="${contextPath}/resources/css/kis/board_js.css">

            </head>


       <!-- 배경색 -->
        <c:if test="${type=='allList'}"   ><body style="background-color: rgba(5, 146, 18, 0.3);"></c:if>
        <c:if test="${type=='workerList'}"   ><body style="background-color: rgba(255, 208, 208, 1);"></c:if>
        <c:if test="${type=='ceoList'}"><body style="background-color: rgba(75, 112, 245, 0.3);"></c:if>
        
		

                <jsp:include page="/WEB-INF/views/common/header.jsp" />
                

                <!-- dummy용!!! -->
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
                                            <span id="boardNumber">No. 10000</span>
                                            <span id="boardCategory">외식/음료</span>
                                            <span id="boardDate">2024.06.22</span>



                                        </div>
                                        <div>
                                            <button class="icon liking" type="button">
                                                <p class="numbering"><br></p>
                                                <span class="material-symbols-outlined">
                                                    heart_plus
                                                </span>
                                                <p class="numbering">1</p>
                                            </button>




                                            <button class="icon viewing" type="button">
                                                <p class="numbering"><br></p>
                                                <span class="viewing material-symbols-outlined" id="viewingBoard">
                                                    visibility
                                                </span>
                                                <p class="numbering">1</p>
                                            </button>

                                            <button class="icon replyCounting" type="button">
                                                <p class="numbering"><br></p>
                                                <span class="material-symbols-outlined ">
                                                    speaker_notes
                                                </span>
                                                <p class="numbering ">1</p>
                                            </button>




                                        </div>




                                        <div>
                                            <button class="icon warning" id="warningBoard">
                                                <p class="numbering"><br></p>
                                                <span class="material-symbols-outlined">
                                                    chat_info
                                                </span>
                                                <p class="numbering ">1</p>
                                            </button>
                                            <button class="icon deleting" id="deletingBoard">
                                                <span class="material-symbols-outlined">
                                                    chat_error
                                                </span>
                                            </button>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="boardHeaderPart boardHeaderMiddle">
                                        <span id="boardDate">군에서 부하에게 명령할 때 근거 무조건 알려주면 좋겠다</span>
                                    </div>
                                    <div class="boardHeaderPart boardHeaderBottom">
                                        <div id="boardWriter">
                                            <div id="boardWriterPhotoBox">
                                                <img src="${contextPath}/resources/images/user.png" id="boardWriterPhoto">
                                            </div>
                                            <span>낭만헌터</span>
                                        </div>
                                    </div>
                                </div>
                                <div id="boardContent">
                                    <p>
                                        인권에 대한 무시와 경멸이 인류의 양심을 격분시키는 만행을 초래하였으며, 인간이 언론과 신앙의 자유, 그리고
                                        공포와ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                        1sdsadsㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                        1sdsadsㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                        1sdsadsㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                        1sdsadsㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                        1sdsadsㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                        <br>
                                        1sdsadsㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                        1sdsadsㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                        1sdsadsㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                        1sdsadsㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                        1sdsadsㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                        <br>
                                        1sdsadsㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁadasdas <br>

                                        ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                        1sdsadsㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                        1sdsadsㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                        <br>
                                        1sdsadsㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                        1sdsadsㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                        1sdsadsㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                        1sdsadsㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                        1sdsadsㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                        1sdsadsㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ


                                        1sdsadsㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                    </p>
                                </div>

                                <div id="boardClick">

                                    <button class="icon boardLiking">
                                        <p><br></p>
                                        <span class="material-symbols-outlined boardLike">
                                            favorite
                                        </span>
                                        <p>1</p>
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
                            <div id="replyList">



                           

                                
                                <div class="replyContentBox">
                                    <div class="replyWriterPhotoBox">
                                        <img src="${contextPath}/resources/images/user.png" id="replyWriterPhoto">
                                    </div>
                                    <div class="replyView">

                                        <div class="replyWriter" id="replyWriter">
                                            <div>
                                                <span>낭만헌터</span>
                                                <span>2024.06.22</span>
                                            </div>
                                            <div>
                                                <button class="icon liking" type="button">
                                                    <span class="material-symbols-outlined">
                                                        heart_plus
                                                    </span>
                                                </button>


                                                <button class="icon warning">
                                                    <span class="material-symbols-outlined">
                                                        chat_info
                                                    </span>
                                                </button>
                                                <button class="icon deleting deletingReply">
                                                    <span class="material-symbols-outlined">
                                                        chat_error
                                                    </span>
                                                </button>
                                            </div>
                                        </div>

                                        <div class="replyContent">
                                            댓글박스
                                            ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                            ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                            ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                            ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                            ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                            ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                            ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                            ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                            ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                            ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                            ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ

                                            ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                            ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                            ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                            ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                            ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                            ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                            ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                            ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                            ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                            ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                            ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                            ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                            ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
                                            <div class="replyNestedBox">








                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>

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
                        <div id="replyWrite">
                            <div class="replyContentBox">
                                <div class="replyWriterPhotoBox">
                                    <img src="${contextPath}/resources/images/user.png" id="replyWriterPhoto">
                                </div>
                                <div class="replyView">
                                    <div class="replyWriter" id="replyWriter">
                                        <div>
                                            <span>낭만헌터</span>
                                            <span>2024.06.22</span>
                                        </div>

                                        <!-- 버튼박스 -->
                                        <div class="replyButtonBox">
                                            <button class="icon deleting deletingReply">
                                                <span class="material-symbols-outlined">
                                                    chat_error
                                                </span>
                                            </button>
                                            <button class="icon warning">
                                                <span class="material-symbols-outlined">
                                                    chat_info
                                                </span>
                                            </button>
                                            <button class="icon liking" type="button">
                                                <span class="material-symbols-outlined">
                                                    heart_plus
                                                </span>
                                            </button>


                                        </div>
                                    </div>

                                    <div class="textareaReplyBox">
                                        <textarea name="" class="textarea textareaReply" id="textareaReply"
                                            rows="7"></textarea>
                                        <!-- 대댓글 추가위해 영역할당 -->
                                        <div class="replyNestedBox"></div>

                                    </div>

                                    <!-- 토글버튼 -->
                                    <div class="replyNestedButtonBox">
                                        <button class="icon replyingNested" type="button">
                                            <span class="material-symbols-outlined">
                                                arrow_top_right

                                            </span>
                                        </button>
                                    </div>

                                    <!-- 대댓글작성 -->
                                    <div class="replyNestedRightBox">

                                        <div class="textareaBox replyNestedRight">
                                            <textarea name="" class="textarea" rows="2"></textarea>
                                        </div>
                                        <div class="replyNestedRightEnd">
                                            <div class="replyWriterPhotoBox replyNestedWriterPhotoBox">
                                                <img src="${contextPath}/resources/images/user.png" id="replyWriterPhoto">
                                            </div>
                                            <span>낭만헌터</span><br>
                                            <span>2024.06.22</span><br>
                                            <button class="replyNestedRegister" id="replyNestedRegister">등록</button>
                                        </div>

                                    </div>




                                </div>
                            </div>

                            <button class="replyRegister" id="replyRegister">등록</button>

                        </div>
                    </div>
                </div>




                <script src="${contextPath}/resources/js/kis/board.js"></script>
                <script src="${contextPath}/resources/js/kis/board_mainButton.js"></script>
                <script src="${contextPath}/resources/js/kis/board_boardButton.js"></script>
                <script src="${contextPath}/resources/js/kis/board_replyButton.js"></script>
                <script src="${contextPath}/resources/js/kis/board_replyInnerButton.js"></script>
            </body>

            </html>