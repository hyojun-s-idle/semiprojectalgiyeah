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

<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp" />


    <div id="mainContainer">

        <form action="게시판.html">


            <div id="boardCategory">

                <!-- 게시판선택 -->
                <!-- 알바 -->
                <select class="alba" id="albaBoardSelect" name="boardType">
                    <option selected hidden disabled>종류</option>
                    <option name="boardType" value="알바">알바</option>
                    <option name="boardType" value="모두">모두</option>
                </select>


                <select class="alba" id="albaSelect" name="occupationType">
                    <option selected hidden disabled>직종</option>
                    <option name="occupationType" value="외식/음료">외식/음료</option>
                    <option name="occupationType" value="매장 관리">매장 관리</option>
                    <option name="occupationType" value="서비스">서비스</option>
                    <option name="occupationType" value="사무직">사무직</option>
                    <option name="occupationType" value="운전/배달">운전/배달</option>
                    <option name="occupationType" value="생산">생산</option>
                    <option name="occupationType" value="디자인">디자인</option>
                    <option name="occupationType" value="IT">IT</option>
                    <option name="occupationType" value="교육">교육</option>
                </select>
                <!-- 사장 -->


                <select class="sajang" id="sajangBoardSelect" name="boardType">
                    <option selected hidden disabled>게시판</option>
                    <option name="boardType" value="사장">사장</option>
                    <option name="boardType" value="모두">모두</option>
                </select>
                <select class="sajang" id="sajangSelect" name="businessType">
                    <option selected hidden disabled>사업</option>
                    <option name="businessType" value="요식업">요식업</option>
                    <option name="businessType" value="숙박업">숙박업</option>
                    <option name="businessType" value="제조업">제조업</option>
                    <option name="businessType" value="배송업">배송업</option>
                    <option name="businessType" value="정보서비스업">정보서비스업</option>
                    <option name="businessType" value="시설관리업">시설관리업</option>
                    <option name="businessType" value="교육관리업">교육관리업</option>
                    <option name="businessType" value="기타">기타</option>
                </select>

            </div>
            <div class="boardHeaderPart boardHeaderTop">
                <!-- <select class="alba" id="albaBoardSelect" name="boardType">
                <option selected hidden disabled>종류</option>
                <option name="boardType" value="알바">알바</option>
                <option name="boardType" value="모두">모두</option>
            </select>
            <select class="alba" id="albaSelect" name="occupationType">
                <option selected hidden disabled>직종</option>
                <option name="occupationType" value="외식/음료">외식/음료</option>
                <option name="occupationType" value="매장 관리">매장 관리</option>
                <option name="occupationType" value="서비스">서비스</option>
                <option name="occupationType" value="사무직">사무직</option>
                <option name="occupationType" value="운전/배달">운전/배달</option>
                <option name="occupationType" value="생산">생산</option>
                <option name="occupationType" value="디자인">디자인</option>
                <option name="occupationType" value="IT">IT</option>
                <option name="occupationType" value="교육">교육</option>
            </select> -->
                <div id="boardNumber">
                    <span>No. 10000</span>
                    <span id="boardDate" name="boardDate"></span>
                </div>
                <div id="boardWriter">
                    <div id="boardWriterPhotoBox"><img src="${contextPath}/resources/images/user.png" id="boardWriterPhoto"></div>
                    <span>낭만헌터</span>
                </div>


            </div>

            <div class="container">
                <div class="side">
                    <div class="sideCircle">
                        <span class="material-symbols-outlined">
                            arrow_left_alt
                        </span>
                        <br>
                    </div>

                </div>


                <div class="main">
                    <textarea name="boardTitle" class="textarea" id="textareaTitle" placeholder="Title"></textarea>
                    <textarea name="boardContent" class="textarea" id="textareaContent"
                        placeholder="Content"></textarea>
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

    <div class="footer">
        ㅁ
        ㅁ
        ㅁ
        ㅁ
        ㅁ
        ㅁ
        ㅁ
        ㅁ

    </div>
    <script src="${contextPath}/resources/js/kis/boardWrite.js"></script>
</body>

</html>