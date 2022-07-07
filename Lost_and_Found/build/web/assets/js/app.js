//const likeBtn = document.querySelector(".like_btn");
//let likeIcon = document.querySelector("#icon");
//
//let count = document.querySelector("#count");
//
//
////button clicked
//let clicked = false;
//
//likeBtn.addEventListener("click", () => {
//    if (!clicked) {
//        clicked = true;
//        likeIcon.innerHTML = `<i class="far fa-thumbs-up"></i>`;
//        likeIcon.style.color = "rgb(36, 0, 199)";
//        document.querySelector("#like").style.color = "rgb(36, 0, 199)";
//        count.textContent++;
//        count.style.color = "rgb(36, 0, 199)";
//    }
//    else{
//        clicked = false;
//        likeIcon.innerHTML = `<i class="far fa-thumbs-up"></i>`;
//        likeIcon.style.color = "black";
//        document.querySelector("#like").style.color = "black";
//        count.textContent--;
//        count.style.color = "black";
//    }
//
//})

//Just don't do that ==" 
//Due to the destruction of view in servlet, 
//Elements on page are also destroyed and regenerated, so clicked state of buttons are not kept
//Change button's icon or text instead and do actions based on that change
