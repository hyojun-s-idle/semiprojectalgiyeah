<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>12게시판</title>
    <script src="https://kit.fontawesome.com/58046189b2.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/common/headerLogin.css">

</head>

<body>


    
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>


    <div class="con">


        <div class="fix">
            <div class="writeBox">
                <button class="btn">버튼</button>
                <textarea class="textarea" name="" id="" maxlength="12"></textarea>
                <div class="lBox"><span class="length">1</span>/12</div>
            </div>
        </div>
        


        <div class="conTain"></div>


    </div>

</body>

</html>

<style>
    * {
        box-sizing: border-box;
    }

    .con {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;

        padding-top: 150px;
    }
    
    

    .conTain {

        width: 1000px;

        display: flex;
        justify-content: center;
        align-items: center;
        flex-flow: wrap;

    }
    


    /* 입력 */
    .fix{
        height: 300px;
    }
    .btn {
        width: 100%;
    }

    .writeBox {
        width: 100px;
        height: 150px;
        overflow: hidden;

        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;

    }

    .textarea {
        width: 100%;
        height: 100%;
        resize: none;
        font-size: 19px;
    }
    .length{
        color:red;
        font-weight: bold;
        font-size: 20px;

    }




    /* JS */
    .circle {
        border-radius: 100%;
        display: flex;
        justify-content: center;
        align-items: center;


        width: 100px;
        height: 100px;

        padding: 10px;

        animation: bounce 10s infinite alternate;
        

    }

    @keyframes bounce {
        0% {
            transform: rotateX(0deg) rotateY(0deg);
            background-color: rgba(155, 236, 0, 0.3);
        }

        25% {
            transform: rotateX(180deg) rotateY(90deg);
        }

        50% {
            transform: rotateX(0deg) rotateY(0deg);
            background-color: rgba(255, 20, 147, 0.3);
        }

        75% {
            transform: rotateX(90deg) rotateY(180deg);
        }

        100% {
            transform: rotateX(0deg) rotateY(0deg);
            background-color: rgba(75, 112, 245, 0.3);
        }
    }
</style>




<script src="https://code.jquery.com/jquery-3.7.1.min.js"
    integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>




    $('.btn').on("click", function () {
        a();
    })
    function a() {

        $('.writeBox').fadeOut().fadeIn();

        const div = $('<div>')
        div.addClass('circle')
        div.append($('.textarea').val());
        $('.conTain').prepend(div);

        $('.textarea').val("");
        $('.length').html($('.textarea').val().length);

    }
    


    $('.textarea').on("input",function(){
        $('.length').html($('.textarea').val().length);
        
    })


</script>

