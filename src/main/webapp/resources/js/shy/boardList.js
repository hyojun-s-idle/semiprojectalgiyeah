function searchValidate(){
    const query = document.getElementById("searchQuery");

    if(query.value.trim().length == 0){
        query.focus()
        query.value = "";
        alert("검색 내용을 입력해주세요.");
        return false;
    }
    return true;
}

(function(){
    const key = document.getElementById("anBoardSearch");
    const query = document.getElementById("searchQuery");
    const option = document.querySelectorAll("#anBoardSearch > option");

    if(key != null){
        const param = new URL(location.href).searchParams;

        query.value = param.get("query");

        for(let o of option){
            if(o.value == param.get("anBoardSearch")){
                o.selected = true;
            }
        }
    }
})();

(function(){
    const conSearch = document.querySelector("select[name='conSearch']");
    const nSearch = document.querySelector("input[name='nSearch']");

    const option = conSearch.children;

    const param = new URL(location.href).searchParams;

    nSearch.value = param.get("nSearch");

    for(let o of option){
        if(o.value == param.get("conSearch")){
            o.selected = true;
        }
    }

})();
