//상단
//경고버튼
$(document).on("click", ".warning", function () {
    if (
        confirm("신고하시겠습니까?")
    ) {
        alert("신고되었습니다.");
    } else {
        alert("취소되었습니다.");
    }
})



//삭제버튼
$('#deletingBoard').on('click', function () {
    if (confirm("삭제하시겠습니까?")) {
        const container = $(this).parents(".container");
        $(this).parents(".container").fadeOut();
        setTimeout(function () { container.remove(); }, 1000)
    }

    //숨김
    //삭제

    // 뒤로이동
})



//댓글카운트
$(document).on("",function(){
    // 목록에서 눌렀을때
    //그때 카운트형식으로
    //아니다.
    //당해페이지들어왔을때를 기준으로할것.!!!
})


//하단
