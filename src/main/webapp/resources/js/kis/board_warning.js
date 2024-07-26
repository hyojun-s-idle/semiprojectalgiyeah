//게시글 신고버튼
$(document).on("click", ".warningBoard", function () {
    if ( confirm("게시글을 신고하시겠습니까?") ) {
        const warn=prompt("게시글 신고사유를 적어주세요.");

        $(this).parents('.replyView').find()

        // ajax보내기
        $.ajax({
            url: contextPath + "/warn/board",
            data: { 
                "boardNo": boardNo ,
                "memberNo": loginMemberNo,
                "warn" : warn
                
            },
            type: "POST",
            dataType: "JSON",
            success: function (result) {
    
                if(result>0){
                    alert("게시글이 신고되었습니다.");
                }else{
                    alert("게시글신고접수가 실패되었습니다.")
                }
    
    
    
    
                
    
            },
            error: function (req, status, error) {
                console.log("에러발생");
                console.log(req.responseText);
            }
    
        })





        
    } else {
        alert("취소되었습니다.");
    }
})


//댓글 신고버튼
function warnReply(replyNo){
    if ( confirm("댓글을 신고하시겠습니까?") ) {
        const warn=prompt("신고사유를 적어주세요.");


        // ajax보내기
        $.ajax({
            url: contextPath + "/warn/reply",
            data: { 
                "replyNo": replyNo ,
                "memberNo": loginMemberNo,
                "warn" : warn
                
            },
            type: "POST",
            dataType: "JSON",
            success: function (result) {
    
                if(result>0){
                    alert("댓글이 신고되었습니다.");
                }else{
                    alert("댓글신고접수가 실패되었습니다.")
                }
    
    
    
    
                
    
            },
            error: function (req, status, error) {
                console.log("에러발생");
                console.log(req.responseText);
            }
    
        })





        
    } else {
        alert("취소되었습니다.");
    }
}