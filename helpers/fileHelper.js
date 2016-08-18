var path = require("path");
var AWS = require("aws-sdk");

var fileHelper = function()
{
    var s3 = new AWS.S3();
    
    var getExtension = function(fileName) {
        var extension = path.extname(fileName);
        var basename = path.basename(fileName, extension);
        extension = path.extname(basename) + extension;
        extension = extension.substring(1);
        return extension;
    };
    
    var loadFile = function(fileName, type, handler) {
        s3.getObject({ Bucket: 'import-convertation', Key: fileName }, function(err, data) {
            if (err) { console.log(err) }
            else {
                console.log("File loaded from AWS", fileName, type);
                handler(err, data.Body.toString(type));
            }
        });
    };
    
    var saveFile = function(fileName, data, handler) {
        s3.putObject({ Bucket: 'import-convertation', Key: fileName, Body: data }, function(err, data) {
            if (err) { console.log(err); }
            else {
                console.log("File saved to AWS", fileName);
                handler(err);
            }
        });
    };
    
    return {
        getExtension: getExtension,
        loadFile: loadFile,
        saveFile: saveFile
    };
};

module.exports = fileHelper();