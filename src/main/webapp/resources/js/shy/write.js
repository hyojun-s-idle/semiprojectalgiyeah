document.getElementById("write").addEventListener("click", function () {
    const a = document.getElementById("write-write");

    if (a.style.display == "none") {
        a.style.display = "inline-block";
    } else {
        a.style.display = "none";
    }
})