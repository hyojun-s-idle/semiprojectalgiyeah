/* comment자르기 */
const commentText = document.querySelectorAll(".content");
let comAll = "";
let comCut = "";
for(let i = 0; i < commentText.length; i++){
    if(commentText[i].innerText.length > 20){
        comAll = commentText[i].innerText;
        comCut = commentText[i].innerText.substr(0,16);
        commentText[i].innerText = comCut + "...";
        
    }
}