var AWS = require("aws-sdk");

var s3fileAdapter = function()
{
    var s3 = new AWS.S3();
    var bucketName = 'import-convertation';
    
    this.loadFile = function(fileName, type, handler) {
        s3.getObject({ Bucket: bucketName, Key: fileName }, function(err, data) {
            handler(err, data);
        });
    };
    
    this.saveFile = function(fileName, data, handler) {
        s3.putObject({ Bucket: bucketName, Key: fileName, Body: data }, function(err, data) {
            handler(err, data);
        });
    };
};

module.exports = s3fileAdapter();