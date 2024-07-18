//게시글숨김

$('#boardButton').on('click', function () {
    
    
    
    const display=$('#board').css("display");
    if(display!="none"){
        $('.arrowBoard').addClass("rotate90")
        $('.arrowBoard').removeClass("rotate0")
    }else{
        $('.arrowBoard').addClass("rotate0")
        $('.arrowBoard').removeClass("rotate90")
    }
    $('#board').slideToggle();

})



// 댓글작성
$('#replyButton').on('click', function () {

    const display=$('#replyWrite').css("display");

    if(display!="none"){
        $('.arrowReplyWriting').addClass("rotate90")
        $('.arrowReplyWriting').removeClass("rotate0")
    }else{
        $('.arrowReplyWriting').addClass("rotate0")
        $('.arrowReplyWriting').removeClass("rotate90")
    }

    $('#replyWrite').slideToggle();
})

//댓글숨김
$('#replyMinusButton').on('click', function () {

    const display=$('#replyList').css("display");

    if(display!="none"){
        $('.arrowReplyList').addClass("rotate90")
        $('.arrowReplyList').removeClass("rotate0")
    }else{
        $('.arrowReplyList').addClass("rotate0")
        $('.arrowReplyList').removeClass("rotate90")
    }

    $('#replyList').slideToggle();
})


// span: arrowBoard
// span: arrowReplyList
// span: arrowReplyWriting