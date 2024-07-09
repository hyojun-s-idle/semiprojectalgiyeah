/* headerUP 슬라이드 */
const sliderWrapper = document.querySelector(".container");

const sliderContainer = document.querySelector(".slide-container");
let slideWidth = sliderContainer.offsetWidth;//슬라이드 전체 크기

// 슬라이드 전체를 선택해 값을 변경해주기 위해 슬라이드 전체 선택
let slides = document.querySelectorAll(".slide");

// 현재 슬라이드 위티가 슬라이드 개수를 넘기지 않게 하기 위한 변수
const maxSlide = slides.length;
let currSlide = 1;
let oneSlideWidth = 0;

// #header-UP가져오기
const headerUP = document.getElementById("header-UP");
function nextMove() {
    //transform: translate();
    if (currSlide == maxSlide) {
        oneSlideWidth = 0;
        sliderContainer.style.transform = "translate(" + oneSlideWidth + "px)";
        currSlide = 1;

    } else {
        oneSlideWidth += -slides[currSlide].offsetWidth;
        sliderContainer.style.transform = "translate(" + oneSlideWidth + "px)";
        currSlide++;

    }

}

let loopInterval = setInterval(() => {
    nextMove(); // 다음 슬라이드를 보여주는 함수
}, 10000);

for (let i = 0; i < slides.length; i++) {
    slides[i].addEventListener("mouseover", () => {
        clearInterval(loopInterval);
    })

    slides[i].addEventListener("mouseout", () => {
        loopInterval = setInterval(() => {
            nextMove(); // 다음 슬라이드를 보여주는 함수
        }, 10000);
    })
}