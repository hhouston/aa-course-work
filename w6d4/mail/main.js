document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll(".sidebar-nav li").forEach((el) => {
    el.addEventListener("click", event => {

      let name = el.innerText.toLowerCase();
      window.location.hash = name;
    });
  });
});
