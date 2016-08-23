var convertService = function() {
    var Convert = require("../models/models").convert;
    var pluginService = require("./pluginService")();
    var parseOptions = require("../models/plugin/parseOptions");
    
    var convert = function(fileName, pluginId, options) {
        var result = new Convert(fileName, pluginId, parseOptions(options));
        var convert = pluginService.getConvertHandler(pluginId);
        return new Promise((resolve, reject) => {
            convert(result, function (err) {
                if (err) {
                    console.log(err);
                    result.success = false;
                    result.error = 'Unable to convert file';
                    reject(err);
                }
                else {
                    result.success = true;
                    result.resultFileName = result.fileName + "_output";
                    console.log("File converted: ", result.toLog());
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