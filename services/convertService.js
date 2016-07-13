var convertService = function() {
    var Convert = require("../models/models").convert;
    
    var convert = function(fileName, pluginId, options) {
        var convert = new Convert(fileName, pluginId, options);
        convert.success = false;
        convert.error = 'Operation is not implemented';
        return convert;
    };
    
    return {
        convert: convert
    };
};

module.exports = convertService;