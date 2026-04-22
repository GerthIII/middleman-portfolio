document.addEventListener("DOMContentLoaded", function () {
  var navbar = document.querySelector(".navbar");
  var banner = document.getElementById("banner");
  if (navbar && banner) {
    navbar.classList.add("navbar--hidden");
    new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        navbar.classList.toggle("navbar--hidden", entry.isIntersecting);
      });
    }, { threshold: 0 }).observe(banner);
  }

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
