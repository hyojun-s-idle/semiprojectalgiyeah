const worker = document.querySelector("select[name='rectalSearch']");
    const ceo = document.querySelector("select[name='businessSearch']");
    const all = document.querySelector("select[name='allSearch']");
    const resultNull = document.querySelector(".mSearchComResult > td > td:first-child");


function selectValue(memberValue){
    if (memberValue == 2) {
        if(worker != null){
            worker.classList.add("active");
            ceo.classList.remove("active");
            all.classList.remove("active");
        }


    } else if (memberValue == 3) {
        if(ceo != null){
            ceo.classList.add("active");
            worker.classList.remove("active");
            all.classList.remove("active");
        }

    } else if (memberValue == 1) {
        if(all != null){
            worker.classList.remove("active");
            ceo.classList.remove("active");
            all.classList.add("active");
        }

    } else{
        if(all != null){
            worker.classList.remove("active");
            ceo.classList.remove("active");
            all.classList.remove("active");
        }

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

/* 게시판 변경시 카테고리 변경 */
(function(){
    
    const board =  document.getElementById("mSearchMember");
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
    const reAcSeNum1 = document.querySelector("input[name='reportAccuSearchNum1']");
    const reAcSeNum2 = document.querySelector("input[name='reportAccuSearchNum2']");
    
    if(mSeConText.value.trim().length == 0){
        mSeConText.value = "";
        mSeConText.focus();
        alert("검색어를 입력해주세요.");
        return false;
    }
    
    if(reAcSeNum1 != null || reAcSeNum1 != undefined){
        if(reAcSeNum1.value.trim().length == 0){
            reAcSeNum1.value = "";
            reAcSeNum1.focus();
            alert("신고 수를 입력해주세요.");
            return false;
        }

        if(reAcSeNum1.value.trim() == 0){
            reAcSeNum1.value = "";
            reAcSeNum1.focus();
            alert("신고 수에 0을 입력할수 없습니다.");
            return false;
        }

    }

    return true;
}




