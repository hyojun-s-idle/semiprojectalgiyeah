<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
    <link rel="stylesheet" href="../resources/css/member/find_id.css">
    
    <link rel="stylesheet" href="${contextPath}/resources/css/common/headerLogin.css">

        <!-- footer css -->
        <link rel="stylesheet" href="${contextPath}/resources/css/common/footer.css">
</head>


<body>
    <div class="container">
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
        <div class="content">
            <div class="find-box">
                <form action="selectId" method="post">
                   
                <h1>아이디 찾기</h1>
                
                <div class="email" id="memberEmail" >
                    <h2>회원 이메일 입력</h2>
                    <input type="text" name="mamberEmail">
                </div>

                <div class="tel" id="memberTel" >
                    <h2>회원 전화번호 입력</h2>
                    <input type="text" name="memberTel">
                </div>

                <div>
                            
                    <h2>질문</h2>
                    <select name="memberQ" class="select" id="like-select">
                        <option value="1">질문을 선택해주세요.</option>
                        <option value="키우는 반려동물 이름은?">키우는 반려동물 이름은?</option>
                        <option value="내가 다닌 고등학교 이름은?">내가 다닌 고등학교 이름은?</option>
                        <option value="부모님의 이름은?">부모님의 이름은?</option>
                        <option value="나의 별명은?">나의 별명은?</option>
                        <option value="내가 좋아하는 음식은?">내가 좋아하는 음식은?</option>
                        <option value="나의 취미는?">나의 취미는?</option>
                    </select>
                </div>
		
                <div>
                    <h2>답변</h2>
                    <input type="text" name="memberA">
                </div>

                <button id="find-com">찾기</button>
            </form>
            </div>
        </div>
    </div>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>    
</html>