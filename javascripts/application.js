(function() {
  const defaultUIState = {
    "price": {
      "selector": ".price",
      "show": false
    },
    "hotel": {
      "selector": ".hotel",
      "show": true
    },
    "airport": {
      "selector": ".airport",
      "show": true
    },
    "flight": {
      "selector": ".flight",
      "show": true
    },
    "optional": {
      "selector": ".optional",
      "show": false
    },
    "minor": {
      "selector": ".minor",
      "show": true
    },
    "normal": {
      "selector": ".normal",
      "show": true
    },
    "major": {
      "selector": ".major",
      "show": true
    },
    "route": {
      "selector": ".route",
      "show": false
    }
  };

  const deepClone = function(obj, hash = new WeakMap()) {
    if (Object(obj) !== obj) {
      return obj;
    }

    if (hash.has(obj)) {
      return hash.get(obj);
    }

    let result = (() => {
      if (Array.isArray(obj)) {
        return [];
      } else {
        if (obj.constructor) {
          return new obj.constructor();
        } else {
          return Object.create(null);
        }
      }
    })();

    hash.set(obj, result);

    if (obj instanceof Map) {
      Array.from(obj, ([key, val]) => result.set(key, deepClone(val, hash)));
    }

    return Object.assign(result, ...Object.keys(obj).map(key => ({ [key]: deepClone(obj[key], hash) })));
  };

  // This is a shallow parse.
  const parseQueryString = function(queryString) {
    const queryParts = (queryString || "").toString().split("?");

    if (!queryParts || !queryParts.length || queryParts.length < 2) {
      return null;
    }

    return queryParts[1].split("&").reduce(function(accumulator, currentValue) {
      const parts = currentValue.split("=");

      const key = decodeURIComponent(parts[0]);

      const value = decodeURIComponent(parts[1] || "");

      accumulator[key] = value;

      return accumulator;
    }, {});
  };

  const queryHasKey = function(query, key) {
    key = (key || "").toString();

    return key && query && query[key];
  };

  const queryKeyIsTrue = function(query, key) {
    return queryHasKey(query, key) && (query[key] === "1" || query[key].toString().toLowerCase() === "true");
  };

  const queryKeyIsFalse = function(query, key) {
    return queryHasKey(query, key) && (query[key] === "0" || query[key].toString().toLowerCase() === "false");
  };

  const serializeObjectToQueryString = function(params, prefix) {
    const query = Object.keys(params).map((key) => {
      const value = params[key];

      if (params.constructor === Array) {
        key = `${prefix}[]`;
      } else {
        if (params.constructor === Object) {
          if (prefix) {
            key = `${prefix}[${key}]`;
          }
        }
      }

      if (typeof value === "object") {
        return serializeObjectToQueryString(value, key);
      } else {
        return `${key}=${encodeURIComponent(value)}`;
      }
    });

    return [].concat.apply([], query).join("&");
  };

  const getUIStateFromQuery = function(query) {
    const newState = deepClone(defaultUIState);

    Object.keys(query).forEach((key) => {
      const show = (() => {
        if (queryKeyIsTrue(query, key)) {
          return true;
        } else {
          if (queryKeyIsFalse(query, key)) {
            return false;
          } else {
            !!query[key].show;
          }
        }
      })();

      if (newState.hasOwnProperty(key)) {
        newState[key].show = show;
      }
    });

    return newState;
  };

  const showAll = function(selector) {
    Array.prototype.slice.call(document.querySelectorAll(selector), 0).forEach(function(element) {
      element.classList.add("show");

      element.classList.remove("hide");
    });
  };

  const hideAll = function(selector) {
    Array.prototype.slice.call(document.querySelectorAll(selector), 0).forEach(function(element) {
      element.classList.add("hide");

      element.classList.remove("show");
    });
  };

  const setLocationSearch = function(key, value) {
    const query = parseQueryString(window.location.search) || {};

    query[key] = value;

    const state = getUIStateFromQuery(query);

    const url = `${window.location.origin}${window.location.pathname}?${serializeObjectToQueryString(query)}`;

    window.history.pushState(state, "", url);
  };

  const setUIFromUIState = function(state) {
    Object.keys(state).forEach((key) => {
      if (state[key].show) {
        showAll(state[key].selector);

        document.querySelector(`.controls button.control[data-key=${key}]`).classList.add("on");

        document.querySelector(`.controls button.control[data-key=${key}]`).classList.remove("off");
      } else {
        hideAll(state[key].selector);

        document.querySelector(`.controls button.control[data-key=${key}]`).classList.add("off");

        document.querySelector(`.controls button.control[data-key=${key}]`).classList.remove("on");
      }
    });
  };

  const setEventHandlers = function() {
    window.onpopstate = function(event) {
      setUIFromUIState(deepClone(event.state || defaultUIState));
    };

    Array.prototype.slice.call(document.querySelectorAll(".controls button.control") || [], 0).forEach(function(controlButton) {
      controlButton.addEventListener("click", function(event) {
        event.preventDefault();

        if (event.target.classList.contains("on")) {
          setLocationSearch(event.target.dataset.key, "0");
        } else {
          setLocationSearch(event.target.dataset.key, "1");
        }

        setUIFromUIState(getUIStateFromQuery(parseQueryString(window.location.search) || defaultUIState));
      }, false);
    });
  };

  const completed = function() {
    setUIFromUIState(getUIStateFromQuery(parseQueryString(window.location.search) || defaultUIState));

    setEventHandlers();
  };

  if (document.readyState === "complete") {
    setTimeout(completed);
  } else {
    document.addEventListener("DOMContentLoaded", completed, false);
  }
})();
