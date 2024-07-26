
//수정버튼
let counting=0;
$(document).on("click", '.updatingReply',function () {
    counting++;




    if(counting%2==1){
        $('.mod').addClass("showing");
        $('.modback').addClass("showing");

        // 댓글내용 띄우기
        const text=$(this).parents(".replyView").find(".replyContent").text();
        console.log(text);
        $(".upr").val(text);

    }else{


        
    }

})


// 등록버튼
let time=250;
$(document).on("click", '.upb', function () {
    
    $('.modback').addClass("hidingX");
    setTimeout(function(){
        $('.upb').addClass("hidingY");
    },time*1)
    setTimeout(function(){
        $('.upr').addClass("hidingX");
    },time*2)
    setTimeout(function(){
        $('.mod').addClass("hidingTrans");
    },time*3)
    setTimeout(function(){
        updateReply();


        $('.modback').removeClass("hidingX");
        $('.upb').removeClass("hidingY");
        $('.upr').removeClass("hidingX");
        $('.mod').removeClass("hidingTrans");

        
        $('.updatingReply').removeClass("topping");
        $('.mod').removeClass("showing");
        $('.modback').removeClass("showing");
        counting=0;

    },time*4)


})


//텍스트상자 고정
$(document).on("input", ".upr", function(){
    $(this).css("height","170px");
})