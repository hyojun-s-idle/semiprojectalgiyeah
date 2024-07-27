//좋아요 조회
function selectLike(){
    $.ajax({
        url: contextPath + "/like/select",
        data: { 
            "boardNo": boardNo ,
            "memberNo": loginMemberNo
            
        },
        type: "POST",
        dataType: "JSON",
        success: function (boardLike) {


            $(".likeNum").html(boardLike.likeCount);

            // 좋아요상태 갱신
            likeState=boardLike.likeState;


        },
        error: function (req, status, error) {
            console.log("에러발생");
            console.log(req.responseText);
        }

    })
}












// 좋아요 Up
$(document).on("click",".boardLiking",function(){

    //좋아요등록
    if(likeState==0){
        $.ajax({
            url: contextPath + "/like/up",
            data: {
                "memberNo": loginMemberNo,
                "boardNo": boardNo
            },
            type: "GET",
            success: function (result) {
    
                if (result > 0) {
    
                    selectLike();
                    $('.boardLike').addClass("likeUp");

    
                }else{
                    alert("좋아요등록 실패");
                }
    
    
            },
            error: function (req, status, error) {
                console.log("좋아요등록실패");
                console.log(req.responseText);
            }
        })
    }


    // 좋아요취소
    if(likeState==1){
        $.ajax({
            url: contextPath + "/like/down",
            data: {
                "memberNo": loginMemberNo,
                "boardNo": boardNo
            },
            type: "GET",
            success: function (result) {
    
                if (result > 0) {

                    selectLike();
                    $('.boardLike').removeClass("likeUp");
    
                }else{
                    alert("좋아요취소 실패");
                }
    
    
            },
            error: function (req, status, error) {
                console.log("좋아요취소실패");
                console.log(req.responseText);
            }
        })

    }
    

})




//