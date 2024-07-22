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

    const tr = document.createElement("tr");
    tr.setAttribute("onclick", "location.href='"+ urlp + "/board/boardList/detail?no="+post.boardNo +"'");

    const td1 = document.createElement("td");
    td1.classList.add("pop-num");
    td1.innerText = i+1;

    const td2 = document.createElement("td");
    td2.innerText = post.boardTitle;

    tr.append(td1, td2);

    container.append(tr);

}
