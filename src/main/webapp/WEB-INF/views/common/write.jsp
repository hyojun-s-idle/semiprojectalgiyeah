<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>






<div class="write-suround">

    <c:if test="${!empty loginMember}">
        
        <div class="fa-solid fa-pen" id="write">
        </div>
    
        <a href="${contextPath}/board/write?mode=insert&type=${param.type}" id="write-write">글쓰기</a>
        

    </c:if>


</div>