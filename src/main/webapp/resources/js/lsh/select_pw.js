// 유효성 검사 
const checkPwAr = {"newPw": false, "newPwConfirm": false}

// input에 입력값이 없을 경우
function removeMsg(msg, text){
	msg.innerText = "";
	msg.innerText = text;
	msg.classList.remove("confirm", "error");
	return false
}

// input에 값이 유효할 경우
function confirmMsg(msg, text){
	msg.classList.remove("error");
	msg.classList.add("confirm");
	msg.innerText = text;
	return true
}

// input에 값이 유효하지 않을 경우
function errorMsg(msg, text){
	msg.classList.remove("confirm");
	msg.classList.add("error");
	msg.innerText = text;
	return false
}



/* 비밀번호 유효성 검사 */
const newPw = document.getElementById("newPw");
const newPwMsg = document.getElementById("newPwMsg");

newPw.addEventListener("input", function () {
   if (newPw.value.trim() == "") {
      checkPwAr.newPw = removeMsg(newPwMsg, "비밀번호를 입력해주세요.")
      return;
   }

   const regExpPw = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,16}$/;

   if (regExpPw.test(newPw.value)) { // 유효한 경우
      checkPwAr.newPw = confirmMsg(newPwMsg, "유효한 비밀번호입니다.");
   } else {
      checkPwAr.newPw = errorMsg(newPwMsg, "비밀번호 형식이 올바르지 않습니다.");
   }
})


/* 비밀번호 확인 유효성 검사 */
const newPwConfirm = document.getElementById("newPwConfirm");
const newPwConMsg = document.getElementById("newPwConMsg");
newPwConfirm.addEventListener("input", checkPw);
newPw.addEventListener("input", checkPw);


function checkPw() {
   if (newPw.value.trim() == "") {
      newPw.value = "";
      newPw.focus();
      newPwConMsg.innerText = "비밀번호를 먼저 입력해주세요.";
      newPwConMsg.classList.add("error");
      return
   }
   if (newPw.value == newPwConfirm.value) {
      checkPwAr.newPwConfirm = confirmMsg(newPwConMsg, "비밀번호가 일치합니다.")
   } else {
      checkPwAr.newPwConfirm = errorMsg(newPwConMsg, "비밀번호가 일치하지 않습니다.")
   }
}


function pwChangeValidation() {
   let str;

   for (let check in checkPwAr) {
       if (!checkPwAr[check]) {
           switch (check) {

               case "newPw" :
                  str = "비밀번호가"; break;

               case "newPwConfirm":
                   str = "비밀번호 확인이"; break;
                   
           }

           alert(str + " 유효하지 않습니다.");
           document.getElementById(check).focus();
           return false;
       }
       }
       }
