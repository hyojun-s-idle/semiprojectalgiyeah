<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>




            <div id="replyList">


                <c:forEach var="reply" items="${rList}">

                    <div class="replyContentBox">
                        <div class="replyWriterPhotoBox">

                            <c:if test="${empty reply.profileImage}">
                                <img src="${contextPath}/resources/images/user.png" id="replyWriterPhoto">
                            </c:if>
                            <c:if test="${!empty reply.profileImage}">
                                <img src="${contextPath}${reply.profileImage}" id="replyWriterPhoto">
                            </c:if>

                        </div>
                        
                        <div class="replyView">

                            <div class="replyWriter" id="replyWriter">
                                <div>
                                    <span>${reply.memberNickname}</span>
                                    <span>${reply.createDate}</span>
                                </div>

                                <div>

                                    <c:if test="${loginMember.memberNo==reply.memberNo}">

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

                                    </c:if>


                                    <button class="icon warning">
                                        <span class="material-symbols-outlined">
                                            warning
                                        </span>
                                    </button>

                                    <button class="icon replyingNested" type="button">
                                        <span class="material-symbols-outlined">
                                            arrow_right
                                        </span>
                                    </button>

                                </div>

                            </div>


                            <div class="replyContent">
                                ${reply.replyContent}


                                <!-- 대댓글박스 -->
                                <div class="nestedBox">

                                </div>

                            </div>


                            <!-- 대댓글작성 -->
                            <div class="nested">

                                <div class="textareaBox replyNestedRight">
                                    <textarea name="" class="textarea textareaReplyNested" rows="2"></textarea>
                                </div>
                                <div class="replyNestedRightEnd">
                                    <div class="replyWriterPhotoBox replyNestedWriterPhotoBox">
                                        <img src="${contextPath}/resources/images/user.png" id="replyWriterPhoto">
                                    </div>
                                    <span>${loginMember.memberNickname}</span><br>
                                    <span class="todayDate"></span><br>
                                    <button class="replyNestedRegister" id="replyNestedRegister">등록</button>
                                </div>

                            </div>



                        </div>

                    </div>

                </c:forEach>

            </div>