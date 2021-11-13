document.querySelectorAll(".meal").forEach((meal, index) => {
  console.log("-");

  console.log("  id: " + (index + 1));

  console.log("  name: \"" + meal.querySelector("h4")?.textContent + "\"");

  console.log("  restaurant_id: " + (index + 1));

  const show = meal.classList.contains("show");

  const priorities = ["omg", "major", "normal", "minor", "optional"];

  const priority = priorities.find((className) => meal.classList.contains(className)) || "normal";

  console.log("  priority: \"" + priority + "\"");

  const visible = !meal.classList.contains("hide")

  console.log("  visible: " + visible);

  console.log("  info:");

  const food = meal.querySelector(".info.selection");

  if (food) {
    console.log("    food:");

    const names = Array.prototype.map.call(food.querySelectorAll("h6"), (header) => header.textContent);

    const selections = Array.prototype.map.call(food.querySelectorAll("ul"), (items) => Array.prototype.map.call(items.querySelectorAll("li"), (item) => item.textContent));

    names.forEach((name, index) => {
      console.log("      " + name + ":");

      selections[index].forEach((item) => {
        console.log("        - \"" + item + "\"");
      });
    });
  }

  const ratings = meal.querySelector(".info.rating");

  if (ratings) {
    console.log("    ratings:");

    ratings.textContent.split(", ").forEach((rating) => {
      console.log("      " + rating);
    });
  }
});
