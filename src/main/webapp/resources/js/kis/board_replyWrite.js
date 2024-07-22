let today=new Date();
let year=today.getFullYear();
let month=today.getMonth()+1;
let date=today.getDate();
$(".todayDate").text(year + "."+month+"."+date);