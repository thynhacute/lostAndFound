const likeBtn = document.querySelector(".like_btn");
let likeIcon = document.querySelector("#icon");

let count = document.querySelector("#count");


//button clicked
let clicked = false;

likeBtn.addEventListener("click", () => {
    if (!clicked) {
        clicked = true;
        likeIcon.innerHTML = `<i class="far fa-thumbs-up"></i>`;
        likeIcon.style.color = "rgb(36, 0, 199)";
        document.querySelector("#like").style.color = "rgb(36, 0, 199)";
        count.textContent++;
        count.style.color = "rgb(36, 0, 199)";
    }
    else{
        clicked = false;
        likeIcon.innerHTML = `<i class="far fa-thumbs-up"></i>`;
        likeIcon.style.color = "black";
        document.querySelector("#like").style.color = "black";
        count.textContent--;
        count.style.color = "black";
    }

})
