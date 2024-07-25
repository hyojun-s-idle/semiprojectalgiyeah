// 댓글 목록 조회
function selectReplyList(){

    $.ajax({
        url : contextPath + "/areply/selectReplyList",
        data : {"boardNo" : boardNo},
        type : "GET",
        dataType : "JSON",
        success : function(rList){

            const replyList = document.getElementById("reply-list");
            replyList.innerHTML = "";

            for(let reply of rList){
                console.log(reply.updateDate);
                const li = document.createElement("li");
                li.classList.add("reply-row");

                const p1 = document.createElement("p");
                p1.classList.add("reply-writer");

                const img = document.createElement("img");
                if(reply.profileImage != null){ // 프로필 이미지가 있는 경우
                    img.setAttribute("src", contextPath + reply.profileImage);
                }else{ // 없는 경우 == 기본 이미지
                    img.setAttribute("src", contextPath + "/resources/images/user.png")
                }

                const span1 = document.createElement("span");
                span1.innerHTML = reply.memberNickname;

                const span2 = document.createElement("span");
                if(reply.updateDate == null){
                    span2.innerHTML = reply.createDate;
                }else{
                    span2.innerHTML = reply.updateDate;
                }
                span2.classList.add("reply-date");

                p1.append(img,span1, span2);

                const p2 = document.createElement("p");
                p2.innerHTML = reply.replyContent;
                p2.classList.add("reply-content");

                li.append(p1, p2);
/* 
                if(reply.memberNo == loginMemberNo){ */
                    const div = document.createElement("div");
                    div.classList.add("reply-btn-area");

                    const btn1 = document.createElement("button");
                    btn1.innerHTML = "수정";
                    btn1.setAttribute("onclick", "showUpdateReply("+ reply.replyNo +", this)");

                    const btn2 = document.createElement("button");
                    btn2.innerHTML = "삭제";
                    btn2.setAttribute("onclick","deleteReply(" + reply.replyNo + " )");

                    div.append(btn1, btn2);

                    li.append(div);
               /*  } */

                replyList.append(li);

            }
        },
        error : function(){
            console.log("에러발생");
        }
    })
}

// 댓글 등록
const addReply = document.getElementById("addReply");
const replyContent = document.getElementById("replyContent");

addReply.addEventListener("click",function(){

   /*  if( loginMemberNo == ""){
        alert("로그인 후 이용해주세요.");
        return;
    } */

    if( replyContent.value.trim().length == 0){
        alert("댓글을 작성한 후 버튼을 클릭해주세요.");

        replyContent.focus();
        replyContent.valuew = "";
        return;
    }
console.log(boardNo);
    $.ajax({
        url : contextPath + "/areply/insert",
        data : {/* "memberNo" : loginMemberNo, */
                "replyContent" : replyContent.value,
                "boardNo" : boardNo},
        type : "POST",
        success : function(result){
            if(result > 0){
                alert("댓글 등록되었습니다.");
                replyContent.value = "";
                selectReplyList();
            }else{ alert("댓글 등록 실패했습니다.");}
        },
        error : function(){
            console.log("댓글 등록 실패");
        }
    });
});

// 댓글 삭제
function deleteReply(replyNo){

    if(confirm("정말로 삭제 하시겠습니까?")){

        $.ajax({
            url : contextPath + "/areply/delete",
            data : {"replyNo" : replyNo},
            type  : "GET",
            success : function(result){
                console.log(result);
                if(result > 0){
                    alert("삭제되었습니다.");
                    selectReplyList();
                }else{
                    //삭제 실패 시 -> "삭제 실패" alert로 출력
                    alert("삭제 실패");

                }
            },
            error : function(req,status,error){
                console.log("댓글 삭제 오류");
                console.log(req.responseText);
            }
        });
    }
}

// 댓글 수정 화면 전환
let beforeReplyRow;
function showUpdateReply(replyNo, btn){
    const replyRow = btn.parentElement.parentElement; 
    beforeReplyRow = replyRow.innerHTML;

    let beforeContent = replyRow.children[1].innerHTML;
    replyRow.innerHTML = "";

    const textarea = document.createElement("textarea");
    textarea.classList.add("update-textarea");
    beforeContent = beforeContent.replaceAll("&amp;", "&");
    beforeContent = beforeContent.replaceAll("&lt;", "<");
    beforeContent = beforeContent.replaceAll("&gt;", ">");
    beforeContent = beforeContent.replaceAll("&quot;", "\"");
    beforeContent = beforeContent.replaceAll("<br>", "\n");

    textarea.value = beforeContent;
    replyRow.append(textarea);

    const btnArea = document.createElement("div");
    btnArea.classList.add("reply-btn-area");

    const btnUpdate = document.createElement("button");
    btnUpdate.innerHTML = "수정";
    btnUpdate.setAttribute("onclick","updateReply(" + replyNo + ",this)");

    const cancelBtn = document.createElement("button");
    cancelBtn.innerHTML = "취소";
    cancelBtn.setAttribute("onclick", "updateCancel(this)");

    btnArea.append(btnUpdate, cancelBtn);
    replyRow.append(btnArea);
}

// 댓글 수정 취소
function updateCancel(btn){
    const replyRow = btn.parentElement.parentElement;

    if(confirm("댓글 수정을 취소하시겠습니까?")){
        replyRow.innerHTML = beforeReplyRow;
    }
}

// 댓글 수정
function updateReply(replyNo, btn){
    const replyRow = btn.parentElement.parentElement;
    let beforeContent = replyRow.children[0].value;

    $.ajax({
        url: contextPath+ "/areply/update",
        type : "POST",
        data : {"replyNo" : replyNo,
                "content" : beforeContent
        },
        success : function(res){
            if(res > 0){
                alert("댓글이 수정되었습니다.");
                selectReplyList();
            }else{
                alert("댓글 수정 실패");
            }
        },
        error : function(){
            console.log("에러발생");
        }
    });
}