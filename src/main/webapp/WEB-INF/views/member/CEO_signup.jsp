<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사장님 회원가입</title>
    <link rel="stylesheet" href="../resources/css/member/CEO_signup.css">
    
    <link rel="stylesheet" href="${contextPath}/resources/css/common/headerLogin.css">
     <!-- footer css -->
    <link rel="stylesheet" href="${contextPath}/resources/css/common/footer.css">
    <script src="https://kit.fontawesome.com/3970146fa7.js" crossorigin="anonymous"></script>
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <div class="content">
        <form action="${contextPath}/member/signUp" method="post" onsubmit="return check2Validation()">
            <!-- <form action="signUp" method="post" name="signUp-form" onsubmit="return signUpValidate()"> -->
            <fieldset>
                <div class="signup-box" id="signup-box">

                    <!-- 회원가입 1번째 페이지 -->
                    <h1>사장님 회원가입</h1>
                    <div class="id-area">
                        <h3>아이디</h3>
                        <input type="text" id="memberId" name="memberId" placeholder="영어 소문자 시작 4-20자" maxlength="20">
                        <br><span id="id-msg"></span>
                    </div>
                    <div class="pw-area">
                        <h3>비밀번호</h3>
                        <input type="text" id="memberPw" name="memberPw" placeholder="영어,숫자,특수문자 포함 8-16자" maxlength="16">
                        <br><span id="pw-msg"></span>
                    </div>
                    <div class="pw-check-area">
                        <h3>비밀번호 확인</h3>
                        <input type="text" id="memberPwConfirm" name="memberPwConfirm" placeholder="비밀번호 재입력" maxlength="16">
                        <br><span id="pwd-msg"></span>
                    </div>
                    <div class="name-area">
                        <h3>이름</h3>
                        <input type="text" id="memberName" name="memberName" placeholder="이름 입력">
                        <br><span id="name-msg"></span>
                    </div>

                    <div class="birth-area">
                        <h3>생년월일</h3>
                        <input type="text" id="memberBirth" name="memberBirth" placeholder="생년월일 6자리 입력" maxlength="6">
                        <br><span id="birth-msg"></span>
                    </div>

                    <div class="email-area">
                        <h3>이메일</h3>
                        <input type="text" id="memberEmail" name="memberEmail" placeholder="alba@alba.co.kr">
                        <br><span id="email-msg"></span>
                    </div>
                    <div class="phone-area">
                        <h3>전화번호</h3>
                        <input type="text" id="memberTel" name="memberTel" placeholder="-빼고 입력해주세요" maxlength="11">
                        <br><span id="tel-msg"></span>
                    </div>


                    <button type="button" id="next" onclick="check1Validation()">NEXT</button>

                </div>

                <!-- 회원가입 두번째 페이지 -->
                <div class="signup-box2" id="signup-box2">
                    <h1>사장님 회원가입</h1>
                    
                    <div class="businessNum-area">
                        <h3>사업자번호</h3>
                        <input type="text" id="businessNum" name="businessNum" placeholder="사업자번호 6자리">
                        <br><span id="Bn-msg"></span>
                    </div>

                    <div class="nickName-area">
                        <h3>닉네임</h3>
                        <input type="text" id="memberNickname" name="memberNickname" placeholder="3-12자리" maxlength="12">
                        <br><span id="nick-msg"></span>
                    </div>

                    <div class="address-area">
                        <h3>주소</h3>
                        <div class="address-box">
                        
                            <input type="text" id="postcode" name="memberAddress" placeholder="우편번호">
                            <input type="button" id="postBtn"onclick="execDaumPostcode()" value="우편번호 찾기"><br>
                            <input type="text" id="roadAddress" name="memberAddress" placeholder="도로명주소">
                            <input type="text" id="jibunAddress" name="memberAddress" placeholder="지번주소">
                            <span id="guide" style="color:#999;display:none"></span>
                            <input type="text" id="detailAddress" name="memberAddress" placeholder="상세주소">
                       
                        </div>
                    </div>
                    <div class="job-area">
                        <h3>직종</h3>
                        <select name="memberJob" class="select" id="memberJob">
                            <option value="1">직종을 선택해주세요.</option>
                            <option value="요식업">요식업</option>
                            <option value="숙박업">숙박업</option>
                            <option value="제조업">제조업</option>
                            <option value="배송업">배송업</option>
                            <option value="정보서비스업">정보서비스업</option>
                            <option value="시설관리업">시설관리업</option>
                            <option value="교육관리업">교육관리업</option>
                            <option value="여가관련업">여가관련업</option>
                        </select>
                        <br><span id="job-msg"></span>
                    </div>
                    <div class="question-area">

                        <h3>질문</h3>
                        <select name="memberQ" class="select" id="memberQ" >
                            <option value="1">질문을 선택해주세요.</option>
                            <option value="키우는 반려동물 이름은?">키우는 반려동물 이름은?</option>
                            <option value="내가 다닌 고등학교 이름은?">내가 다닌 고등학교 이름은?</option>
                            <option value="부모님의 이름은?">부모님의 이름은?</option>
                            <option value="나의 별명은?">나의 별명은?</option>
                            <option value="내가 좋아하는 음식은?">내가 좋아하는 음식은?</option>
                            <option value="나의 취미는?">나의 취미는?</option>
                        </select>
                        <br><span id="question-msg"></span>
                    </div>
                    <div class="answer-area">
                        <h3>답변</h3>
                        <input type="text" id="memberA" name="memberA" placeholder="답변 입력">
                        <br><span id="a-msg"></span>
                    </div>
                    <div class="email-area">
                        <h3>약관동의</h3>
                        <div class="do">1.이 약관의 내용은 서비스 화면에 게시하거나 기타의 방법으로 회원에게 공지함으로써 효력을 발생합니다.

                            2.학회는 합당한 사유가 발생할 경우에는 이 약관을 변경할 수 있으며, 약관이 변경된 경우에는 변경사항을 지체 없이 공시합니다.



                            제 3 조 (약관 외 준칙)

                            이 약관에 명시되지 아니한 사항에 대해서는 관계법령 및 서비스별 약관의 취지에 따라 적용할 수 있습니다.



                            제 4 조 (용어의 정의)

                            이 약관에서 사용하는 용어의 정의는 다음과 같습니다. 1."서비스"라 함은 "(사)한국지진공학회"에서 제작한 홈페이지를 통해 공급되는 각종 정보를 말합니다.

                            2."회원"이라 함은 학회와 서비스 이용계약을 체결한 자를 말합니다.

                            3."Password(이하 "P.W")"라 함은 회원의 비밀번호를 위해 회원 자신이 설정한 문자와 숫자의 조합을 말합니다.

                            4."관리자"라 함은 서비스의 전반적인 관리와 원활한 운영을 위하여 학회에서 선정한 사람을 말합니다.



                            제 2 장 서비스 이용계약

                            제 5 조 (이용계약의 성립)

                            1.아래 "위의 "(사)한국지진공학회" 이용약관에 동의하십니까?"라는 물음에 회원이 "동의합니다"를 클릭하시면 이 약관에 동의하는 것으로 간주합니다.

                            2.이용계약은 회원의 이용신청에 대하여 학회가 승낙함으로써 성립합니다.



                            제 6 조 (이용신청)

                            이용신청은 온라인으로 서비스에 접속한 후 다음 사항을 회원등록 양식에 기재하여 신청합니다. ID, P.W, 이름, 소속기관, 주소 등



                            제 7 조 (이용신청의 승낙)

                            1.학회는 회원이 제 6 조에서 정한 모든 사항을 정확히 기재하여 이용신청을 하였을 때 승낙합니다.

                            2.학회는 다음 각 호에 해당하는 이용신청에 대하여는 승낙을 유보할 수 있습니다. 1) 설비에 여유가 없는 경우

                            2) 기술상 지장이 있는 경우

                            3) 기타 학회가 필요하다고 인정되는 경우

                            3.학회는 다음 각 호에 해당하는 이용신청에 대하여는 이를 승낙하지 아니할 수 있습니다.

                            1) 이름이 실명이 아닌 경우

                            2) 다른 사람의 명의를 사용하여 신청한 경우

                            3) 회원 등록 시 필요 내용을 허위로 기재하여 신청한 경우

                            4) 사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우

                            5) 기타 학회가 정한 이용 신청 요건이 미비 되었을 경우



                            제 8 조 (계약사항의 변경)

                            회원은 등록 신청 시 기재한 사항이 변경되었을 경우에는 지체 없이 온라인 수정을 해야 합니다.



                            제 3 장 서비스 이용

                            제 9 조 (학회의 의무)

                            학회는 서비스 제공과 관련해서 알고 있는 회원의 신상정보를 본인의 승낙 없이 제 3자에게 누설, 배포하지 않습니다. 단, 전기통신기본법 등 법률의 규정에 의해
                            국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있거나 정보통신윤리위원회의 요청이 있는 경우 또는 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우에는
                            그러하지 않습니다.



                            제 10 조 (회원 ID와 P.W 관리에 대한 의무)

                            회원 ID와 P.W에 관한 모든 관리책임은 회원에게 있습니다. 회원에게 부여된 ID와 P.W의 관리소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 책임은 회원에게
                            있습니다. 자신의 ID와 P.W가 부정하게 사용된 경우 회원은 반드시 학회에 그 사실을 통보해야 합니다.



                            제 11 조 (서비스 전반에 관한 회원의 의무)

                            1.회원은 서비스를 이용할 때 다음 각 호의 행위를 하지 않아야 합니다.

                            1) 다른 회원의 ID와 P.W를 부정하게 사용하는 행위

                            2) 제 3자의 저작권 등 기타 권리를 침해하는 행위

                            3) 공공질서 및 미풍양속에 위반되는 내용의 정보, 문장, 도형 등을 타인에게 유포하는 행위

                            4) 범죄와 결부된다고 객관적으로 판단되는 행위

                            5) 기타 관계법령에 위배되는 행위

                            2.회원은 이 약관에서 규정하는 사항과 서비스 이용안내 또는 주의사항을 준수하여야 합니다.

                            3.회원은 내용별로 학회가 서비스 공지사항에 게시하거나 별도로 공지한 이용 제한 사항을 준수하여야 합니다.

                            4.회원은 학회의 사전승낙 없이는 서비스를 이용하여 영업활동을 할 수 없으며, 영업활동의 결과와 회원이 약관에 위반한 영업활동을 이용하여 발생한 결과에 대하여 학회는
                            책임을 지지 않습니다.



                            제 12조 (정보의 제공)

                            학회는 회원이 서비스 이용 중 필요가 있다고 인정되는 다양한 정보에 대해서 전자우편이나 서신 우편 등의 방법으로 회원에게 제공할 수 있습니다.



                            제 13 조 (회원의 게시물)

                            학회는 회원이 게시하거나 등록하는 서비스내의 내용물이 다음 각 호에 해당한다고 판단되는 경우에 사전통지 없이 삭제할 수 있습니다.

                            1.다른 회원 또는 제 3자를 비방하거나 중상모략으로 명예를 손상시키는 내용인 경우

                            2.공공질서 및 미풍양속에 위반되는 내용인 경우

                            3.범죄적 행위에 결부된다고 인정되는 내용일 경우

                            4.제 3 자의 저작권 등 기타 권리를 침해하는 내용인 경우

                            5.불건전한 자료를 홍보할 경우

                            6.기타 관계법령에 위반된다고 판단되는 경우



                            제 14 조 (저작권, 초상권, 지적소유권 등)

                            1.본 서비스를 통하여 학회로 제출된 아이디어, 원고, 사진 등에 대한 저작권, 초상권, 지적재산권은 학회에 귀속됩니다.

                            2.이벤트 등을 통해 학회로부터 시상금 등을 수령한 회원에게는 원고의뢰, 미디어출연, 사진촬영 등을 의뢰할 수 있습니다.



                            제 15 조 (서비스 이용시간)

                            서비스의 이용은 학회의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴 1일 24시간을 원칙으로 합니다. 다만 정기점검 등의 필요로 학회가 정한 날이나 시간은
                            그러하지 않습니다. 학회는 서비스를 일정범위로 분할하여 각 범위별로 이용가능시간을 별도로 정할 수 있으며 이 경우 그 내용을 사전에 공지합니다.



                            제 16 조 (서비스 제공의 중지)

                            1.학회는 다음 각 호에 해당하는 경우 서비스 제공을 중지할 수 있습니다.

                            1) 서비스용 설비의 보수 등 공사로 인한 부득이한 경우

                            2) 전기통신사업법에 규정된 기간통신사업자가 전기통신서비스를 중지했을 경우



                            2.학회는 국가비상사태, 정전, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 때에는 서비스의 전부 또는 일부를 제한하거나
                            정지할 수 있습니다.



                            제 4 장 계약해지 및 이용제한

                            제 17 조 (계약해지 및 이용제한)

                            회원이 이용계약을 해지하고자 하는 때에는 회원 본인이 온라인(메일)을 통해 학회에 해지신청을 하여야 합니다. 학회는 회원이 다음 각 호에 해당하는 행위를 하였을 경우
                            사전통지 없이 이용계약을 해지하거나 또는 기간을 정하여 서비스 이용을 중지할 수 있습니다.

                            1.타인의 ID 및 P.W를 도용한 경우

                            2.서비스 운영을 고의로 방해한 경우

                            3.가입한 이름이 실명이 아닌 경우

                            4.같은 사용자가 다른 이름, 별명으로 이중등록을 한 경우

                            5.공공질서 및 미풍양속에 저해되는 내용을 고의로 유포시킨 경우

                            6.회원이 국익 또는 사회적 공익을 저해할 목적으로 서비스 이용을 계획 또는 실행하는 경우

                            7.타인의 명예를 손상시키거나 불이익을 주는 행위를 한 경우

                            8.기타 학회가 정한 이용조건에 위반한 경우



                            제 5 장 손해배상 등

                            제 18 조 (손해배상)

                            학회는 서비스 이용과 관련하여 회원에게 발생한 어떠한 손해에 관하여도 책임을 지지 않습니다.



                            제 19 조 (면책조항)

                            1.학회는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.

                            2.학회는 회원의 귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 지지 않습니다.

                            3.학회는 회원이 서비스를 이용하여 기대하는 손익이나 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않습니다.

                            4.학회는 회원이 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다.



                            제 20조 (관할법원)

                            서비스 이용으로 발생한 분쟁에 대해 소송이 제기될 경우 학회의 본사 소재지를 관할하는 법원을 관할 법원으로 합니다.



                            제 6 장 개인정보 보호 등

                            제 21 조 (개인정보 열람 및 정정)

                            개인정보의 열람 및 정정은 회원이 필요한 경우 회원 정보 수정 메뉴를 이용하여 행할 수 있습니다.



                            제 23 조 (개인정보 보유기간)

                            회원의 개인정보는 가입시점 부터 제 17 조에 의한 탈퇴시점까지로 합니다.



                            [부칙]

                            (시행일) 이 약관은 2014년 8월 7일부터 시행합니다.</div>
                        <input type="checkbox" class="ck">동의합니다
                    </div>

                    <!-- 멤버 타입 코드 dispaly : none; -->
                    <input type="text" value="2" id="type" name="type">
                    <button id="signup-com" type="submit">SIGN UP</button>
                </div>
            </fieldset>
        </form>
    </div>


    <div class="footer"></div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <!-- 주소api 스크립트 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script src="${contextPath}/resources/js/lsh/CEO_signup.js"></script>

</body>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>    

</html>