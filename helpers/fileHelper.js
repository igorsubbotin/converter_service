var path = require("path");

var fileHelper = function()
{
    var getExtension = function(fileName) {
        var extension = path.extname(fileName);
        var basename = path.basename(fileName, extension);
        extension = path.extname(basename) + extension;
        extension = extension.substring(1);
        return extension;
    };
    
    return {
        getExtension: getExtension
    };
};

module.exports = fileHelper;