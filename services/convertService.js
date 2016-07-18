var convertService = function() {
    var Convert = require("../models/models").convert;
    var pluginService = require("./pluginService")();
    
    var convert = function(fileName, pluginId, options) {
        var result = new Convert(fileName, pluginId, options);
        var handler = pluginService.getConvertHandler(pluginId);
        handler(result);
        return result;
    };
    
    return {
        convert: convert
    };
};

module.exports = convertService;