//상단




//삭제버튼
// $('#deletingBoard').on('click', function (e) {
//     if (confirm("삭제하시겠습니까?")) {
//         const container = $(this).parents(".container");
//         $(this).parents(".container").fadeOut();
//         setTimeout(function () { container.remove(); }, 1000)


//         location.href='detail/delete?type='+type+'&no='+no;

  
        
//     }else{

//     }

//     //숨김
//     //삭제

//     // 뒤로이동
// })

function deleteBoardValidate(){
    if (confirm("삭제하시겠습니까?")) {
        const container = $(this).parents(".container");
        $(this).parents(".container").fadeOut();
        setTimeout(function () { container.remove(); }, 1000)


        location.href='detail/delete?type='+type+'&no='+no;

  
        
    }else{
        return false;
    }
}



