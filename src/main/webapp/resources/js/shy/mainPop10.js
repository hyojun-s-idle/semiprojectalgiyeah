const allPop = document.querySelector(".allPop");
console.log(allPop);

const workerPop = document.querySelector(".workerPop");
console.log(workerPop);

const ceoPop = document.querySelector(".ceoPop");
console.log(ceoPop);

const pathnamep = location.pathname;
let urlp = pathnamep.substring(0, pathnamep.indexOf("/",1));

(function(){
    $.ajax({
        url : urlp + "/hotPost/pop",
        data : {"type": 1},
        type : "GET",
        dataType : "JSON",
        success : function(post){

            for(let i = 0; i < 10; i++){
                
                createPop(allPop,post[i],i);

            }
        },
        error : function(){console.log("에러발생")}
    });
    $.ajax({
        url : urlp + "/hotPost/pop",
        data : {"type": 2},
        type : "GET",
        dataType : "JSON",
        success : function(post){
            for(let i = 0; i < 10; i++){
                createPop(workerPop,post[i],i);

            }
        },
        error : function(){console.log("에러발생")}
    });
    $.ajax({
        url : urlp + "/hotPost/pop",
        data : {"type": 3},
        type : "GET",
        dataType : "JSON",
        success : function(post){
            for(let i = 0; i < 10; i++){
                createPop(ceoPop,post[i],i);

            }
        },
        error : function(){console.log("에러발생")}
    });
})();

function createPop(container, post, i){

    if(post != null || post != undefined){
        const rowsPop = document.createElement("tr");
        rowsPop.setAttribute("onclick", "location.href='"+ urlp + "/board/boardList/detail?no="+post.boardNo +"'");
    
        const colRanck = document.createElement("td");
        colRanck.classList.add("pop-num");
        colRanck.innerText = i+1;
    
        const colTitle = document.createElement("td");
        colTitle.innerText = post.boardTitle;
    
        rowsPop.append(colRanck, colTitle);
    
        container.append(rowsPop);

    }else{
        const nothingPost = document.createElement("tr");

        const nothingText = document.createElement("td");
        nothingText.classList.add("pop-num");
        nothingText.innerText = i + 1;

        const nothingTitle = document.createElement("td");
        nothingTitle.innerText = "게시물이 없습니다.";

        nothingPost.append(nothingText,nothingTitle);

        container.append(nothingPost);
    }


}
