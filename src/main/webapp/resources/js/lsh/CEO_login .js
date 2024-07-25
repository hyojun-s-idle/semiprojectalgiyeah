function loginValidate() {

    const inputId = document.getElementById("inputId");
    const inputPw = document.getElementByPw("inputPw");

    if (inputEmail.value.trim().length == 0) {

        alert("아이디를 입력해주세요.");
        inputId.value = "";
        inputId.focus();
        return false;
    }
    if (inputPw.value.trim().length == 0) {

        alert("비밀번호를 입력해주세요.");
        inputEmail.value = "";
        inputEmail.focus();
        return false;
    }

    return true;

}