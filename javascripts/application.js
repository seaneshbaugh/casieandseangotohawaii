(function() {
  var onReady, parseQueryString, queryHasKey, queryKeyIsTrue, queryIsFalse, showAll, showAllIfQueryKeyIsTrue, hideAllIfQueryKeyIsFalse;

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

    return key && query && query[key];
  };

  queryKeyIsTrue = function(query, key) {
    return queryHasKey(query, key) && (query[key] === "1" || query[key].toString().toLowerCase() === "true");
  };

  queryKeyIsFalse = function(query, key) {
    return queryHasKey(query, key) && (query[key] === "0" || query[key].toString().toLowerCase() === "false");
  };

  showAll = function(selector) {
    Array.prototype.slice.call(document.querySelectorAll(selector), 0).forEach(function(element) {
      element.classList.add("show");

      element.classList.remove("hide");
    });
  };

  hideAll = function(selector) {
    Array.prototype.slice.call(document.querySelectorAll(selector), 0).forEach(function(element) {
      element.classList.add("hide");

      element.classList.remove("show");
    });
  }

  showAllIfQueryKeyIsTrue = function(query, key, selector) {
    if (queryKeyIsTrue(query, key)) {
      showAll(selector);
    }
  }

  hideAllIfQueryKeyIsFalse = function(query, key, selector) {
    if (queryKeyIsFalse(query, key)) {
      hideAll(selector);
    }
  }

  onReady(function() {
    var query;

    query = parseQueryString(window.location.search);

    showAllIfQueryKeyIsTrue(query, "optional", ".attraction.optional");

    showAllIfQueryKeyIsTrue(query, "price", ".price");

    hideAllIfQueryKeyIsFalse(query, "hotel", ".hotel");

    hideAllIfQueryKeyIsFalse(query, "airport", ".airport");

    hideAllIfQueryKeyIsFalse(query, "flight", ".flight");

    hideAllIfQueryKeyIsFalse(query, "minor", ".attraction.minor");

    hideAllIfQueryKeyIsFalse(query, "normal", ".attraction.normal");

    hideAllIfQueryKeyIsFalse(query, "major", ".attraction.major");

    hideAllIfQueryKeyIsFalse(query, "route", ".route");
  });
})();
