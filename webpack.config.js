var webpack = require('webpack');
var path = require('path');
var StaticSiteGeneratorPlugin = require('static-site-generator-webpack-plugin');

var paths = [
  '/backbone-and-spa/'
];

module.exports = {
  entry: {
    'main': './src/main.js'
  },
  debug: true,
  devtool: 'source-map',
  output: {
    filename: 'bundle.js',
    libraryTarget: 'umd'
  },
  plugins: [
    new StaticSiteGeneratorPlugin('main', paths, null)
  ],
  module: {
    loaders: [
      {
        test: /\.js$/,
        exclude: /(node_modules|bower_components)/,
        loader: "babel-loader"
      },
      {
        test: /\.json$/,
        loader: "json-loader"
      },
      {
        test: /\.md$/,
        loader: "raw-loader"
      },
      {
        test: /\.tpl$/,
        loader: "raw-loader"
      }
    ]
  },
  node: {
    fs: "empty"
  }
};
