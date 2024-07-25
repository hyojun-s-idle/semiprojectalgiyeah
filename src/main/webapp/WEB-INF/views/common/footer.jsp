<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<footer class="footer">
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

    <c:if test="${!empty sessionScope.message}">
        <script>
            alert("${message}");
        </script>
        <c:remove var="message" scope="session"/>
    </c:if>
</footer>