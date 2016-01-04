var webpack = require('webpack');
var path = require('path');

module.exports = {
  entry: [
    './src/main.js' // Your appʼs entry point
  ],
  devtool: 'source-map',
  output: {
    filename: 'bundle.js'
  },
  module: {
    loaders: [
      {
        test: /\.js$/,
        exclude: /(node_modules|bower_components)/,
        loaders: ['react-hot', 'babel'],
      },
      {
        test: /\.json$/,
        loader: "json-loader"
      },
      {
        test: /\.md$/,
        loader: "raw-loader"
      }
    ]
  },
  node: {
    fs: "empty"
  }
};
