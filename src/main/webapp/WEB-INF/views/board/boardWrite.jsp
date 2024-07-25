<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>




<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="${contextPath}/resources/css/kis/boardWrite.css">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <!-- 헤더 -->
    <script src="https://kit.fontawesome.com/58046189b2.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/common/headerLogin.css">
    


</head>


<!-- 배경색 -->
<c:if test="${param.type==1}"><body style="background-color: rgba(5, 146, 18, 0.5);"></c:if>
<c:if test="${param.type==2}"><body style="background-color:  rgba(255, 158, 170, 0.7);"></c:if>
<c:if test="${param.type==3}"><body style="background-color: rgba(75, 112, 245, 0.5); "></c:if>


    <jsp:include page="/WEB-INF/views/common/header.jsp" />


    <div id="mainContainer">

        <form action="write?mode=insert" method="post">

            <!-- 상단 카테고리 -->
            <div id="boardCategory">

                <!-- 게시판종류(고정) -->
                <select class="type" name="" value="">

                    <c:if test="${param.type==1}"><option name="" value="all">모두</option></c:if>
                    <c:if test="${param.type==2}"><option name="" value="worker">알바</option></c:if>
                    <c:if test="${param.type==3}"><option name="" value="ceo">사장</option></c:if>

                </select>





                <!-- 타입선택 -->
                
                <!-- 모두 -->
                <c:if test="${param.type==1}">
                    <select class="all"  name="type">
                        <option name="type" value="2">알바</option>
                        <option name="type" value="3">사장</option>
                    </select>
    
                </c:if>
               

                <!-- 알바 --> 
                 <c:if test="${param.type==2}">
                    <select class="wor"  name="type">
                        <!-- <option selected hidden disabled>직종</option> -->
                        <option name="type" value="4">외식/음료</option>
                        <option name="type" value="5">매장 관리</option>
                        <option name="type" value="6">서비스</option>
                        <option name="type" value="7">사무직</option>
                        <option name="type" value="8">운전/배달</option>
                        <option name="type" value="9">생산</option>
                        <option name="type" value="10">디자인</option>
                        <option name="type" value="11">IT</option>
                        <option name="type" value="12">교육</option>
                        <option name="type" value="13">기타</option>
                    </select>
                 </c:if>
              
               

                <!-- 사장 -->
                <c:if test="${param.type==3}">
                    <select class="ceo"  name="type">
                        <option name="type" value="14">요식업</option>
                        <option name="type" value="15">숙박업</option>
                        <option name="type" value="16">제조업</option>
                        <option name="type" value="17">배송업</option>
                        <option name="type" value="18">정보서비스업</option>
                        <option name="type" value="19">시설관리업</option>
                        <option name="type" value="20">교육관리업</option>
                        <option name="type" value="21">여가관리업</option>
                        <option name="type" value="22">기타</option>
                    </select>
                </c:if>
               

            </div>
            

        
            <div class="boardHeaderPart boardHeaderTop">
                
                <div id="boardNumber">
                    <div>
                        <span  id="boardDate" ></span>
                    </div>
                </div>
                <div id="boardWriter">
                    <div id="boardWriterPhotoBox"><img src="${contextPath}/resources/images/user.png" id="boardWriterPhoto"></div>
                    <span>${loginMember.memberNickname}</span>
                </div>


            </div>

            <div class="container">
                <div class="side">
                    <a href="javascript:window.history.back();" class="sideCircle">
                        <span class="material-symbols-outlined">
                            arrow_left_alt
                        </span>
                    </a>

                </div>

                <!-- 게시글제목 및 내용 -->
                <div class="main">
                    <textarea name="boardTitle" class="textarea" id="textareaTitle" placeholder="Title"></textarea>
                    <textarea name="boardContent" class="textarea" id="textareaContent" placeholder="Content"></textarea>
                </div>
                <div class="side">
                    <button class="sideCircle">
                        <span class="material-symbols-outlined">
                            double_arrow
                        </span>
                    </button>
                </div>
            </div>
        </form>




        <div class="bottom">
            <button class="bottomElement" id="mouseRotate">
                <span class="material-symbols-outlined">
                    mouse
                </span>
            </button>
            <select class="bottomElement bottomSelect" name="" id="">
                <option value="" selected hidden disabled>크기</option>
                <option value="">
                    <h1>1</h1>
                </option>
                <option value="">
                    <h2>2</h2>
                </option>
                <option value="">
                    <h3>3</h3>
                </option>
                <option value="">
                    <h4>4</h4>
                </option>
                <option value="">
                    <h5>5</h5>
                </option>
                <option value="">
                    <h6>6</h6>
                </option>
            </select>
            <select class="bottomElement bottomSelect" name="" id="">
                <option value="" selected hidden disabled><s>굵게</s></option>
                <option value=""><i>기울기</i></option>
                <option value=""><u>밑줄</u></option>
                <option value=""><s>취소선</s></option>
            </select>
            <select class="bottomElement bottomSelect" name="" id="">
                <option value="" selected hidden disabled><span style="">색깔</span></option>
                <option value=""><span style="">글자색</span></option>
                <option value=""><span style="">배경색</span></option>
            </select>
            <select class="bottomElement bottomSelect" name="" id="">
                <option value="" selected hidden disabled>정렬</option>
                <option value="">
                    <p style="text-align: left;">왼쪽</p>
                </option>
                <option value="">
                    <p style="text-align: right;">오른쪽</p>
                </option>
                <option value="">
                    <p style="text-align: center;">가운데</p>
                </option>
                <option value="">
                    <p style="text-align: justify;">양쪽</p>
                </option>
            </select>
            
        </div>




    </div>


    <script src="${contextPath}/resources/js/kis/boardWrite.js"></script>
</body>

</html>