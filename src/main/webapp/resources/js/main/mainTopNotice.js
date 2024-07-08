$(document).ready(function(){
    $('.main-top-notice').marquee({
        speed: 200, // 속도
        gap: 50, // 간격
        delayBeforeStart: 0, // 시작 delay값
        direction: 'left', // 방향
        duplicated: true, // 선택 영역 복제
        pauseOnHover: true // hover시 일시중지 여부
    });
})