mainHotSlide();
function mainHotSlide() {
    let kindSlider = document.querySelector(".kindSlider.main-hot-tab-active");
    let sliderHotsWidth = kindSlider.offsetWidth;// 슬라이드 전체 크기

    // 슬라이드 전체 선택
    let sliderHots = document.querySelectorAll(".slider-hot.main-hot-tab-active");
    let maxHotSlide = sliderHots.length; // 슬라이드 길이

    // 버튼 가져오기
    let moveLeft = document.querySelector(".hot-left.main-hot-tab-active");
    let moveRight = document.querySelector(".hot-right.main-hot-tab-active");

    //현재 슬라이드 위치 알려주는 변수
    let currHotSlide = 1;

    let oneHotSlideWidth = 0;


    moveRight.addEventListener("click", function () {
        if (currHotSlide != maxHotSlide) {
            oneHotSlideWidth += -sliderHots[currHotSlide].offsetWidth;
            kindSlider.style.transform = "translate(" + oneHotSlideWidth + "px)";
            currHotSlide++;
        }
    })

    moveLeft.addEventListener("click", function () {
        if (currHotSlide == maxHotSlide) {
            oneHotSlideWidth = 0;
            kindSlider.style.transform = "translate(" + oneHotSlideWidth + "px)";
            currHotSlide--;
        }
    })
}


/* tabsilde */
let kindSlide = document.querySelectorAll(".kindSlider");
let sliderHot = document.querySelectorAll(".slider-hot");
let moveLefttab = document.querySelectorAll(".hot-left");
let moveRighttab = document.querySelectorAll(".hot-right");
const mainTabItem = document.querySelectorAll(".hot-tab-item");
const mainPostContent = document.querySelectorAll(".hot-post-suround-content");

mainTabItem.forEach(function (item, index) {
    item.addEventListener("click", function (e) {
        e.preventDefault();

        mainPostContent.forEach(function (content) {
            content.classList.remove("main-hot-tab-active");
        })

        mainTabItem.forEach(function (content) {
            content.classList.remove("main-hot-tab-active");
        })

        kindSlide.forEach(function (content) {
            content.classList.remove("main-hot-tab-active");
        })

        sliderHot.forEach(function (content) {
            content.classList.remove("main-hot-tab-active");
        })

        moveLefttab.forEach(function (content) {
            content.classList.remove("main-hot-tab-active");
        })

        moveRighttab.forEach(function (content) {
            content.classList.remove("main-hot-tab-active");
        })

        mainTabItem[index].classList.add("main-hot-tab-active");
        mainPostContent[index].classList.add("main-hot-tab-active");
        mainPostContent[index].querySelector(".kindSlider").classList.add("main-hot-tab-active");
        let slidh = mainPostContent[index].querySelectorAll(".slider-hot");
        for (let i = 0; i < slidh.length; i++) {
            slidh[i].classList.add("main-hot-tab-active");
        }
        mainPostContent[index].querySelector(".hot-left").classList.add("main-hot-tab-active");
        mainPostContent[index].querySelector(".hot-right").classList.add("main-hot-tab-active");

        mainHotSlide();

    })
})