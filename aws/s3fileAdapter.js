var AWS = require("aws-sdk");

/* istanbul ignore next */
var s3fileAdapter = function()
{
    var s3 = new AWS.S3();
    var bucketName = 'import-convertation';
    
    var loadFile = function(fileName, handler) {
        s3.getObject({ Bucket: bucketName, Key: fileName }, function(err, data) {
            handler(err, data);
        });
    };
    
    var saveFile = function(fileName, data, handler) {
        s3.putObject({ Bucket: bucketName, Key: fileName, Body: data }, function(err, data) {
            handler(err, data.Body);
        });
    };
    
    return {
        saveFile: saveFile,
        loadFile: loadFile
    };
};

module.exports = s3fileAdapter();