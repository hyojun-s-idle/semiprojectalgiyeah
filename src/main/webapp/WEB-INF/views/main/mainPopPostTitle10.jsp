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
                <!-- <tr onclick="location.href='${contextPath}/board/boardList/detail'">
                    <td class="pop-num">1</td>
                    <td>제목</td>
                </tr>
                <tr>
                    <td class="pop-num">2</td>
                    <td>제목</td>
                </tr>
                <tr>
                    <td class="pop-num">3</td>
                    <td>제목</td>
                </tr>
                <tr>
                    <td class="pop-num">4</td>
                    <td>제목</td>
                </tr>
                <tr>
                    <td class="pop-num">5</td>
                    <td>제목</td>
                </tr>
                <tr>
                    <td class="pop-num">6</td>
                    <td>제목</td>
                </tr>
                <tr>
                    <td class="pop-num">7</td>
                    <td>제목</td>
                </tr>
                <tr>
                    <td class="pop-num">8</td>
                    <td>제목</td>
                </tr>
                <tr>
                    <td class="pop-num">9</td>
                    <td>제목</td>
                </tr>
                <tr>
                    <td class="pop-num">10</td>
                    <td>제목</td>
                </tr> -->
        </table>

        <table class="popTitle workerPop">
                <!-- <tr>
                    <td class="pop-num">1</td>
                    <td>제목</td>
                </tr>
                <tr>
                    <td class="pop-num">2</td>
                    <td>제목</td>
                </tr>
                <tr>
                    <td class="pop-num">3</td>
                    <td>제목</td>
                </tr>
                <tr>
                    <td class="pop-num">4</td>
                    <td>제목</td>
                </tr>
                <tr>
                    <td class="pop-num">5</td>
                    <td>제목</td>
                </tr>
                <tr>
                    <td class="pop-num">6</td>
                    <td>제목</td>
                </tr>
                <tr>
                    <td class="pop-num">7</td>
                    <td>제목</td>
                </tr>
                <tr>
                    <td class="pop-num">8</td>
                    <td>제목</td>
                </tr>
                <tr>
                    <td class="pop-num">9</td>
                    <td>제목</td>
                </tr>
                <tr>
                    <td class="pop-num">10</td>
                    <td>제목</td>
                </tr> -->
        </table>

        <table class="popTitle ceoPop">
               <!--  <tr>
                    <td class="pop-num">1</td>
                    <td>제목</td>
                </tr>
                <tr>
                    <td class="pop-num">2</td>
                    <td>제목</td>
                </tr>
                <tr>
                    <td class="pop-num">3</td>
                    <td>제목</td>
                </tr>
                <tr>
                    <td class="pop-num">4</td>
                    <td>제목</td>
                </tr>
                <tr>
                    <td class="pop-num">5</td>
                    <td>제목</td>
                </tr>
                <tr>
                    <td class="pop-num">6</td>
                    <td>제목</td>
                </tr>
                <tr>
                    <td class="pop-num">7</td>
                    <td>제목</td>
                </tr>
                <tr>
                    <td class="pop-num">8</td>
                    <td>제목</td>
                </tr>
                <tr>
                    <td class="pop-num">9</td>
                    <td>제목</td>
                </tr>
                <tr>
                    <td class="pop-num">10</td>
                    <td>제목</td>
                </tr> -->
        </table>

    </article>