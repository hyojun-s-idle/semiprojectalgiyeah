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
        success: function (likeCount) {

            console.log(likeCount);
            $(".likeNum").text(likeCount);

        },
        error: function (req, status, error) {
            console.log("에러발생");
            console.log(req.responseText);
        }

    })
}


// 좋아요 Up/Down
$(document).on("click",".boardLiking",function(){


    $.ajax({
        url: contextPath + "/like/up",
        data: {
            "memberNo": loginMemberNo,
            "boardNo": boardNo
        },
        type: "POST",
        success: function (result) {

            if (result > 0) {
                alert("좋아요 성공");

                selectLike();

            }else{
                alert("좋아요 실패");
            }


        },
        error: function (req, status, error) {
            console.log("좋아요등록실패");
            console.log(req.responseText);
        }
    })


   

})