const writeA = document.getElementById("write-write");
const writeBtn = document.getElementById("write");

writeBtn.addEventListener("click", function () {

    if(writeA.style.display == ""){
        writeA.style.display = "inline-block";

    }else if(writeA.style.display == "inline-block"){
        writeA.style.display = "none";
        
    }else if(writeA.style.display == "none"){
        writeA.style.display = "inline-block";
    }

})