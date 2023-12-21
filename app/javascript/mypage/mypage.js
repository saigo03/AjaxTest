document.addEventListener("turbo:load", function() {
  const mypageButton = document.getElementById("mypage-link");
  const mypagePopup = document.getElementById("mypage-popup");
  const overlay = document.getElementById("overlay");

  if (mypageButton && mypagePopup && overlay) {
    mypageButton.addEventListener("click", () => {
      mypagePopup.style.display = "block";
      overlay.style.display = "block";
    });

    overlay.addEventListener("click", () => {
      mypagePopup.style.display = "none";
      overlay.style.display = "none";
    });
  }
});
