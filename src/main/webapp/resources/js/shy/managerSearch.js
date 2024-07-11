const worker = document.querySelector("select[name='rectalSearch']");
const ceo = document.querySelector("select[name='businessSearch']");
const all = document.querySelector("select[name='allSearch']");
const ceoNumTitle = document.getElementById("ceoNumTitle");
const ceoNum = document.querySelectorAll(".ceoNum");
const resultNull = document.querySelector(".mSearchComResult > td > td:first-child");

/* 게시판 변경시 카테고리 변경 */
document.getElementById("mSearchMember").addEventListener("change", (e) => {
    let member = e.target;
    let memberOption = member.options[member.selectedIndex];
    let memberValue = memberOption.value;


    if (memberValue == "worker") {
        worker.classList.add("active");
        ceo.classList.remove("active");
        all.classList.remove("active");
        ceoNumTitle.innerText = "비고";
        for (let i = 0; i < ceoNum.length; i++) {
            ceoNum[i].classList.remove("active");
        }

    } else if (memberValue == "ceo") {
        ceo.classList.add("active");
        worker.classList.remove("active");
        all.classList.remove("active");
        ceoNumTitle.innerText = "사업번호";
        for (let i = 0; i < ceoNum.length; i++) {
            ceoNum[i].classList.add("active");
        }
    } else if (memberValue == "all") {
        worker.classList.remove("active");
        ceo.classList.remove("active");
        all.classList.add("active");
        ceoNumTitle.innerText = "비고";
        for (let i = 0; i < ceoNum.length; i++) {
            ceoNum[i].classList.remove("active");
        }
    } else {
        worker.classList.remove("active");
        ceo.classList.remove("active");
        all.classList.remove("active");
        ceoNumTitle.innerText = "비고";
        for (let i = 0; i < ceoNum.length; i++) {
            ceoNum[i].classList.remove("active");
        }
    }
})

/* 날짜 작성시 검사 */
const regExd = /^\d{2}\-[0-1]\d\-[0-3]\d$/;

document.getElementById("entryDateStart").addEventListener("keyup", e => {
    const date = e.target;
    if (regExd.test(date.value)) {
        date.style.color = "green";
    } else {
        date.style.color = "red";
    }
})
document.getElementById("entryDateEnd").addEventListener("keyup", e => {
    const date = e.target;
    if (regExd.test(date.value)) {
        date.style.color = "green";
    } else {
        date.style.color = "red";
    }
})

/* comment자르기 */
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