    // 시급
    var countHour = 5860;
    $(function () {
        setInterval(() => {
            if (countHour <= 9860) {
                $('.counting').text(countHour).addClass("duration").css("fontSize", "50px");
                countHour += 100;
            }
        }, 40);
    })
    // 일급
    var countDay = 38880;
    $(function () {
        setInterval(() => {
            if (countDay <= 78880) {
                $('.countingDay').text(countDay).addClass("duration").css("fontSize", "50px");
                countDay += 1000;
            }
        }, 40);
    })
    // 월급
    var countMonth = 1660740;
    $(function () {
        setInterval(() => {
            if (countMonth <= 2060740) {
                $('.countingMonth').text(countMonth).addClass("duration").css("fontSize", "50px");
                countMonth += 10000;
            }
        }, 40);
    })

    // 년도
    var countYear = 1984;
    $(function () {
        setInterval(() => {
            if (countYear <= 2024) {
                $('.countingYear').text(countYear).css("fontSize", "30px");
                countYear += 1;
            }
        }, 40);
    })