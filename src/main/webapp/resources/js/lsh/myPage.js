
console.log("myPage.js");


/* 회원 탈퇴 유효성 검사*/
function secesValidate(){
	
    const currentPw = document.getElementsByName("currentPw")[0];
    const checkTerms = document.getElementsByName("termsCheck")[0];

    // 비밀번호 미작성
    if(currentPw.value.length == 0){
       // alert("비밀번호를 입력해주세요.")
       // currentPw.focus();
        //return false;

        return printAlert(currentPw, "비밀번호를 입력해주세요.");
    }

    // 약관 동의 체크박스
    // - 체크박수요소.checked : 체크시 true, 해제 시 false 반환
    if(!checkTerms.checked){//  체크를 안했들 때
        //alert("약관 동의 후 탈퇴 버튼을 클릭해주세요.");
        //return false;
        return printAlert(checkTerms, "약관 동의 후 탈퇴 버튼을 클릭해주세요.");
    }

    // 정말 탈퇴할 지 확인
    // -confirm("내용") : 확인 시 true / 취소 시 false
    if(!confirm("정말 탈퇴하시겠습니까?")){
        return false;
    }
    return  true;
}




function infoValidate(){

    const memberNickname = document.getElementsByName("memberNickname")[0];
     const regExpNick = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/; // 닉네임 정규식

    const memberTel = document.getElementsByName("memberTel")[0];
    const regExpTel = /^0(1[079]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/; // 전화번호 정규식
    
    const memberName = document.getElementsByName("memberName")[0];
  	const regExpName = /^[가-힣]+$/; // 이름 정규식 
  	
  	const memberEmail = document.getElementsByName("memberEmail")[0];
   	const regExpEmail = /^[\w\_\-]{4,}@[a-z]+(\.\w+){1,3}$/; // 이메일 정규식
   	
   	const memberAddress1 = document.getElementsByName("memberAddress")[0];
   	const memberAddress2 = document.getElementsByName("memberAddress")[1];
   	const memberAddress3 = document.getElementsByName("memberAddress")[2];
   	const memberAddress4 = document.getElementsByName("memberAddress")[3];
   	
   	
	
    /* 닉네임 유효성 검사 */
    if(memberNickname.value.trim().length == 0){
       return printAlert(memberNickname, "닉네임을 입력해주세요.");
    }

    if(!regExpNick.test(memberNickname.value)){ // 유효하지 않는 경우
       return printAlert(memberNickname, "닉네임은 영어/숫자/한글 2~10글자 사이로 작성해 주세요.");
    }
    
    /* 전화번호 */
    if(memberTel.value.trim() == ""){
        return printAlert(memberTel, "전화번호를 입력해주세요.(-제외)");
    }
    
    if(!regExpTel.test(memberTel.value)){ // 유효하지 않을 때
        return printAlert(memberTel, "전화번호 형식이 올바르지 않습니다.");
    }
    
    /* 이름 */
    if(memberName.value.trim() == ""){
        return printAlert(memberName, "이름을 입력해주세요.");
    }
    
    if(!regExpName.test(memberName.value)){ // 유효하지 않을 때
        return printAlert(memberName, "이름 형식이 올바르지 않습니다.");
    }
    
    /* 이메일 */
    if(memberEmail.value.trim() == ""){
        return printAlert(memberEmail, "이메일을 입력해주세요.");
    }
    
    if(!regExpEmail.test(memberEmail.value)){ // 유효하지 않을 때
        return printAlert(memberEmail, "이메일 형식이 올바르지 않습니다.");
    }
    
    /* 우편번호 */
    if(memberAddress1.value.trim() == ""){
        return printAlert(memberAddress1, "우편번호를 입력해주세요.");
    }
    
    /* 도로명주소 */
    if(memberAddress2.value.trim() == ""){
        return printAlert(memberAddress2, "도로명주소를 입력해주세요.");
    }
    
    /* 지번주소 */
    if(memberAddress3.value.trim() == ""){
        return printAlert(memberAddress3, "지번주소를 입력해주세요.");
    }
    
    
    /* 상세주소 */
    if(memberAddress4.value.trim() == ""){
        return printAlert(memberAddress4, "상세주소를 입력해주세요.");
    }
    
    
    
    
	    

    return true;
}

function printAlert(el, message){ // 매개변수 el은 요소 message는 띄울 메세지
    alert(message);
    el.focus();
    return false;
}






// 비밀번호 변경 제출시 유효성 검사
function pwValidate(){
    const currentPw = document.getElementsByName("currentPw")[0];
    const newPw = document.getElementsByName("newPw")[0];
    const newPwCon = document.getElementsByName("newPwConfirm")[0];

     const regEx = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,16}$/;

    if(currentPw.value.trim().length == 0){
        return printAlert(currentPw,"현재 비밀번호를 입력해주세요.");
    }

    if(newPw.value.trim().length == 0){
        return printAlert(newPw, "새 비밀번호를 입력하세요.");
    }

    if(!regEx.test(newPw.value)){
        return printAlert(newPw, "영어,숫자,특수문자 포함 8-16자로 입력해주세요") 
    }

    if(newPwCon.value.trim().length == 0){
        return printAlert(newPwCon,"새 비밀번호 확인을 입력해주세요.")
    }

    if(newPw.value != newPwCon.value){
        return printAlert(newPwCon, "새 비밀번호가 일치하지 않습니다.")
    }

    return true;
}