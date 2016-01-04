'use strict';

var path = require('path');
var fm = require('front-matter');
var marked = require('marked');
var cheerio = require('cheerio');
//
var content = require("./demo.md");
// var frontMeta = fm(content);
console.log('---------------');
console.log(content);

console.log(marked(content));
