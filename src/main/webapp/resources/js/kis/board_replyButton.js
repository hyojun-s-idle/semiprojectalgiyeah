

//댓글작성
$(document).on("input",'textarea', function () {
    $(this).css('height', 'auto');
    $(this).height(this.scrollHeight);
})


// 댓글등록버튼
const replyContentBox = $('#replyContentBox');
const textareaReplyBox = $('.textareaReplyBox')
// $('#replyRegister').on('click', function () {

//     const text = $('#textareaReply').val().replaceAll('\n', '<br>');

//     $(this).siblings();

//     const clone = $(this).siblings().clone();
//     clone.find(".replyButtonBox").css("display","flex");
                            
//     clone.find(".textareaReplyBox").html(text);
//     clone.find(".textareaReplyBox").attr('class','replyContent');
//     clone.find(".replyContent").append($("<div class='nestedBox'>"));
    
    
//     $('#replyList').append(clone);

//     // $('.textareaReply').val("");
//     //form태그 초기화되서 삭제처리 !!!
//     //cf. ajax처리하는경우 필요함. <- 화면내 처리하기에 <- 화면단위 ""필요 
    
// })

