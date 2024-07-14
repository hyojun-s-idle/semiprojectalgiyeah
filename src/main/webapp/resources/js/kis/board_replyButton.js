

//댓글작성
$(document).on("input",'textarea', function () {
    $(this).css('height', 'auto');
    $(this).height(this.scrollHeight);
})


// 댓글등록버튼
const replyContentBox = $('#replyContentBox');
const textareaReplyBox = $('.textareaReplyBox')
$('#replyRegister').on('click', function () {

    const text = $('#textareaReply').val().replaceAll('\n', '<br>');

    $(this).siblings();

    const clone = $(this).siblings().clone();
    // clone.find(".replyButtonBox").addClass("flex");
    clone.find(".replyButtonBox").css("display","flex");
    clone.find(".replyNestedButtonBox").css("display","flex");
    // replyNestedButtonBox
                            
    clone.find(".textareaReplyBox").html(text);
    clone.find(".textareaReplyBox").attr('class','replyContent');
    clone.find(".replyContent").append($("<div class='replyNestedBox'>"));
    clone.find(".replyNestedRightBox").addClass("replyNestedDisplay");
    
    
    $('#replyList').append(clone);

    $('.textareaReply').val("");
})

