/* 게시판 변경시 카테고리 변경 */
const headerUp = document.getElementById("header-UP");
const titleBackColor = document.getElementsByClassName("title-back-color")[0];
const titleContent = document.getElementsByClassName("title-content-post")[0];
const nSearchSuround = document.getElementsByClassName("nSearch-suround")[0];

const worker = document.querySelector("select[name='rectalSearch']");
const ceo = document.querySelector("select[name='businessSearch']");
const all = document.querySelector("select[name='allSearch']");

document.getElementById("mSearchMember").addEventListener("change",(e) => {
    let member = e.target;
    let memberOption = member.options[member.selectedIndex];
    let memberValue = memberOption.value;
    console.log(memberValue);

    if(memberValue == 2){
        worker.classList.add("active");
        ceo.classList.remove("active");
        all.classList.remove("active");

        headerUp.classList.add("worker");
        headerUp.classList.remove("all" ,"ceo");

        titleBackColor.classList.add("worker");
        titleBackColor.classList.remove("all" , "ceo");
        titleBackColor.classList.add("worker-box-shadow");
        titleBackColor.classList.remove("ceo-box-shadow", "all-box-shadow");

        nSearchSuround.classList.add("worker");
        nSearchSuround.classList.remove("ceo", "all");

        titleContent.classList.add("worker-title-boder-bottom");
        titleContent.classList.remove("all-title-boder-bottom","ceo-title-boder-bottom");

    }else if(memberValue == 3){
        ceo.classList.add("active");
        worker.classList.remove("active");
        all.classList.remove("active");

        headerUp.classList.add("ceo");
        headerUp.classList.remove("all" ,"worker");

        titleBackColor.classList.add("ceo");
        titleBackColor.classList.remove("all" , "worker");
        titleBackColor.classList.add("ceo-box-shadow");
        titleBackColor.classList.remove("worker-box-shadow", "all-box-shadow");

        nSearchSuround.classList.add("ceo");
        nSearchSuround.classList.remove("worker", "all");

        titleContent.classList.add("ceo-title-boder-bottom");
        titleContent.classList.remove("all-title-boder-bottom","worker-title-boder-bottom");
        
    }else if(memberValue == 1){
        worker.classList.remove("active");
        ceo.classList.remove("active");
        all.classList.add("active");

        headerUp.classList.add("all");
        headerUp.classList.remove("ceo" ,"worker");

        titleBackColor.classList.add("all");
        titleBackColor.classList.remove("ceo" , "worker");
        titleBackColor.classList.add("all-box-shadow");
        titleBackColor.classList.remove("worker-box-shadow", "ceo-box-shadow");

        nSearchSuround.classList.add("all");
        nSearchSuround.classList.remove("worker", "ceo");

        titleContent.classList.add("all-title-boder-bottom");
        titleContent.classList.remove("ceo-title-boder-bottom","worker-title-boder-bottom");
       
    }/* else{
        console.log("test");
        worker.classList.remove("active");
        ceo.classList.remove("active");
        all.classList.remove("active");

        headerUp.classList.add("all");
        headerUp.classList.remove("ceo" ,"worker");

        titleBackColor.classList.add("all");
        titleBackColor.classList.remove("ceo" , "worker");
        titleBackColor.classList.add("all-box-shadow");
        titleBackColor.classList.remove("worker-box-shadow", "ceo-box-shadow");

        nSearchSuround.classList.add("all");
        nSearchSuround.classList.remove("worker", "ceo");

        titleContent.classList.add("all-title-boder-bottom");
        titleContent.classList.remove("ceo-title-boder-bottom","worker-title-boder-bottom");
       
    } */
})