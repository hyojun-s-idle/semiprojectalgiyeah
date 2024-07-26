<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <article class="main-pop-post-title-10">
        <div>인기글</div>
        <ul class="main-pop-tab">
            <li class="pop-tab-item tab-active">모두</li>

            <c:if test="${loginMember.memberTypeCode == 1}">
            	<li class="pop-tab-item" >알바</li>
            </c:if>
            <c:if test="${loginMember.memberTypeCode == 2}">
            	<li class="pop-tab-item" >사장</li>
            </c:if>
        </ul>

        <table class="popTitle tab-active allPop">
        </table>

        <table class="popTitle workerPop">
        </table>

        <table class="popTitle ceoPop">
        </table>

    </article>