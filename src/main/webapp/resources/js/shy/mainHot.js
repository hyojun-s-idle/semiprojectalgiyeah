const allHotPost = document.querySelectorAll(".allHotSlider");

const workerHotPost = document.querySelectorAll(".workerHotSlider");

const ceoHotPost = document.querySelectorAll(".ceoHotSlider");

const pathnameh = location.pathname;
let urlh = pathnameh.substring(0, pathnameh.indexOf("/", 1));
(function () {

    $.ajax({
        url: urlh + "/hotPost/all",
        data: { "type": 1 },
        dataType: "JSON",
        type: "GET",
        success: function (post) {





            for (let i = 5; i > 2; i--) {
                createHotPost(allHotPost[0], post[i], i - 1)
                
            }

            for (let i = 2; i >= 0; i--) {
                createHotPost(allHotPost[1], post[i], i + 2)
                
            }



        },
        error: function () {
            console.log("에러 발생");

            for(let i = 0; i < allHotPost.length; i++){
                for(let l = 0; l < 3; l++){
                    // 가장 바깥
                    const gather = document.createElement("div");
                    gather.classList.add("hot-post-gather");

                    
                    // 그다음 바깥
                    const hotPostContent = document.createElement("div");
                    hotPostContent.classList.add("hot-post-content");
                
                    // a 태그
                    const suround = document.createElement("a");
                    suround.classList.add("hot-post-suround");
                    
                    const nothingHot = document.createElement("div");
                    nothingHot.innerHTML = "<h3>게시물이 없습니다.</h3>";

                    suround.append(nothingHot);

                    hotPostContent.append(suround);

                    gather.append(hotPostContent);

                    allHotPost[i].append(gather);

                }
            }
        }
    });

    $.ajax({
        url: urlh + "/hotPost/all",
        data: { "type": 2 },
        dataType: "JSON",
        type: "GET",
        success: function (post) {

            for (let i = 5; i > 2; i--) {
                
                createHotPost(workerHotPost[0], post[i], i + 2)
            }

            for (let i = 2; i >= 0; i--) {
                
                createHotPost(workerHotPost[1], post[i], i + 1)
            }



        },
        error: function () {
            console.log("에러 발생");

            for(let i = 0; i < workerHotPost.length; l++){
                for(let l = 0; l < 3; i++){
                    // 가장 바깥
                    const gather = document.createElement("div");
                    gather.classList.add("hot-post-gather");

                    
                    // 그다음 바깥
                    const hotPostContent = document.createElement("div");
                    hotPostContent.classList.add("hot-post-content");
                
                    // a 태그
                    const suround = document.createElement("a");
                    suround.classList.add("hot-post-suround");
                    
                    const nothingHot = document.createElement("div");
                    nothingHot.innerHTML = "<h3>게시물이 없습니다.</h3>";

                    suround.append(nothingHot);

                    hotPostContent.append(suround);

                    gather.append(hotPostContent);

                    workerHotPost[i].append(gather);

                }
            }
        }
    });

    $.ajax({
        url: urlh + "/hotPost/all",
        data: { "type": 3 },
        dataType: "JSON",
        type: "GET",
        success: function (post) {

            for (let i = 5; i > 2; i--) {
                createHotPost(ceoHotPost[0], post[i], i + 1)
            }

            for (let i = 2; i >= 0; i--) {
                createHotPost(ceoHotPost[1], post[i], i + 1)
            }



        },
        error: function () {
            console.log("에러 발생");

            for(let i = 0; i < ceoHotPost.length; l++){
                for(let l = 0; l < 3; i++){
                    // 가장 바깥
                    const gather = document.createElement("div");
                    gather.classList.add("hot-post-gather");
                    
                    // 그다음 바깥
                    const hotPostContent = document.createElement("div");
                    hotPostContent.classList.add("hot-post-content");
                
                    // a 태그
                    const suround = document.createElement("a");
                    suround.classList.add("hot-post-suround");
                    
                    const nothingHot = document.createElement("div");
                    nothingHot.innerHTML = "<h3>게시물이 없습니다.</h3>";

                    suround.append(nothingHot);

                    hotPostContent.append(suround);

                    gather.append(hotPostContent);

                    ceoHotPost[i].append(gather);

                }
            }
        }
    });



})();

function createHotPost(container, post, i) {

    if(post != undefined || post != null){


        // 가장 바깥
        const gather = document.createElement("div");
        gather.classList.add("hot-post-gather");
    
        // 그다음 바깥
        const hotPostContent = document.createElement("div");
        hotPostContent.classList.add("hot-post-content");
    
        // a 태그
        const suround = document.createElement("a");
        suround.classList.add("hot-post-suround");
    
        // 게시물 이미지
        const typeHot = document.createElement("div");
        typeHot.classList.add("type-hot");
    
        const boardImg = document.createElement("img");
        if(post.boardImage == null){
            boardImg.setAttribute("src", urlh + "/resources/images/main/worker"+i+".jpeg");
        }else{
            boardImg.setAttribute("src", urlh + post.boardImage);
        }
        typeHot.append(boardImg);
        // 전체 내용 영역
        const titleHot = document.createElement("div");
        titleHot.classList.add("content-title-hot");
    
        // 제목
        const title = document.createElement("div");
        title.classList.add("title-hot-div");
        title.innerHTML = post.boardTitle;
    
        // 내용
        const content = document.createElement("div");
        content.classList.add("content-hot-div");
    
        const contentP = document.createElement("p");
        contentP.innerHTML = post.boardContent;
        cutContent(contentP.innerText);
    
        content.append(contentP);
    
        // 계정 영역
        const accountDiv = document.createElement("div");
        accountDiv.classList.add("account-hot-div");
    
        // 프로필 사진
        const accountImgSur = document.createElement("div");
        accountImgSur.classList.add("account-hot-img");
    
        const accountImg = document.createElement("img");
        if(post.profileImage == null){
            accountImg.setAttribute("src", urlh + "/resources/images/user.png");
        }else{
            accountImg.setAttribute("src", urlh + post.profileImage);
        }
    
        accountImgSur.append(accountImg);
    
        // 계정 이름
        const nickName = document.createElement("div");
        nickName.classList.add("account-hot-name");
        nickName.innerHTML = post.memberNickname;
    
        accountDiv.append(accountImgSur,nickName);
    
        titleHot.append(title,content,accountDiv);
    
        suround.append(typeHot,titleHot);
    
        hotPostContent.append(suround);
    
        gather.append(hotPostContent);
    
        container.append(gather);
    }else{


        // 가장 바깥
        const gather = document.createElement("div");
        gather.classList.add("hot-post-gather");

        
        // 그다음 바깥
        const hotPostContent = document.createElement("div");
        hotPostContent.classList.add("hot-post-content");
    
        // a 태그
        const suround = document.createElement("a");
        suround.classList.add("hot-post-suround");
        
        const nothingHot = document.createElement("div");
        nothingHot.innerHTML = "<h3>게시물이 없습니다.</h3>";

        suround.append(nothingHot);

        hotPostContent.append(suround);

        gather.append(hotPostContent);

        container.append(gather);
       }
       
}
  



function cutContent(contentText) {
    let comAll = "";
    let comCut = "";
    for (let i = 0; i < contentText.length; i++) {
        if (contentText > 20) {
            comAll = contentText[i].innerText;
            comCut = contentText[i].innerText.substr(0, 16);
            contentText[i].innerText = comCut + "...";

        }
    }
}