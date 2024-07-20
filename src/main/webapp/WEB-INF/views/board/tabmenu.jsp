<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
    <c:if test="${empty param.cate}">
        <c:set var="active" value="tab-active"/>
    </c:if>

    <c:if test="${param.type == 1}">
        <ul class="tab-menu">
            <li class="tab-item ${active}"><a href="boardList?type=1">전체</a></li>

            <c:forEach var="i" begin="1" end="2" step="1">
                <c:set var="cat" value="${category[i]}"/>
                <c:choose>
                    <c:when test="${param.cate == i+1}">
                        <li class="tab-item tab-active"><a href="boardList?type=${param.type}&cate=${cat.categoryNo}">${cat.categoryName}</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="tab-item"><a href="boardList?type=${param.type}&cate=${cat.categoryNo}">${cat.categoryName}</a></li>
                    </c:otherwise>

                </c:choose>

            </c:forEach>

        </ul>

    </c:if>

    <c:if test="${param.type == 3}">
        <ul class="tab-menu">
            <li class="tab-item ${active}"><a href="boardList?type=3">전체</a></li>

            <c:forEach var="i" begin="13" end="21" step="1">
                <c:set var="cat" value="${category[i]}"/>
                <c:choose>
                    <c:when test="${param.cate == i+1}">
                        <li class="tab-item tab-active"><a href="boardList?type=${param.type}&cate=${cat.categoryNo}">${cat.categoryName}</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="tab-item"><a href="boardList?type=${param.type}&cate=${cat.categoryNo}">${cat.categoryName}</a></li>
                    </c:otherwise>

                </c:choose>
                
            </c:forEach>

        </ul>  
    </c:if>

    <c:if test="${param.type == 2}">
        <ul class="tab-menu">
            <li class="tab-item ${active}"><a href="boardList?type=2">전체</a></li>
            
            <c:forEach var="i" begin="3" end="12" step="1">
                <c:set var="cat" value="${category[i]}"/>
                <c:choose>
                    <c:when test="${param.cate == i+1}">
                        <li class="tab-item tab-active"><a href="boardList?type=${param.type}&cate=${cat.categoryNo}">${cat.categoryName}</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="tab-item"><a href="boardList?type=${param.type}&cate=${cat.categoryNo}">${cat.categoryName}</a></li>
                    </c:otherwise>

                </c:choose>
                
            </c:forEach>

        </ul>
    </c:if>