<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


    <div class="mainLeft">
    <!-- margin상쇄위해 flex걸어둠 -->
    <!-- 추후제거!!! -->


        <!-- 최저임금 -->
        <div class="mainLeftChart boxFlex">
            <div >
                <div class="title">
                    Minimum Wage
                </div>
                <div class="minimumwageNumberingBox">
                    <div class="minimumwageNumberingBoxTop">
                        <div class="countingYearBox">
                            <span class="countingYear">2024</span>.01.01 기준
                        </div>
                        <div class="minimumwageNumberingComment">
                            일급: 일 8시간 기준<br>
                            월급; 주 40시간, 유급주휴 8시간 포함<br>
                        </div>
                    </div>
                    <div>
                        시급<span class="minimumwageNumbering counting"></span>원 <br>
                        일급<span class="minimumwageNumbering countingDay"></span>원 <br>
                        월급<span class="minimumwageNumbering countingMonth"></span>원 <br>
                    </div>
                </div>
                <div class="chartMinimumwageProposalBox">
                    <div class="chartMinimumwage chartMinimumwageProposal" id="chartMinimumwageProposal">
                        <div class="title">
                            Minimum Wage Proposal
                        </div>
                    </div>
                    <div class="comment">
                        <div>
                            2024기준 <br>
                            출처,최저임금위원회<br>
                            Minimum Wage Proposal : 최저임금 결정안
                        </div>
                        <div class="statisticsBox">
                            <div>
                                <a href="https://www.minimumwage.go.kr/minWage/policy/proposalMain.do">
                                    <img class="statisticsLogo" src="${contextPath}/resources/images/logo_minimumWageCommision.svg">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="chartMinimumwageBox">
                <div class="chartMinimumwage" id="chartMinimumwage">
                    <div class="title">
                        Minimum Wage Flow
                    </div>
                </div>
                <div class="comment">
                    <div>
                        Minimum Wage : 최저임금
                    </div>
                    <div class="statisticsBox">
                        <div>
                            <a href="https://www.minimumwage.go.kr/minWage/policy/decisionMain.do">
                                <img class="statisticsLogo" src="${contextPath}/resources/images/logo_StatisticsKorea.png">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
           
        </div>


        <!-- 최저임금 vs 주택가격 -->
        <div class="mainLeftChart">
            <div class="chartMinimumwage chartMinimumwageHousingprice" id="chartMinimunwageHousingprice">
                <div class="title">
                    <span>Minimum Wage vs House Pricing</span>
                </div>
            </div>
            <div class="comment">
                <div>
                    Minimum Wage : 최저임금 <br>
                    8 &nbsp; hours/day <br>
                    20 days/month
                </div>

                <div class="statisticsBox">
                    <div>
                        Seoul Housing Price <br>
                        Nationwide Housing Price
                    </div>
                    <div>
                        : 서울주택가격 <br>
                        : 전국주택가격
                    </div>
                    <div>
                        <a
                            href="https://www.index.go.kr/unity/potal/indicator/IndexInfo.do?cdNo=2&clasCd=10&idxCd=F0182&upCd=8">
                            <img class="statisticsLogo" src="${contextPath}/resources/images/logo_StatisticsKorea.png">
                        </a>
                    </div>
                </div>
            </div>
        </div>


    </div>



