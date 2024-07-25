function writeValidate(){
    const boardTitle = document.querySelector("input[name='boardTitle']");
    const boardContent = document.querySelector("input[name='boardContent'");

    if(boardTitle.value.trim().length == 0){
        alert("제목을 작성해주세요.");
        boardTitle.focus();
        return false;
    }

    if(boardContent.value.trim().length == 0){
        alert("내용을 작성해주세요.");
        boardContent.focus();
        return false;
    }

    return true;
}