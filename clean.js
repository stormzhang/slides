var fs = require('fs');
var rimraf = require('rimraf');
var files = fs.readdirSync('src');
console.log(files);
files.forEach(function(file){
  if(file.indexOf('.md') > 1){
    var path = file.slice(0, file.length - 3);
    console.log(path);
    rimraf(path, fs, function(){
      console.log("rm -rf " + path + "!");
    })
  }
});
