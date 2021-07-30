const path = require("path");
const webpack = require("webpack");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");

module.exports = {
  entry: {
    site: "./source/javascripts/site.js",
    styles: "./source/stylesheets/site.css.scss"
  },
  output: {
    path: path.join(__dirname, "dist"),
    filename: "javascripts/[name].js",
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader",
          options: {
            presets: ["@babel/preset-env"]
          }
        }
      },
      {
        test: /\.s[ac]ss$/,
        use: [
          MiniCssExtractPlugin.loader,
          "css-loader?url=false",
          "sass-loader"
        ]
      },
      {
        test: /\.(ttf|otf|eot|svg|woff2?)$/,
        type: "asset/resource"
      }
    ]
  },
  plugins: [
    new MiniCssExtractPlugin({
      filename: "[name].css",
      chunkFilename: "[id].css"
    })
  ]
};
