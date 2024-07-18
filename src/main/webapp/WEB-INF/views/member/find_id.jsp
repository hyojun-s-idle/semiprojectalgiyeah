<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
    <link rel="stylesheet" href="../resources/css/member/find_id.css">
    
    <link rel="stylesheet" href="${contextPath}/resources/css/common/headerLogin.css">
</head>


<body>
    <div class="container">
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
        <div class="content">
            <div class="find-box">
                <form action="">
                    <fieldset>
                <h1>아이디 찾기</h1>
                
                <div class="email">
                    <h2>회원 이메일 입력</h2>
                    <input type="">
                </div>

                <div class="email">
                    <h2>회원 전화번호 입력</h2>
                    <input type="">
                </div>

                <div class="phone-area">
                            
                    <h2>질문</h2>
                    <select name="" class="select" id="like-select">
                        <option value="1">키우는 반려동물 이름은?</option>
                        <option value="2">내가 다닌 고등학교 이름은?</option>
                        <option value="3">부모님의 이름은?</option>
                        <option value="4">나의 별명은?</option>
                        <option value="5">내가 좋아하는 음식은?</option>
                        <option value="6">나의 취미는?</option>
                    </select>
                </div>

                <div class="phone-area">
                    <h2>답변</h2>
                    <input type="text" id="phone-input">
                </div>

                <button id="find-com">찾기</button>
            </fieldset>
            </form>
            </div>
        </div>
        <div class="footer">

        </div>
    </div>
</body>
</html>