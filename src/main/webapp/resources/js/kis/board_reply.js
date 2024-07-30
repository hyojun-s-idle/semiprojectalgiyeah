//전체함수
function selectReplyList() {

    $.ajax({
        url: contextPath + "/reply/selectReplyList",
        data: { "boardNo": boardNo },
        type: "GET",
        dataType: "JSON",
        success: function (rList) {
            


            //0준위
            const div0 = document.getElementById("replyList");
            div0.innerHTML = "";

            for (let reply of rList) {

                const div1= document.createElement("div");
                div1.classList.add("replyContentBox");
                
                const div11= document.createElement("div");
                div11.classList.add("replyWriterPhotoBox");
                const div12= document.createElement("div");
                div12.classList.add("replyView");

                const img= document.createElement("img");
                img.setAttribute("id", "replyWriterPhoto");
                if (reply.profileImage != null) {
                    img.setAttribute("src", contextPath + reply.profileImage);
                } else {
                    img.setAttribute("src", contextPath + "/resources/images/user.png");
                }


                const div121= document.createElement("div");
                div121.classList.add("replyWriter");
                div121.setAttribute("id", "replyWriter");
                const div122= document.createElement("div");
                div122.classList.add("replyContent");
                const div123= document.createElement("div");
                div123.classList.add("nested");

                const div1211= document.createElement("div");
                const div12111= document.createElement("span");
                const div12112= document.createElement("span");



                // 버튼
                // 좌측
                const div1212= document.createElement("div");
                const div12121= document.createElement("button");
                div12121.classList.add("icon","deleting","deletingReply");
                div12121.setAttribute("onclick", "deleteReply(" + reply.replyNo + ")" );
                const div12122= document.createElement("button");
                div12122.classList.add("icon","updating","updatingReply");
                div12122.setAttribute("onclick","updateReply("+reply.replyNo + ", this)");
                
                
                const div121211= document.createElement("span");
                div121211.classList.add("material-symbols-outlined");
                const div121221= document.createElement("span");
                div121221.classList.add("material-symbols-outlined");
                
                
                // 우측
                const div12123= document.createElement("button");
                div12123.classList.add("icon","warning");
                div12123.setAttribute("onclick","warnReply("+reply.replyNo + ")" );
                const div12124= document.createElement("button");
                div12124.classList.add("icon","replyingNested");

                const div121231= document.createElement("span");
                div121231.classList.add("material-symbols-outlined");
                const div121241= document.createElement("span");
                div121241.classList.add("material-symbols-outlined");



                //대댓글박스
                const div1221= document.createElement("div");
                div1221.classList.add("nestedBox");




                //대댓글작성박스
                const div1231= document.createElement("div");
                div1231.classList.add("textareaBox","replyNestedRight");
                const div1232= document.createElement("div");
                div1232.classList.add("replyNestedRightEnd");

                //대댓글좌측 - textarea박스
                const div12311= document.createElement("textarea");
                div12311.classList.add("textarea","textareaReplyNested");
                div12311.setAttribute("rows","2");


                //대댓글우측 - 우측박스
                const div12321= document.createElement("div");
                div12321.classList.add("replyWriterPhotoBox","replyNestedWriterPhotoBox");

                const div12322= document.createElement("span");
                const div12323= document.createElement("br");
                const div12324= document.createElement("span");
                div12324.classList.add("todayDate");
                const div12325= document.createElement("br");
                const div12326= document.createElement("button");
                div12326.classList.add("replyNestedRegister");
                div12326.setAttribute("id","replyNestedRegister");



                //
                const div123211= document.createElement("img");
                div123211.setAttribute("src",contextPath+"/resources/images/user.png");
                div123211.setAttribute("id","replyWriterPhoto");

                




                div12326.innerHTML="등록";
                div12322.innerHTML=loginMemberNickname;

                div12321.append(div123211);
                div1232.append(div12321,div12322,div12323,div12324,div12325,div12326);
                div1231.append(div12311);
                div123.append(div1231,div1232);
                
                
                // --댓글까지
                div122.innerHTML=reply.replyContent;
                div122.append(div1221);

                div121231.innerHTML="warning";
                div121241.innerHTML="arrow_right";
                div12123.append(div121231);
                div12124.append(div121241);


                
                div121221.innerHTML="delete";
                div12121.append(div121221);
                div121211.innerHTML="refresh";
                div12122.append(div121211);
                //이부분*조건처리
                // *******************************
                if(reply.memberNo==loginMemberNo)
                div1212.append(div12121,div12122);
                // *******************************
                //--------------------------------
                div1212.append(div12123,div12124);
                

                div12111.innerHTML=reply.memberNickname;
                div12112.innerHTML=reply.createDate;
                div1211.append(div12111);
                div1211.append(div12112);


                div121.append(div1211,div1212);


                div12.append(div121,div122,div123);


                div11.append(img);
                div1.append(div11,div12);
                div0.append(div1);


            }


        },
        error: function (req, status, error) {
            console.log("에러발생");
            console.log(req.responseText);
        }

    })
}

//댓글등록
const rbt = document.getElementById("replyRegister");
const con = document.getElementById("textareaReply");
rbt.addEventListener("click", function () {

 
    $.ajax({
        url: contextPath + "/reply/insert",
        data: {
            "replyContent": con.value,
            "memberNo": loginMemberNo,
            "boardNo": boardNo
        },
        type: "POST",
        dataType: "JSON",
        success: function (reply) {



      
            
            
            if (reply.result > 0) {
                alert("댓글등록 성공");

                $('.replyNum').text(reply.replyCount);
                selectReplyList();


            }else{
                alert("댓글등록 실패");
            }


            con.value = "";
        },
        error: function (req, status, error) {
            console.log("댓글등록실패");
            console.log(req.responseText);
        }
    })
})


//댓글삭제
function deleteReply(replyNo){
    if( confirm("정말로 삭제하시겠습니까?")){
        $.ajax({
            url     : contextPath + "/reply/delete",
            data    : { 
                "replyNo" : replyNo,
                "boardNo": boardNo
            },
            type    : "GET",
            dataType: "JSON",
            success : function(reply){

                if(reply.result > 0){
                    alert("댓글삭제 성공");

                    
                    $('.replyNum').text(reply.replyCount);
                    selectReplyList();

                }else{
                    alert("댓글삭제 실패");
                }

            },
            error   : function(req, status, error){
                console.log("댓글삭제실패");
                console.log(req.responseText);
            }
        })

    }
}

//댓글수정
let replyNo1="";
function updateReply(replyNo, btn){
    
    if(replyNo!=undefined){
        replyNo1=replyNo;
    }

    let replyContent=$('.upr').val();


    if(replyContent!=""){


        $.ajax({
            url: contextPath + "/reply/update", 
            data : {"replyNo": replyNo1, "replyContent": replyContent},
            type : "POST",
            success: function(res){
                if(res>0){
                    alert("댓글이 수정되었습니다.");
                    selectReplyList();
                    $('.upr').val("");
                    replyContent="";
                }else{
                    alert("댓글 수정 실패");
                }
    
            },
            error   : function(req, status, error){
                console.log("에러발생");
                console.log(req.responseText);
            }
    
        })


    }





}

