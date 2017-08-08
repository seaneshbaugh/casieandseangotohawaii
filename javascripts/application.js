(function() {
  var onReady, parseQueryString, queryHasKey, showAll;

  onReady = function(completed) {
    if (document.readyState === "complete") {
      setTimeout(completed);
    } else {
      document.addEventListener("DOMContentLoaded", completed, false);
    }
  };

  parseQueryString = function(queryString) {
    var queryParts;

    queryParts = (queryString || "").toString().split("?");

    if (!queryParts || !queryParts.length || queryParts.length < 2) {
      return null;
    }

    return queryParts[1].split("&").reduce(function(accumulator, currentValue) {
      var parts, key, value;

      parts = currentValue.split("=");

      key = decodeURIComponent(parts[0]);

      value = decodeURIComponent(parts[1] || "");

      accumulator[key] = value;

      return accumulator;
    }, {});
  }

  queryHasKey = function(query, key) {
    key = (key || "").toString();

    if (!key) {
      return false;
    }

    return query && query[key] && (query[key] === "1" || query[key].toString().toLowerCase() === "true");
  }

  showAll = function(selector) {
    Array.prototype.slice.call(document.querySelectorAll(selector), 0).forEach(function(element) {
      element.classList.add("show");
    });
  }

  onReady(function() {
    var query;

    query = parseQueryString(window.location.search);

    if (queryHasKey(query, "optional")) {
      showAll(".attraction.optional");
    }

    if (queryHasKey(query, "price")) {
      showAll(".info.price");
    }
  });
})();
