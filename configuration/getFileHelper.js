var s3fileAdapter = require("../aws/s3fileAdapter");
var FileHelper = require("../helpers/fileHelper");

module.exports = function()
{
    return new FileHelper(s3fileAdapter);
};