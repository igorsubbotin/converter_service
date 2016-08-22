var s3fileAdapter = require("../aws/s3fileAdapter");
var fileHelper = require("../helpers/fileHelper");

module.exports = function()
{
    return fileHelper(s3fileAdapter);
};