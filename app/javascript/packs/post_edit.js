const post = document.querySelector("#post_screen");

const post_btn = document.querySelector("#post_btn");

post_btn.addEventListener("click", () => {
  post.classList.toggle("is_active")
})

