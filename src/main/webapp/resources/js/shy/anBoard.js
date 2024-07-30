// 목록으로 버튼
(function(){
    const goListBtn = document.getElementById("goToListBtn");

    if(goListBtn != null){
        goListBtn.addEventListener("click",function(){
            const pathName = location.pathname;
            let url = pathName.substring(0, pathName.indexOf("/",1));
            url += "/announce/boardList?";
            const param = new URL(location.href).searchParams;
            const type = "type=" + param.get("type");
            let cp;
            if(param.get("cp") != null){ cp = "cp=" + param.get("cp");}
            else{ cp = "cp=1"; }

            url += type + "&" + cp;

            console.log(param.get("anBoardSearch"));

            if(param.get("anBoardSearch") != null){
                let key = "&anBoardSearch=" + param.get("anBoardSearch");
                let query = "&query=" + param.get("query");

                url += key + query;

            }

            location.href=url;
        });
    }
})();


