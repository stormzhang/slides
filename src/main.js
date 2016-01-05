'use strict';

var path = require('path');
var fm = require('front-matter');
var marked = require('marked');
var md = require('reveal.js/plugin/markdown/markdown');
var Mustache = require('mustache');
var fs = require('fs');

function split_content(content){
  var ret = [];
  var lines = content.split('\n');
  lines.forEach(function (line, index, array){
    if(line.indexOf("###") >= 0){
      line = "----\n\n" + line;
    }else{
      if(line.indexOf("##") >= 0){
        line = "---\n\n" + line;
      }
    }
    ret.push(line);
  });
  return ret.join("\n");
}


module.exports = function render(locals, callback) {
  var opts = {
      printMode: false,
      separator: '^(\r\n?|\n)---(\r\n?|\n)$',
      verticalSeparator: '^(\r\n?|\n)----(\r\n?|\n)$',
      revealOptions: {}
  };

  if(locals.path == "/"){
    var tpl = require("./list.tpl");
    console.log(locals.data);
    var view = {
      links: locals.routes,
    };
    var output = Mustache.render(tpl, view);
  }else{
    var source_file = "./" + locals.path.split("/").join("") + ".md";
    var content = require(source_file);
    var content_with_split = split_content(content);
    var slides = md.slidify(content_with_split, opts);
    var view = {
      title: "title",
      prefix: "../revealjs/",
      slides: slides
    };
    var tpl = require("./index.tpl");
    var output = Mustache.render(tpl, view);
  }
  callback(null, output);
}
