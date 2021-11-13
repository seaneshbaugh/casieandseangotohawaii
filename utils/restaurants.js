document.querySelectorAll(".restaurant").forEach((restaurant, index) => {
  console.log("-");

  console.log("  id: " + (index + 1));

  console.log("  name: \"" + restaurant.querySelector("h5")?.textContent + "\"");

  const show = restaurant.classList.contains("show");

  const priorities = ["omg", "major", "normal", "minor", "optional"];

  const priority = priorities.find((className) => restaurant.classList.contains(className)) || "normal";

  console.log("  priority: \"" + priority + "\"");

  const visible = !restaurant.classList.contains("hide")

  console.log("  visible: " + visible);

  const links = restaurant.querySelectorAll(".links .link");

  if (links.length > 0) {
    console.log("  links:");

    links.forEach((link) => {
      console.log("    -");

      const linkType = Array.prototype.filter.call(link.classList, (className) => className !== "link")[0];

      console.log("      type: \"" + linkType + "\"");

      const url = link.querySelector("a").href;

      console.log("      url: \"" + url + "\"");
    });
  }

  const infos = restaurant.querySelectorAll(".info:not(.selection)");

  if (infos.length > 0) {
    console.log("  info:");

    infos.forEach((info) => {
      const infoType = Array.prototype.filter.call(info.classList, (className) => className !== "info")[0].replaceAll("-", "_");

      console.log("    " + infoType + ": \"" + info.textContent + "\"");
    });
  }
});
