document.getElementById("btn").addEventListener("click", function () {


    const wage = Number(document.getElementById("wage").value)
    const hour = Number(document.getElementById("hour").value)
    const min = Number(document.getElementById("min").value)
    const day = Number(document.getElementById("day").value)
    const tax = Number(document.getElementById("tax").value)
    const result = document.getElementById("result")
    let taxSum = 0;


    const sum = Number((wage * (hour+min)) * day);

    if (!(tax == 0)) {
        taxSum = Number(sum * tax)
        const n1 = (String)(Math.round((sum-taxSum)));
        const cn1 = n1.toString()
        .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
        
        result.innerText = cn1 + "원";
    }else{
        const n1 = (String)(Math.round(sum));
        const cn1 = n1.toString()
        .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
        
        result.innerText = cn1 + "원";
    }

})