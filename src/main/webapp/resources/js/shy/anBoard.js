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

            location.href=url;
        });
    }
})();

(function(){

    const deleteBtn = document.getElementById("deleteBtn");

    if(deleteBtn != null){
        deleteBtn.addEventListener("click",() => {
            let url = "anDelete";

            const param = new URL(location.href).searchParams;
            const type = "?type=" + param.get("type");
            const no = "&no=" + param.get("no");
            const cp = "&cp=" + param.get("cp");

            url += type + no + cp;

            if(confirm("정말로 삭제하시겠습니까?")){
                location.href = url;
            }

        });
    }
})();