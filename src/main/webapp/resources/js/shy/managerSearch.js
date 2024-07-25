const worker = document.querySelector("select[name='rectalSearch']");
const ceo = document.querySelector("select[name='businessSearch']");
const all = document.querySelector("select[name='allSearch']");
const resultNull = document.querySelector(".mSearchComResult > td > td:first-child");
const board =  document.getElementById("mSearchMember");
const ceoNumTitle = document.getElementById("ceoNumTitle");
const ceoNum = document.querySelectorAll(".ceoNum");

function selectValue(memberValue){
    if (memberValue == 2) {
        if(worker != null){
            worker.classList.add("active");
            ceo.classList.remove("active");
            all.classList.remove("active");
        }

        ceoNumTitle.innerText = "비고";
        for (let i = 0; i < ceoNum.length; i++) {
            ceoNum[i].classList.remove("active");
        }


    } else if (memberValue == 3) {
        if(ceo != null){
            ceo.classList.add("active");
            worker.classList.remove("active");
            all.classList.remove("active");
        }

        ceoNumTitle.innerText = "사업번호";
        for (let i = 0; i < ceoNum.length; i++) {
            ceoNum[i].classList.add("active");
        }
    } else if (memberValue == 1) {
        if(all != null){
            worker.classList.remove("active");
            ceo.classList.remove("active");
            all.classList.add("active");
        }

        ceoNumTitle.innerText = "비고";
        for (let i = 0; i < ceoNum.length; i++) {
            ceoNum[i].classList.remove("active");
        }
    } else{
        if(all != null){
            worker.classList.remove("active");
            ceo.classList.remove("active");
            all.classList.add("active");
        }

        ceoNumTitle.innerText = "비고";
        for (let i = 0; i < ceoNum.length; i++) {
            ceoNum[i].classList.remove("active");
        }
    }
}


/* 게시판 변경시 카테고리 변경 */
(function(){
    let memberOption = board.options[board.selectedIndex];
    let memberValue = memberOption.value;

    selectValue(memberValue);
    
    board.addEventListener("change",()=>{
        memberOption = board.options[board.selectedIndex];
        memberValue = memberOption.value;

        selectValue(memberValue);
    });

})();

/* comment자르기 */
(function(){

    const contentText = document.querySelectorAll(".contentReport");
    let comCut = "";
    for (let i = 0; i < contentText.length; i++) {
        if (contentText[i].innerText.length > 20) {
            comCut = contentText[i].innerText.substr(0, 16);
            contentText[i].innerText = comCut + "...";
    
        }
    }

})();

/* 제목 자르기 */
(function(){
    const title = document.querySelectorAll(".manSTitle");
    console.log(title);
    let tCut;

    for(let i =0; i < title.length; i++){
        console.log(i);
        if(title[i].innerText.length >= 9){
            tCut = title[i].innerText.substr(0,5);
            title[i].innerText = tCut + "...";
            console.log(title[i].innerText);
        }
    }
})();

//신고 누적 검색 시 직접입력시 옆에 input 나옴
/* document.getElementById("reportAccumulateSearch").addEventListener("change",(e) => {
    let member = e.target;
    let memberOption = member.options[member.selectedIndex];
    let memberValue = memberOption.value;

    if(memberValue == "직접입력"){
        document.getElementsByClassName("reportAccumulate")[0].classList.add("active");
    }else{
        document.getElementsByClassName("reportAccumulate")[0].classList.remove("active");
    }
}) */

// 유효성 검사
function searchValidate(){
    const mSeConText = document.querySelector("input[name='mSearchConText']");
    const reAcSeNum = document.querySelector("input[name='reportAccuSearchNum']");
    console.log(reAcSeNum);
    
    if(mSeConText.value.trim().length == 0){
        mSeConText.value = "";
        mSeConText.focus();
        alert("검색어를 입력해주세요.");
        return false;
    }
    
    if(reAcSeNum != null){
        if(reAcSeNum.value.trim().length == 0){
            reAcSeNum.value = "";
            reAcSeNum.focus();
            alert("신고 수를 입력해주세요.");
            return false;
        }
    }
    return true;
}