const song = $('#song');
const songGet = $('#song').get(0);
const songProgress = $('#songProgress');
const playBtn = $('#playBtn');
const backBtn = $('#backBtn');
const forwBtn = $('#forwBtn');

// 값규격화
setTimeout(function () {
    songProgress.attr('max', songGet.duration);
}, 1000)


// range바 움직임
setInterval(function () {
    songProgress.val(songGet.currentTime);
}, 1000)

// range바 드래그
$('#songProgress').on("mouseup", function () {
    songGet.currentTime = songProgress.val();

})




// 하단버튼
var count = 0;
const coverBox = $(".coverBox");
playBtn.on("click", function () {

    if (count == 0) {

        songGet.play();
        coverBox.removeClass("pauseBox");
        count++;
        
    } else {
        songGet.pause();
        coverBox.addClass("pauseBox");
        count = 0;
    }
})

backBtn.on("click", function () { songGet.currentTime -= 3; })
forwBtn.on("click", function () { songGet.currentTime += 3; })

