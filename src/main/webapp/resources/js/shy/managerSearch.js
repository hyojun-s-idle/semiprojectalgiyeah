const worker = document.querySelector("select[name='rectalSearch']");
const ceo = document.querySelector("select[name='businessSearch']");
const all = document.querySelector("select[name='allSearch']");
const ceoNumTitle = document.getElementById("ceoNumTitle");
const ceoNum = document.querySelectorAll(".ceoNum");
const resultNull = document.querySelector(".mSearchComResult > td > td:first-child");
const board =  document.getElementById("mSearchMember");

function selectValue(memberValue){
    if (memberValue == 2) {
        worker.classList.add("active");
        ceo.classList.remove("active");
        all.classList.remove("active");

        ceoNumTitle.innerText = "비고";
        for (let i = 0; i < ceoNum.length; i++) {
            ceoNum[i].classList.remove("active");
        }

    } else if (memberValue == 3) {
        ceo.classList.add("active");
        worker.classList.remove("active");
        all.classList.remove("active");
        ceoNumTitle.innerText = "사업번호";
        for (let i = 0; i < ceoNum.length; i++) {
            ceoNum[i].classList.add("active");
        }
    } else if (memberValue == 1) {
        worker.classList.remove("active");
        ceo.classList.remove("active");
        all.classList.add("active");
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
    let comAll = "";
    let comCut = "";
    for (let i = 0; i < contentText.length; i++) {
        if (contentText[i].innerText.length > 20) {
            comAll = contentText[i].innerText;
            comCut = contentText[i].innerText.substr(0, 16);
            contentText[i].innerText = comCut + "...";
    
        }
    }

})();

//신고 누적 검색 시 직접입력시 옆에 input 나옴
document.getElementById("reportAccumulateSearch").addEventListener("change",(e) => {
    let member = e.target;
    let memberOption = member.options[member.selectedIndex];
    let memberValue = memberOption.value;

    if(memberValue == "직접입력"){
        document.getElementsByClassName("reportAccumulate")[0].classList.add("active");
    }else{
        document.getElementsByClassName("reportAccumulate")[0].classList.remove("active");
    }
})