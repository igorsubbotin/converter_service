var path = require("path");
var assert = require("assert");

module.exports = function(fileName) {
    assert.ok(fileName, "fileName required");
    
    var extension = path.extname(fileName);
    var basename = path.basename(fileName, extension);
    extension = path.extname(basename) + extension;
    extension = extension.substring(1);
    return extension;
};