const path = require("path");
const webpack = require("webpack");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const WebpackAssetsManifest = require("webpack-assets-manifest");

module.exports = {
  entry: {
    site: "./source/javascripts/site.js",
    styles: "./source/stylesheets/site.css.scss"
  },
  output: {
    path: path.join(__dirname, "dist"),
    filename: "javascripts/[name]-[hash].js"
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
          "css-loader",
          {
            loader: "sass-loader",
            options: {
              sourceMap: true,
            }
          }
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
    }),
    new WebpackAssetsManifest({
      publicPath: true,
      writeToDisk: true,
      integrity: true,
      integrityHashes: ["sha256"]
    })
  ]
};
