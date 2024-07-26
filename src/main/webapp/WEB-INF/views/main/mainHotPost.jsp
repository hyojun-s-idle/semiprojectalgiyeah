<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <article class="main-hot-post">
        <div class="main-hot-title">HOT한 컨텐츠</div>
        <ul class="main-hot-post-tab">
            <li class="hot-tab-item main-hot-tab-active">모두</li>
            <c:if test="${loginMember.memberTypeCode == 1}">
            	<li class="hot-tab-item">알바</li>
            </c:if>
            <c:if test="${loginMember.memberTypeCode == 2}">
            	<li class="hot-tab-item">사장</li>
            </c:if>
        </ul>
        <div class="hot-post-suround-content main-hot-tab-active">
            <div class="fa-solid fa-chevron-left hot-left main-hot-tab-active"></div>

            <div class="kindWrap ">
                <div class="kindSlider main-hot-tab-active">
                    <div class="slider-hot main-hot-tab-active allHotSlider">
                    </div>
                    <div class="slider-hot main-hot-tab-active allHotSlider">
                    </div>
                </div>
            </div>
            <div class="fa-solid fa-chevron-right hot-right main-hot-tab-active"></div>
        </div>

        <div class="hot-post-suround-content">
            <div class="fa-solid fa-chevron-left hot-left"></div>

            <div class="kindWrap ">
                <div class="kindSlider">
                    <div class="slider-hot workerHotSlider"></div>
                    <div class="slider-hot workerHotSlider">
                    </div>

                </div>
            </div>
            <div class="fa-solid fa-chevron-right hot-right main-hot-tab-active"></div>
        </div>
        <div class="hot-post-suround-content">
            <div class="fa-solid fa-chevron-left hot-left"></div>

            <div class="kindWrap ">
                <div class="kindSlider">
                    <div class="slider-hot ceoHotSlider"></div>
                    <div class="slider-hot ceoHotSlider"></div>

                </div>
            </div>
            <div class="fa-solid fa-chevron-right hot-right main-hot-tab-active"></div>
        </div>
    
    </article>