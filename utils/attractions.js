document.querySelectorAll(".attraction").forEach((attraction, index) => {
  console.log("-");

  console.log("  id: " + (index + 1));

  console.log("  name: \"" + attraction.querySelector("h4").textContent + "\"");

  const show = attraction.classList.contains("show");

  const types = ["beach", "hike"];

  const type = types.find((className) => attraction.classList.contains(className)) || "";

  console.log("  type: \"" + type +  "\"");

  const priorities = ["omg", "major", "normal", "minor", "optional"];

  const priority = priorities.find((className) => attraction.classList.contains(className)) || "normal";

  console.log("  priority: \"" + priority + "\"");

  const visible = !attraction.classList.contains("hide")

  console.log("  visible: " + visible);

  const links = attraction.querySelectorAll(".links .link");

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

  const infos = attraction.querySelectorAll(".info");

  if (infos.length > 0) {
    console.log("  info:");

    infos.forEach((info) => {
      const infoType = Array.prototype.filter.call(info.classList, (className) => className !== "info")[0].replaceAll("-", "_");

      console.log("    " + infoType + ": \"" + info.textContent + "\"");
    });
  }
});
