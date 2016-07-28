var convertService = function() {
    var Convert = require("../models/models").convert;
    var pluginService = require("./pluginService")();
    
    var convert = function(fileName, pluginId, options) {
        var result = new Convert(fileName, pluginId, options);
        result.hasHeaderRow = hasHeaderRow(options);
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
                    resolve(result);
                }
            });
        });
    };
    
    var hasHeaderRow = function(options) {
        var optionTypes = require("../models/plugin/options/optionTypes");
        var headerOptionValueTypes = require("../models/plugin/options/header/types");
        
        for (var i = 0; i < options.length; i++) {
            var option = options[i];
            if (option.type == optionTypes.headerOption && option.values) {
                for (var j = 0; j < option.values.length; j++) {
                    var value = option.values[j];
                    if (value.type == headerOptionValueTypes.hasHeaderRow && value.isSelected) {
                        return value.isSelected;
                    } 
                }
            }
        }
        return false;
    };
    
    return {
        convert: convert
    };
};

module.exports = convertService;