/* 게시판 변경시 카테고리 변경 */
const headerUp = document.getElementById("header-UP");
const titleBackColor = document.getElementsByClassName("title-back-color")[0];
const titleContent = document.getElementsByClassName("title-content-post")[0];
const nSearchSuround = document.getElementsByClassName("nSearch-suround")[0];

const worker = document.querySelector("select[name='rectalSearch']");
const ceo = document.querySelector("select[name='businessSearch']");
const all = document.querySelector("select[name='allSearch']");
const board = document.getElementById("mSearchMember");

function selectValue(memberValue){
    if(memberValue == "2"){
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

    }else if(memberValue == "3"){
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
        
    }else if(memberValue == "1"){
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
       
    }
}



// 검색값 남아있게 하기
(function(){
    const mSearchCon = document.getElementById("mSearchCon");//검색
    const mConOptioin = document.querySelectorAll("#mSearchCon > option");//검색 옵션
    const mConText = document.querySelector("input[name='mSearchConText'");//검색어


    const param = new URL(location.href).searchParams;

    if(mConText != null  || mConText != undefined){
        mConText.value = param.get("mSearchConText");
    }

    if(mSearchCon != null || mSearchCon != undefined){
        for(let i of mConOptioin){
            if(param.get("mSearchCon") == i.value){
                i.selected = true;
            }
        }
    }
    

    // 회원
    const mSearchMem = document.getElementById("mSearchMember");//회원 종류
    const mMemOption = document.querySelectorAll("#mSearchMember > option");//회원 옵션

    if(mSearchMem != null || mSearchMem != undefined){
        for(let i of mMemOption){
            if(param.get("mSearchMember") == i.value){
                i.selected = true;
            }
        }
    }

    // 게시판 카테고리
    // 모두
    const allSearch = document.querySelector("select[name='allSearch']");
    const allSearchOption = document.querySelectorAll("select[name='allSearch'] option");

    if(allSearch != null || allSearch != undefined){
        for(let i of allSearchOption){
            if(param.get("allSearch") == i.value){
                i.selected = true;
            }
        }
    }

    // 사장
    const ceoSearch = document.querySelector("select[name='businessSearch']");
    const ceoSearchOption = document.querySelectorAll("select[name='businessSearch'] option");
    if(ceoSearch != null || ceoSearch != undefined){
        for(let i of ceoSearchOption){
            if(param.get("businessSearch") == i.value){
                i.selected = true;
            }
        }
    }

    // 알바
    const workerSearch = document.querySelector("select[name='rectalSearch']");
    const workerSearchOption = document.querySelectorAll("select[name='rectalSearch'] option");

    if(workerSearch != null || workerSearch != undefined){
        for(let i of workerSearchOption){
            if(param.get("rectalSearch") == i.value){
                i.selected = true;
            }
        }
    }


    // 탈퇴 여부
    const mSecession = document.getElementById("mSecession");//탈퇴여부
    const mSecOption = document.querySelectorAll("#mSecession > option");//탈퇴 여부 값

    if(mSecession != null || mSecession != undefined){
        for(let i of mSecOption){
            if(param.get("mSecession") == i.value){
                i.selected = true;
            }
        }
    }

    // 신고 누적 횟수
    const reportSearchNum1 = document.querySelector("input[name='reportAccuSearchNum1']");
    if(reportSearchNum1 != null || reportSearchNum1 != undefined){
        reportSearchNum1.value = param.get("reportAccuSearchNum1");
    }

    const reportSearchNum2 = document.querySelector("input[name='reportAccuSearchNum2']");
    if(reportSearchNum2 != null || reportSearchNum2 != undefined){
        reportSearchNum2.value = param.get("reportAccuSearchNum2");
    }

})();

(function(){
    let memberOption = board.options[board.selectedIndex];
    let memberValue = memberOption.value;

    selectValue(memberValue);
})();

board.addEventListener("input",(e) => {
    let member = e.target;
    let memberOption = member.options[member.selectedIndex];
    let memberValue = memberOption.value;
    console.log(memberValue);

   selectValue(memberValue);
})