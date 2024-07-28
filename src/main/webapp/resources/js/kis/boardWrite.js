$('#boardDate').html(new Date().toLocaleDateString());
$('textarea').on("input", function () {
    $(this).css('height', 'auto');
    $(this).height(this.scrollHeight);
})
$('#footer').on("mouseover", function () {
    $(this).css("backgroundColor", "blue");
})

// 종류버튼*직종버튼
const boardCategory = $('#boardCategory');
$('#boardCategory>select').on("focus", function () {
    console.log($(this)[0] == $('#albaBoardSelect')[0])
    console.log($(this)[0] == $('#albaSelect')[0])

    if (
        $(this)[0] == $('#albaBoardSelect')[0]
    ) {
        // boardCategory.animate({"height":"150px"},'slow')
        // boardCategory.animate({"height":"150px"},'fast')
        boardCategory.animate({ "marginBottom": "50px" })
    }
    if (
        $(this)[0] == $('#albaSelect')[0]
    ) {
        // boardCategory.animate({"height":"350px"},'fast')
        // boardCategory.animate({"height":"350px"},'slow')
        boardCategory.animate({ "marginBottom": "200px" })
        // boardCategory.animate({"height":"350px"})
    }

})
$('#boardCategory>select').on("blur", function () {
    boardCategory.animate({ "marginBottom": "0px" })
    // boardCategory.animate({"height":"100px"},'fast')
})



var count = 1;
$('#mouseRotate').on("click", function () {
    const containerHeight = $('.containerBox').height();
    console.log(containerHeight);
    const containerHeightPortion = containerHeight * 0.75;
    const containerHeightPortionRemain = containerHeight * 0.25;
    const containerHeightTop = containerHeight + 100;

    const bottomElement = $('.bottomElement');
    if (count == 1) {
        $(function () {
            $(bottomElement[0]).css("transform", "translate(-650px,0px)").css("transition", "1s, easeOut");
            $(bottomElement[1]).css("transform", "translate(-750px,0px)").css("transition", "1s, easeOut");
            $(bottomElement[2]).css("transform", "translate(-850px,0px)").css("transition", "1s, easeOut");
            $(bottomElement[3]).css("transform", "translate(-950px,0px)").css("transition", "1s, easeOut");
            $(bottomElement[4]).css("transform", "translate(-1050px,0px)").css("transition", "1s, easeOut");
        })

        setTimeout(function () {
            $(bottomElement[0]).css("transform", "translate(-650px," + (-1) * containerHeightPortion + "px)").css("transition", "1s");
            $(bottomElement[1]).css("transform", "translate(-750px," + ((-1) * containerHeightPortion + 100) + "px)").css("transition", "1s");
            $(bottomElement[2]).css("transform", "translate(-850px," + ((-1) * containerHeightPortion + 200) + "px)").css("transition", "1s");
            $(bottomElement[3]).css("transform", "translate(-950px," + ((-1) * containerHeightPortion + 300) + "px)").css("transition", "1s");
            $(bottomElement[4]).css("transform", "translate(-1050px," + ((-1) * containerHeightPortion + 400) + "px)").css("transition", "1s");
        }, 1000)
        count++;
    } else if (count == 2) {
        $(function () {
            $(bottomElement[0]).css("transform", "translate(-650px," + (-1) * containerHeightTop + "px)").css("transition", "1s");
            $(bottomElement[1]).css("transform", "translate(-750px," + ((-1) * containerHeightTop) + "px)").css("transition", "1s");
            $(bottomElement[2]).css("transform", "translate(-850px," + (-1) * containerHeightTop + "px)").css("transition", "1s");
            $(bottomElement[3]).css("transform", "translate(-950px," + (-1) * containerHeightTop + "px)").css("transition", "1s");
            $(bottomElement[4]).css("transform", "translate(-1050px," + (-1) * containerHeightTop + "px)").css("transition", "1s");
        })

        setTimeout(function () {
            $(bottomElement[0]).css("transform", "translate(+400px," + (-1) * containerHeightTop + "px)").css("transition", "1s, easeOut");
            $(bottomElement[1]).css("transform", "translate(+200px," + (-1) * containerHeightTop + "px)").css("transition", "1s, easeOut");
            $(bottomElement[2]).css("transform", "translate(+0px," + (-1) * containerHeightTop + "px)").css("transition", "1s, easeOut");
            $(bottomElement[3]).css("transform", "translate(-200px," + (-1) * containerHeightTop + "px)").css("transition", "1s, easeOut");
            $(bottomElement[4]).css("transform", "translate(-400px," + (-1) * containerHeightTop + "px)").css("transition", "1s, easeOut");
        }, 1000)
        count++;
    } else if (count == 3) {
        $(function () {
            $(bottomElement[0]).css("transform", "translate(+950px," + (-1) * containerHeightTop + "px)").css("transition", "1s");
            $(bottomElement[1]).css("transform", "translate(850px," + ((-1) * containerHeightTop) + "px)").css("transition", "1s");
            $(bottomElement[2]).css("transform", "translate(750px," + (-1) * containerHeightTop + "px)").css("transition", "1s");
            $(bottomElement[3]).css("transform", "translate(650px," + (-1) * containerHeightTop + "px)").css("transition", "1s");
            $(bottomElement[4]).css("transform", "translate(550px," + (-1) * containerHeightTop + "px)").css("transition", "1s");
        })

        setTimeout(function () {
            $(bottomElement[0]).css("transform", "translate(+950px," + (-1) * containerHeightPortionRemain + "px)").css("transition", "1s, easeOut");
            $(bottomElement[1]).css("transform", "translate(850px," + ((-1) * containerHeightPortionRemain - 100) + "px)").css("transition", "1s, easeOut");
            $(bottomElement[2]).css("transform", "translate(750px," + ((-1) * containerHeightPortionRemain - 200) + "px)").css("transition", "1s, easeOut");
            $(bottomElement[3]).css("transform", "translate(650px," + ((-1) * containerHeightPortionRemain - 300) + "px)").css("transition", "1s, easeOut");
            $(bottomElement[4]).css("transform", "translate(550px," + ((-1) * containerHeightPortionRemain - 400) + "px)").css("transition", "1s, easeOut");
        }, 1000)
        count++;
    } else if (count == 4) {
        $(function () {
            $(bottomElement[0]).css("transform", "translate(+950px," + 0 + "px)").css("transition", "1s, easeOut");
            $(bottomElement[1]).css("transform", "translate(850px," + 0 + "px)").css("transition", "1s, easeOut");
            $(bottomElement[2]).css("transform", "translate(750px," + 0 + "px)").css("transition", "1s, easeOut");
            $(bottomElement[3]).css("transform", "translate(650px," + 0 + "px)").css("transition", "1s, easeOut");
            $(bottomElement[4]).css("transform", "translate(550px," + 0 + "px)").css("transition", "1s, easeOut");
        })

        setTimeout(function () {
            $(bottomElement[0]).css("transform", "translate(0px," + 0 + "px)").css("transition", "1s");
            $(bottomElement[1]).css("transform", "translate(0px," + 0 + "px)").css("transition", "1s");
            $(bottomElement[2]).css("transform", "translate(0px," + 0 + "px)").css("transition", "1s");
            $(bottomElement[3]).css("transform", "translate(0px," + 0 + "px)").css("transition", "1s");
            $(bottomElement[4]).css("transform", "translate(0px," + 0 + "px)").css("transition", "1s");
        }, 1000)
        count = 1;
    }
})