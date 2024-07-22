//전체함수
function selectReplyList() {

    $.ajax({
        url: contextPath + "/reply/selectReplyList",
        data: { "boardNo": boardNo },
        type: "GET",
        dataType: "JSON",
        success: function (rList) {

            console.log(rList);
            alert(1);

            //0준위
            const div0 = document.getElementById("replyList");
            div0.innerHTML = "";

            for (let reply of rList) {
                console.log(reply);
                console.log(reply.memberNickname);
                div0.innerHTML+=reply.memberNickname;

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





                div12.append(div121);
                div12.append(div122);
                div12.append(div123);
                div11.append(img);
                div1.append(div11);
                div1.append(div12);
                div0.append(div1);


            }
            // for (let item of rList) {
            //     ul.innerHTML +=item.memberNickname;
            //     console.log(item.memberNickname);
            //     //1준위 (1)
            //     const li = document.createElement("div");
            //     li.classList.add("replyContentBox");

            //     //2준위 (1,1)
            //     const li1 = document.createElement("div");
            //     li1.classList.add("replyWriterPhotoBox");

            //     //3준위 (1,1,1)
            //     const img = document.createElement("img");
            //     if (item.profileImg != null) {
            //         img.setAttribute("src", contextPath + item.profileImg);
            //         img.setAttribute("id", "replyWriterPhoto");
            //     } else {
            //         img.setAttribute("src", contextPath + "/resources/images/user.png");
            //         img.setAttribute("id", "replyWriterPhoto");
            //     }
            //     li1.append(img);
            //     li.append(li1);

              



            //     //2준위 (1,2)
            //     const li2 = document.createElement("div");
            //     li2.classList.add("replyView");

            //     //3준위 (1,2,1)
            //     const li21 = document.createElement("div");
            //     li21.classList.add("replyWriter");
            //     li21.setAttribute("id", "replyWriter");

            //     //4준위(1,2,1,1)
            //     const li211 = document.createElement("div");

            //     //5준위(1,2,1,1,1)
            //     //5준위(1,2,1,1,2)
            //     const li2111 = document.createElement("span");
            //     const li2112 = document.createElement("span");
            //     li2111.innerHTML = item.memberNickname;
            //     li2112.innerHTML = item.createDate;

            //     li211.append(li2111);
            //     li211.append(li2112);
            //     li21.append(li211);





            //     //4준위(1,2,1,2)
            //     const li212 = document.createElement("div");


            //     if (loginMemberNo == item.memberNo) {

            //         //5준위(1,2,1,2,1)
            //         const li2121 = document.createElement("button");
            //         li2121.classList.add("icon deleting deletingReply");
            //         //6준위(1,2,1,2,1,1)
            //         const li21211 = document.createElement("span");
            //         li21211.classList.add("material-symbols-outlined");
            //         li21211.innerHTML = "delete";

            //         li2121.append(li21211);

            //         //5준위(1,2,1,2,2)
            //         const li2122 = document.createElement("button");
            //         li2122.classList.add("icon updating");
            //         //6준위(1,2,1,2,2,1)
            //         const li21221 = document.createElement("span");
            //         li21211.classList.add("material-symbols-outlined");
            //         li21211.innerHTML = "refresh";

            //         li2122.append(li21221);


            //         li212.append(li2121);
            //         li212.append(li2122);

            //     }


            //     //5준위(1,2,1,2,3)
            //     const li2123 = document.createElement("button");
            //     li2123.classList.add("icon warning");
            //     //6준위(1,2,1,2,3,1)
            //     const li21231 = document.createElement("span");
            //     li21231.classList.add("material-symbols-outlined");
            //     li21231.innerHTML = "warning";

            //     li2123.append(li21231);

            //     //5준위(1,2,1,2,4)
            //     const li2124 = document.createElement("button");
            //     li2124.classList.add("icon replyingNested");
            //     li2124.setAttribute("type", "button");
            //     //6준위(1,2,1,2,3,1)
            //     const li21241 = document.createElement("span");
            //     li21241.classList.add("material-symbols-outlined");
            //     li21241.innerHTML = "arrow_right";

            //     li2124.append(li21241);


            //     li21.append(li212);










            //     //3준위 (1,2,2)
            //     const li22 = document.createElement("div");
            //     li22.classList.add("replyContent");





            //     //3준위 (1,2,3)
            //     const li23 = document.createElement("div");
            //     li23.classList.add("nested");


            //     li2.append(li21);
            //     li2.append(li22);
            //     li2.append(li23);

            //     li.append(li2);

               
                











            //     //     const p1 = document.createElement("p");
            //     //     p1.classList.add("reply-writer");
            //     //     const span1 = document.createElement("span");
            //     //     const span2 = document.createElement("span");
            //     //     span2.classList.add("reply-date");



            //     //     span1.innerHTML = item.memberNickname;
            //     //     span2.innerHTML = "(" + item.createDate + ")";

            //     //     p1.append(img);
            //     //     p1.append(span1);
            //     //     p1.append(span2);

            //     //     const p2 = document.createElement("p");
            //     //     p2.classList.add("reply-content");
            //     //     p2.innerHTML = item.replyContent;

            //     //     li.append(p1, p2);

            //     //     // 로그인한회원번호와 댓갈작성자의 회원번호가 같을때만 버튼추가
            //     //     if (loginMemberNo == item.memberNo) {

            //     //         const div = document.createElement("div");
            //     //         div.classList.add("reply-btn-area");
            //     //         const btn1 = document.createElement("button");
            //     //         const btn2 = document.createElement("button");
            //     //         btn1.innerHTML = "수정";
            //     //         btn1.setAttribute("onclick","showUpdateReply("+item.replyNo + ", this)");


            //     //         btn2.innerHTML = "삭제";
            //     //         btn2.setAttribute("onclick", "deleteReply(" + item.replyNo + ")" );

            //     //         div.append(btn1, btn2);

            //     //         li.append(div);
            //     //     }


            //     ul.append(li);

            // }

         





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
        success: function (result) {
            alert("댓글등록성공");

            selectReplyList();

            // replyContent.value = "";
        },
        error: function (req, status, error) {
            console.log("댓글등록실패");
            console.log(req.responseText);
        }
    })
})




