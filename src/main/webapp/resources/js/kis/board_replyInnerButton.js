//삭제버튼
$(document).on("click", ".deletingReply", function () {
    if (confirm("삭제하시겠습니까?")) {
    const replyContentBox = $(this).parents(".replyContentBox");
    $(this).parents(".replyContentBox").slideUp();
    setTimeout(function () { replyContentBox.remove(); }, 1000)
    }
})




//댓글토글버튼
$(document).on("click", ".replyingNested", function () {
    const disp=$(this).parents(".replyView").children(".nested").css("display");
    if(disp!="none"){
        $(this).parents(".replyView").children(".nested").slideUp();
        $(this).find("span").css("transform","rotate(0deg)").css("transitionDuration","1s");
        
    }
    if(disp=="none"){
        $(this).parents(".replyView").children(".nested").slideDown();
        count=0;
        $(this).find("span").css("transform","rotate(450deg)").css("transitionDuration","1s");
    }

})





//등록버튼
$(document).on("click",".replyNestedRegister",function(){
    const text=$(this).parents(".nested").find(".textarea").val().replaceAll('\n', '<br>')
    const clone =$(this).parents(".nested").clone();
    clone.find(".replyNestedRight").html(text);
    clone.find(".replyNestedRegister").remove();

    clone.find(".textarea").removeClass("textarea");
    clone.find(".textareaBox").removeClass("textareaBox");

    const appendPart=$(this).parents(".replyView").find(".nestedBox").append(clone);


    $(this).parents(".nested").find(".textarea").val("");
})

