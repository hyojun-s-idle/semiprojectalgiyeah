<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="category" value="${category}"/>

        <table class="mSearchTable">
            <thead>
                <tr>
                    <th>검색어</th>
                    <td>
                        <select name="mSearchCon" id="mSearchCon">
                            <option value="name">닉네임</option>
                            <option value="title">제목</option>
                            <option value="content">내용</option>

                        </select>
                    
                    
                        <input type="search" name="mSearchConText" placeholder="검색어을 입력해주세요.">
                    </td>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <th>게시판</th>
                    <td>
                        <select name="mSearchMember" id="mSearchMember">

                            <c:forEach var="i" begin="0" end="2" step="1">
                                <c:set var="cat" value="${category[i]}"/>
                                <c:choose>
                                    <c:when test="${search.mSearchMember == i+1}">
                                        <option value="${cat.categoryNo}" selected>${cat.categoryName}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${cat.categoryNo}">${cat.categoryName}</option>
                                    </c:otherwise>
    
                                </c:choose>
    
                            </c:forEach>
                        </select>
    
                        <select name="allSearch" class="category">
                            
                            <option value="0" >전체</option>
                            <c:forEach var="i" begin="1" end="2" step="1">
                                <c:set var="cat" value="${category[i]}"/>
                                <c:choose>
                                    <c:when test="${search.allSearch == i+1}">
                                        <option value="${i+1}" selected>${cat.categoryName}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${i+1}">${cat.categoryName}</option>
                                    </c:otherwise>
    
                                </c:choose>
    
                            </c:forEach>
                            
                        </select>
                    
                    
                        <select name="businessSearch" class="category">
                            
                            <option value="0">전체</option>
    
                            <c:forEach var="i" begin="13" end="21" step="1">
                                <c:set var="cat" value="${category[i]}"/>
                                <c:choose>
                                    <c:when test="${search.businessSearch == i+1}">
                                        <option value="${i+1}" selected>${cat.categoryName}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${i+1}">${cat.categoryName}</option>
                                    </c:otherwise>
    
                                </c:choose>
    
                            </c:forEach>
    
                            
                        </select>
                    
                    
                        <select name="rectalSearch" class="category">
                            
                            <option value="0" >전체</option>
    
                            <c:forEach var="i" begin="3" end="12" step="1">
                                <c:set var="cat" value="${category[i]}"/>
                                <c:choose>
                                    <c:when test="${search.businessSearch == i+1}">
                                        <option value="${i+1}" selected>${cat.categoryName}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${i+1}">${cat.categoryName}</option>
                                    </c:otherwise>
    
                                </c:choose>
    
                            </c:forEach>
                            
                        </select>
            
                    </td>
                </tr>

            </tbody>
            
            <tfoot>
                <tr>
                    <th>신고 누적 횟수</th>
                    <td>
                        <!-- <select name="reportAccumulateSearch" id="reportAccumulateSearch">
                            <option>직접입력</option>
                            <option>1</option>
                            <option>10</option>
                            <option>20</option>
                            <option>40</option>
                            <option>60</option>
                            <option>80</option>
                            <option>100</option>
                        </select>
     -->
                        <input type="number" name="reportAccuSearchNum" class="reportAccumulate active"
                            placeholder="신고수를 입력하세요.">
                    </td>
                </tr>
               
            </tfoot>
        </table>
        <div class="mbtn-suround">
        <button id="btnMSearch">검색</button> <button type="reset">초기화</button>
        </div>