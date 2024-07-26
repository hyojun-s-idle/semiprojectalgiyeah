
// 유효성 검사 JS

const checkObj1 = {   "memberId": false,
   "memberPw": false,
   "memberPwConfirm": false,
   "memberName": false,
   "memberEmail": false,
   "memberTel": false,
   "memberBirth" : false}


const checkObj2 = {
	"businessNum" : false,
   "memberNickname": false,
   "memberA": false,
};




// input에 입력값이 없을 경우
function removeMsg(msg, text) {
   msg.innerText = "";
   msg.innerText = text;
   msg.classList.remove("confirm", "error");
   return false
}

// input에 값이 유효할 경우
function confirmMsg(msg, text) {
   msg.classList.remove("error");
   msg.classList.add("confirm");
   msg.innerText = text;
   return true
}

// input에 값이 유효하지 않을 경우
function errorMsg(msg, text) {
   msg.classList.remove("confirm");
   msg.classList.add("error");
   msg.innerText = text;
   return false;
}


/* 아이디 유효성 검사 */
const idMsg = document.getElementById("id-msg");
const memberId = document.getElementById("memberId");
memberId.addEventListener("input", function () {
   // 입력이 되지 않은 경우
   if (memberId.value.trim() == "") {
      /*              idMsg.innerText = "";
                     idMsg.innerText = "아이디를 입력해주세요";
                     idMsg.classList.remove("confirm","error"); */
      checkObj1.memberId = removeMsg(idMsg, "아이디를 입력해주세요.")
      return;
   }

   const regExpId = /^[a-z]+[a-z0-9]{5,19}$/g;
   if (regExpId.test(memberId.value)) { // 유효한 경우
      /*              idMsg.classList.remove("error");
                   idMsg.classList.add("confirm");
                   idMsg.innerText = "유효한 아이디 입니다." */


      /* checkObj1.memberId = confirmMsg(idMsg, "유효한 아이디입니다."); */


      $.ajax({
         url : "idDupCheck",
         data : {"memberId" : memberId.value},
         success: function (result) {

            if(result == 1){
               checkObj1.memberId = errorMsg(idMsg, "이미 사용중인 아이디 입니다.");
            } else{
               checkObj1.memberId = confirmMsg(idMsg, "사용 가능한 아이디 입니다.");
            }

         },
         error: function(){
	consloe.log("에러발생");
}
      });

   } else {
      /*    idMsg.classList.remove("confirm");
            idMsg.classList.add("error");
            idMsg.innerText = "아이디 형식이 올바르지 않습니다." */
      checkObj1.memberId = errorMsg(idMsg, "아이디 형식이 올바르지 않습니다.");
   }


})


/* 비밀번호 유효성 검사 */
const pwMsg = document.getElementById("pw-msg");
const memberPw = document.getElementById("memberPw");

memberPw.addEventListener("input", function () {
   if (memberPw.value.trim() == "") {
      checkObj1.memberPw = removeMsg(pwMsg, "비밀번호를 입력해주세요.")
      return;
   }

   const regExpPw = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,16}$/;

   if (regExpPw.test(memberPw.value)) { // 유효한 경우
      checkObj1.memberPw = confirmMsg(pwMsg, "유효한 비밀번호입니다.");
   } else {
      checkObj1.memberPw = errorMsg(pwMsg, "비밀번호 형식이 올바르지 않습니다.");
   }
})

/* 비밀번호 확인 유효성 검사 */
const memberPwConfirm = document.getElementById("memberPwConfirm");
const pwdMsg = document.getElementById("pwd-msg");
memberPwConfirm.addEventListener("input", checkPw);
memberPw.addEventListener("input", checkPw);


function checkPw() {
   if (memberPw.value.trim() == "") {
      memberPwConfirm.value = "";
      memberPw.focus();
      pwdMsg.innerText = "비밀번호를 먼저 입력해주세요.";
      pwdMsg.classList.add("error");
      return
   }
   if (memberPw.value == memberPwConfirm.value) {
      checkObj1.memberPwConfirm = confirmMsg(pwdMsg, "비밀번호가 일치합니다.")
   } else {
      checkObj1.memberPwConfirm = errorMsg(pwdMsg, "비밀번호가 일치하지 않습니다.")
   }
}


/* 이름 유효성 검사 */
const nameMsg = document.getElementById("name-msg");
const memberName = document.getElementById("memberName");

memberName.addEventListener("input", function () {
   if (memberName.value.trim() == "") {
      checkObj1.memberName = removeMsg(nameMsg, "이름을 입력해주세요.")
      return;
   }

   const regExpName = /^[가-힣]+$/;

   if (regExpName.test(memberName.value)) { // 유효한 경우
      checkObj1.memberName = confirmMsg(nameMsg, "유효한 이름입니다.");
   } else {
      checkObj1.memberName = errorMsg(nameMsg, "이름 형식이 올바르지 않습니다.");
   }
})


/* 생년월일 유효성 검사 */
const birthMsg = document.getElementById("birth-msg");
const memberBirth = document.getElementById("memberBirth");

memberBirth.addEventListener("input", function () {
   if (memberBirth.value.trim() == "") {
      checkObj1.memberBirth = removeMsg(birthMsg, "생년월일을 입력해주세요.")
      return;
   }

   const regExpBirth = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))$/;

   if (regExpBirth.test(memberBirth.value)) { // 유효한 경우
      checkObj1.memberBirth = confirmMsg(birthMsg, "유효한 생년월일입니다.");
   } else {
      checkObj1.memberBirth = errorMsg(birthMsg, "생년월일 형식이 올바르지 않습니다.");
   }
})


/* 이메일 유효성 검사 */
const emailMsg = document.getElementById("email-msg");
const memberEmail = document.getElementById("memberEmail");

memberEmail.addEventListener("input", function () {
   if (memberEmail.value.trim() == "") {
      checkObj1.memberEmail = removeMsg(emailMsg, "이메일을 입력해주세요.")
      return;
   }

   const regExpEmail = /^[\w\_\-]{4,}@[a-z]+(\.\w+){1,3}$/;

   if (regExpEmail.test(memberEmail.value)) { // 유효한 경우
      checkObj1.memberEmail = confirmMsg(emailMsg, "유효한 이메일입니다.");
   } else {
      checkObj1.memberEmail = errorMsg(emailMsg, "이메일 형식이 올바르지 않습니다.");
   }
})


/* 전화번호 유효성 검사 */
const telMsg = document.getElementById("tel-msg");
const memberTel = document.getElementById("memberTel");

memberTel.addEventListener("input", function () {
   if (memberTel.value.trim() == "") {
      checkObj1.memberTel = removeMsg(telMsg, "전화번호를 입력해주세요.")
      return;
   }

   const regExpTel = /^0(1[079]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/;

   if (regExpTel.test(memberTel.value)) { // 유효한 경우
      checkObj1.memberTel = confirmMsg(telMsg, "유효한 전화번호입니다.");
   } else {
      checkObj1.memberTel = errorMsg(telMsg, "전화번호 형식이 올바르지 않습니다.");
   }
})






// 회원 가입 버튼 클릭 시 유효성 검사가 완료 되었는지 확인
function check1Validation() {

   // checkObj1에 있는 모든 속성을 반복 접근하여
   // false가 하나라도 있는 경우 form태그 기본 이벤트 제거
   let str;

   for (let check in checkObj1) {
       if (!checkObj1[check]) {
           switch (check) {

               case "memberId" :
                  str = "아이디가"; break;

               case "memberEmail":
                   str = "이메일이"; break;

               case "memberPw":
                   str = "비밀번호가"; break;

               case "memberPwConfirm":
                   str = "비밀번호 확인이"; break;

               case "memberName":
                   str = "이름이"; break;

               case "memberTel":
                   str = "전화번호가"; break;

               case "memberBirth":
                  str = "생일이"; break;
           }

           alert(str + " 유효하지 않습니다.");
           document.getElementById(check).focus();
           return;
       }
   }

   document.getElementById("signup-box").classList.add("none");

   document.getElementById("signup-box2").classList.add("block");
   
}

/* 사업자번호 유효성 검사 */

const BnMsg = document.getElementById("Bn-msg");
const businessNum = document.getElementById("businessNum");

businessNum.addEventListener("input", function () {
   if (businessNum.value.trim() == "") {
      checkObj2.businessNum = removeMsg(BnMsg, "사업자번호를 입력해주세요.")
      return;
   }

   const regExpBn = /[0-9]{6}/;

   if (regExpBn.test(businessNum.value)) { // 유효한 경우
      checkObj2.businessNum = confirmMsg(BnMsg, "유효한 사업자번호입니다.");

   } else {
      checkObj2.businessNum = errorMsg(BnMsg, "사업자번호 형식이 올바르지 않습니다.");

   }
})




/* 닉네임 유효성 검사 */

const nickMsg = document.getElementById("nick-msg");
const memberNickname = document.getElementById("memberNickname");

memberNickname.addEventListener("input", function () {
   if (memberNickname.value.trim() == "") {
      checkObj2.memberNickname = removeMsg(nickMsg, "닉네임을 입력해주세요.")
      return;
   }

   const regExpNick = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/;

   if (regExpNick.test(memberNickname.value)) { // 유효한 경우


      /* checkObj2.memberNickname = confirmMsg(nickMsg, "유효한 닉네임입니다."); */

      $.ajax({
         url : "nickDupCheck",
         data : {"memberNickname" : memberNickname.value},
         success: function (result) {

            if(result == 1){
               checkObj2.memberNickname = errorMsg(nickMsg, "이미 사용중인 닉네임 입니다.");
            } else{
               checkObj2.memberNickname = confirmMsg(nickMsg, "사용 가능한 닉네임 입니다.");
            }

         },
         error: function(){

	consloe.log("에러발생");
}
      });

   } else {
      checkObj2.memberNickname = errorMsg(nickMsg, "닉네임 형식이 올바르지 않습니다.");

   }
 
})

// 답변 유효성 검사
const aMsg = document.getElementById("a-msg");
const memberA = document.getElementById("memberA");
const memberQ = document.getElementById("memberQ");
const memberJob = document.getElementById("memberJob");

memberA.addEventListener("input", function () {
   if (memberA.value.trim() == "") {
      checkObj2.memberA = removeMsg(aMsg, "답변을 입력해주세요")
      return;
   }

   const regExpA = /[가-힣a-zA-Z]{1}/;

   if (regExpA.test(memberA.value)) { // 유효한 경우
      checkObj2.memberA = confirmMsg(aMsg, "유효한 답변입니다.");
      console.log(memberQ.value)
      console.log(memberJob.value)
   } else {
      checkObj2.memberA = errorMsg(aMsg, "유효하지 않은 답변입니다.");
   }

})





// 주소 찾기
function execDaumPostcode() {
   new daum.Postcode({
       oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var roadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 참고 항목 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }


           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           document.getElementById('postcode').value = data.zonecode;
           document.getElementById("roadAddress").value = roadAddr;
           document.getElementById("jibunAddress").value = data.jibunAddress;
           

           var guideTextBox = document.getElementById("guide");
           // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
           if(data.autoRoadAddress) {
               var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
               guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
               guideTextBox.style.display = 'block';

           } else if(data.autoJibunAddress) {
               var expJibunAddr = data.autoJibunAddress;
               guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
               guideTextBox.style.display = 'block';
           } else {
               guideTextBox.innerHTML = '';
               guideTextBox.style.display = 'none';
           }
       }
   }).open();
}

    /*   if(postCode.value.trim() == ""){
         alert("우편번호를 입력해주세요")
         postCode.focus()
         return false;
      }
      
      if(roadAddress.value.trim() == ""){
         alert("도로명주소를 입력해주세요")
         roadAddress.focus()
         return false;
      }
      
      if(jibunAddress.value.trim() == ""){
         alert("지번주소를 입력해주세요")
         jibunAddress.focus()
         return false;
      }
      
      if(detailAddress.value.trim() == ""){
         alert("상세주소를 입력해주세요")
         detailAddress.focus()
         return false;
      } */



// 회원 가입 버튼 클릭 시 유효성 검사가 완료 되었는지 확인
function check2Validation() {
   // checkObj1에 있는 모든 속성을 반복 접근하여
   // false가 하나라도 있는 경우 form태그 기본 이벤트 제거
   let str;

   for (let check in checkObj2) {
       if (!checkObj2[check]) {
           switch (check) {

               case "memberNickname" :
                  str = "닉네임이"; break;

               case "memberA":
                   str = "답변이"; break;
                   
               case "businessNum":
                   str = "사업자번호가"; break;
           }

           alert(str + " 유효하지 않습니다.");
           document.getElementById(check).focus();
           return false;
       }
      
      }
      const memberQ = document.getElementById("memberQ");
      const memberJob = document.getElementById("memberJob");
      if(memberJob.value == 1 ){
         alert("직종을 선택해주세요")
         memberJob.focus()
         return false;
      }
      
      if(memberQ.value == 1){
         alert("질문을 선택해주세요")
         memberQ.focus()
         return false;
      }

      const postCode = document.getElementById("postcode");
      const roadAddress = document.getElementById("roadAddress");
      const jibunAddress = document.getElementById("jibunAddress");
      const detailAddress = document.getElementById("detailAddress");
      regExpAdrr = /(\d{3}-\d{3}|\d{5})/;

      if(postCode.value.trim() == ''){
         alert("우편번호를 입력해주세요.")
         postCode.focus();
         return false;

      }else if(!regExpAdrr.test(postCode.value)){
         alert("우편주소를 다시 확인해주세요.")
         return false;
      }

      
      if(roadAddress.value.trim() == ""){
         alert("도로명주소를 입력해주세요.")
         roadAddress.focus();
         return false;
      }

      
      if(jibunAddress.value.trim() == ""){
         alert("지번주소를 입력해주세요.")
         jibunAddress.focus();
         return false;
      }

      
      if(detailAddress.value.trim() == ""){
         alert("상세주소를 입력해주세요.")
         detailAddress.focus();
         return false;
      }

      

   return true;
}



