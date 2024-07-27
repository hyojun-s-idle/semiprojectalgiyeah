<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<footer class="footer">

    <!-- 모양용 -->
    <fieldset class="footer-2"><div><span>&nbsp;</span></div></fieldset>


    <article class="footer-1">
        <span>SemiProject</span>
        <span>Ⓒ</span>
        <span>KH</span>
        <span>5company</span>
        <span>hyojun-s-idle</span>
        <span>Community</span>
        <span>알지예</span>
    </article>
    <fieldset class="footer-2">
        <div>
        	<span>소스트리는 Pull과 Push만 잘하면 된다.</span>
        	<span>-JYG</span>
        </div>
    </fieldset>


    <fieldset class="footer-3">
        <ul>
            <li>
                <span>남들 고통받는게 왜 이렇게 즐겁지...??</span><br>
                <span>-LJW </span><br>
                <span>-2024.7.26(금). 20:00경</span><br>
                <img src="${contextPath}/resources/images/leeJaeWon.png" alt="" style="width:100px; height:100px;">
            </li>
        </ul>
        <ul>
            <li>
                <span>거봐요~ 짜면 된다니까요~~ (...??)</span><br>
                <span>-JHS</span><br>
                <img src="${contextPath}/resources/images/passionMon.png" alt="" style="width:100px; height:100px;"><br>
                <span>&nbsp;</span>
            </li>
        </ul>
  


    </fieldset>
   



    <c:if test="${!empty sessionScope.message}">
        <script>
            alert("${message}");
        </script>
        <c:remove var="message" scope="session"/>
    </c:if>
</footer>