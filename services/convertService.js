var convertService = function() {
    var Convert = require("../models/models").convert;
    var pluginService = require("./pluginService")();
    
    var convert = function(fileName, pluginId, options) {
        var result = new Convert(fileName, pluginId, options);
        var convert = pluginService.getConvertHandler(pluginId);
        return new Promise((resolve, reject) => {
            convert(result, function (err) {
                if (err) {
                    result.success = false;
                    result.error = 'Unable to convert file';
                    reject(err);
                }
                else {
                    result.success = true;
                    result.resultFileName = result.fileName + "_output";
                    resolve(result);
                }
            });
        });
    };
    
    return {
        convert: convert
    };
};

module.exports = convertService;