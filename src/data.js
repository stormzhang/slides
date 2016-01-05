'use strict';

var path = require('path');
var fs = require('fs');

var filenames = fs.readdirSync("./src").filter(function (filename) {
  return filename.indexOf('.md') > 0
});

var routes = filenames.map(function(item){
  return "/" + item.split(".")[0] + "/";
});

routes.push("/");

module.exports = {
  routes: routes
}
