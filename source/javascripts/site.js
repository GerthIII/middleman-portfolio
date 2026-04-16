document.addEventListener("DOMContentLoaded", function () {
  var btn = document.getElementById("copy-email");
  var tooltip = document.getElementById("copy-tooltip");

  if (btn) {
    btn.addEventListener("click", function (e) {
      e.preventDefault();
      var email = btn.getAttribute("data-email");
      navigator.clipboard.writeText(email).then(function () {
        tooltip.classList.add("visible");
        setTimeout(function () {
          tooltip.classList.remove("visible");
        }, 1500);
      });
    });
  }
});
