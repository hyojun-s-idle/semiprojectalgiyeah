<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<section class="mSearch-section">
    <form action="" name="mSearchForm">
        <table class="mSearchTable">

            <thead>
                <tr>
                    <th>검색어</th>
                    <td>
                        <select name="mSearchCon" id="mSearchCon">
                            <option value="name">닉네임</option>
                            <option value="title">게시판 제목</option>
                            <option value="postNum">게시판 번호</option>
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
                            <option value="null" selected>전체</option>
                            <option value="all">모두</option>
                            <option value="worker">알바</option>
                            <option value="ceo">사장</option>
                        </select>

                        <select name="allSearch" class="category">
                            <option value="전체">전체</option>
                            <option value="알바">알바</option>
                            <option value="사장">사장</option>
                            
                        </select>
                    
                    
                        <select name="businessSearch" class="category">
                            <option value="null">사업별</option>
                            <option value="요식업">요식업</option>
                            <option value="숙박업">숙박업</option>
                            <option value="제조업">제조업</option>
                            <option value="배송업">배송업</option>
                            <option value="정보서비스업">정보서비스업</option>
                            <option value="시설관리업">시설관리업</option>
                            <option value="교육관리업">교육관리업</option>
                            <option value="여가관련업">여가관련업</option>
                            <option value="기타">기타</option>
                        </select>
                    
                    
                        <select name="rectalSearch" class="category">
                            <option value="null">직종별</option>
                            <option value="외식/음료">외식/음료</option>
                            <option value="매장관리">매장관리</option>
                            <option value="서비스">서비스</option>
                            <option value="사무직">사무직</option>
                            <option value="운전/배달">운전/배달</option>
                            <option value="생산">생산</option>
                            <option value="디자인">디자인</option>
                            <option value="IT">IT</option>
                            <option value="교육">교육</option>
                            <option value="기타">기타</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <th>신고 누적 횟수</th>
                    <td>
                        <select name="reportAccumulateSearch" id="reportAccumulateSearch">
                            <option selected>직접입력</option>
                            <option>1</option>
                            <option>10</option>
                            <option>20</option>
                            <option>40</option>
                            <option>60</option>
                            <option>80</option>
                            <option>100</option>
                        </select>

                        <input type="number" name="reportAccumulateSearch" class="reportAccumulate active">
                    </td>
                </tr>
            </tbody>

            <tfoot>
                <tr>
                    <th>작성일자</th>
                    <td><input type="text" name="entryDateStart" placeholder="년도-0월-0일" id="entryDateStart"> ~ 
                        <input type="text" name="entryDateEnd" placeholder="년도-0월-0일" id="entryDateEnd">

                    </td>
                </tr>
            </tfoot>
        </table>
        <div class="mbtn-suround">
        <button id="btnMSearch">검색</button> <button type="reset">초기화</button>
        </div>
    </form>
</section>