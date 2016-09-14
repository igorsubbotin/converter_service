var AWS = require("aws-sdk");

/* istanbul ignore next */
var s3fileAdapter = function()
{
    var s3 = new AWS.S3();
    var inputBucketName = 'import-convertation';
    var outputBucketName = 'import-convertation-new';
    
    var loadFile = function(fileName, handler) {
        s3.getObject({ Bucket: inputBucketName, Key: fileName }, function(err, data) {
            handler(err, data.Body);
        });
    };
    
    var saveFile = function(fileName, data, handler) {
        s3.putObject({ Bucket: outputBucketName, Key: fileName, Body: data }, function(err, data) {
            handler(err, data);
        });
    };
    
    return {
        saveFile: saveFile,
        loadFile: loadFile
    };
};

module.exports = s3fileAdapter();