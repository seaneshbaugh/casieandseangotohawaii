module.exports = {
  "env": {
    "browser": true
  },
  "extends": "eslint:recommended",
  "parser": "babel-eslint",
  "parserOptions": {
    "ecmaFeatures": {
      "experimentalObjectRestSpread": false
    }
  },
  "plugins": [
  ],
  "rules": {
    "brace-style": [
      "error",
      "1tbs"
    ],
    "comma-dangle": [
      "error",
      "never"
    ],
    "curly": [
      "error",
      "all"
    ],
    "indent": [
      "error",
      2
    ],
    "keyword-spacing": [
      "error",
      {
        "after": true,
        "before": true
      }
    ],
    "linebreak-style": [
      "error",
      "unix"
    ],
    "max-len": [
      "error",
      200
    ],
    "no-unused-vars": [
      "error",
      {
        "argsIgnorePattern": "^_"
      }
    ],
    "one-var": [
      "error",
      {
        "uninitialized": "always",
        "initialized": "never"
      }
    ],
    "padded-blocks": [
      "error",
      "never"
    ],
    "padding-line-between-statements": [
      "error",
      {
        "blankLine": "never",
        "prev": [
          "import"
        ],
        "next": [
          "import"
        ]
      },
      {
        "blankLine": "always",
        "prev": [
          "block",
          "block-like",
          "continue",
          "directive",
          "do",
          "export",
          "for",
          "if",
          "switch",
          "try",
          "while"
        ],
        "next": "*"
      },
      {
        "blankLine": "always",
        "prev": [
          "const",
          "let",
          "var"
        ],
        "next": "*"
      },
      {
        "blankLine": "always",
        "prev": "*",
        "next": "return"
      }
    ],
    "quotes": [
      "error",
      "double"
    ],
    "semi": [
      "error",
      "always"
    ],
    "space-before-blocks": [
      "error",
      "always"
    ],
    "space-before-function-paren": [
      "error",
      "never"
    ],
    "space-infix-ops": [
      "error"
    ]
  }
};
