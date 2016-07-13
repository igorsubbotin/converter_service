var path = require("path");

var fileHelper = function()
{
    var getExtension = function(fileName) {
        console.log(fileName);
        var extension = path.extname(fileName);
        var basename = path.basename(fileName, extension);
        extension = path.extname(basename) + extension;
        extension = extension.substring(1);
        console.log(extension);
        return extension;
    };
    
    return {
        getExtension: getExtension
    };
};

module.exports = fileHelper;