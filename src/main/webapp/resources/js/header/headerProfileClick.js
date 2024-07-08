/* header-profile클릭시 화면열림 */
const profile = document.getElementById("header-profile");
const div = document.getElementById("headerProfileHidden");

profile.addEventListener("click", (e) => {
    if (div.style.display == "") {
        div.style.display = "block";

    } else if (div.style.display == "block") {
        div.style.display = "none";

    } else if (div.style.display == "none") {
        div.style.display = "block";
    }
})