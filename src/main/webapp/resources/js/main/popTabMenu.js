
/* tab메뉴 */
const tabItem = document.querySelectorAll(".pop-tab-item");
const postContent = document.querySelectorAll(".popTitle");
console.log(tabItem);
console.log(postContent);
tabItem.forEach(function (item, index) {
  item.addEventListener("click", function (e) {
    e.preventDefault();

    postContent.forEach(function (content) {
      content.classList.remove("tab-active");
    })

    tabItem.forEach(function (content) {
      content.classList.remove("tab-active");
    })

    tabItem[index].classList.add("tab-active");
    postContent[index].classList.add("tab-active");

  })
})