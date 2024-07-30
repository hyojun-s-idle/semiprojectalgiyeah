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

    console.log(likeState);
    

    
    selectLike();
    //한번조회 <- likeState담기
    


    console.log(likeState);



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
                    alert("좋아요등록 성공");
    
                    selectLike();
                    $('.boardLike').css("backgroundColor","red");
 
    
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
                    alert("좋아요취소 성공");

                    selectLike();
                    $('.boardLike').css("backgroundColor","transparent");
    
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




        $('.likeBox').append(span);//