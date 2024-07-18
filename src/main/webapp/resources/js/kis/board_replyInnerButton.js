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
    // $(this).parents(".replyView").find(".replyNestedRightBox").slideToggle();
    $(this).parents(".replyView").children(".replyNestedRightBox").slideToggle();
    
})





//등록버튼
$(document).on("click",".replyNestedRegister",function(){
    const text=$(this).parents(".replyNestedRightBox").find(".textarea").val().replaceAll('\n', '<br>')
    const clone =$(this).parents(".replyNestedRightBox").clone();
    clone.find(".replyNestedRight").html(text);
    clone.find(".replyNestedRegister").remove();

    clone.find(".textarea").removeClass("textarea");
    clone.find(".textareaBox").removeClass("textareaBox");

    const appendPart=$(this).parents(".replyView").find(".replyNestedBox").append(clone);

    // $('.replyNestedBox').append(clone);

    $(this).parents(".replyNestedRightBox").find(".textarea").val("");
})

