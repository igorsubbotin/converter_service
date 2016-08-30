var Convert = require("../models/models").convert;
var pluginService = require("./pluginService");
var parseOptions = require("../models/plugin/parseOptions");
var fileHelper = require("../configuration/getFileHelper")();
var csvHelper = require("../helpers/csvHelper");

var convertService = function() {
    var convert = function(fileName, pluginId, options, next) {
        var model = new Convert(fileName, pluginId, parseOptions(options));
        fileHelper.loadFile(fileName, 'base64', function(err, data) 
        {
            if (err) 
            { 
                console.log(err); 
                model.success = false;
                model.error = 'Unable to convert file';
                next(err, null);
            }
            else 
            {
                var convert = pluginService.getConvertHandler(pluginId);
                console.log("Convert file: ", model.toLog());
                convert(model, data, function(err, data) 
                {
                    if (err) 
                    { 
                        console.log(err);
                        model.success = false;
                        model.error = 'Unable to convert file';
                        next(err, null);
                        
                    } else {
                        data = csvHelper.removeEmptyRows(data);
                        if (!model.hasHeaderRow) {
                            data = csvHelper.addFakeHeaderRow(data);
                        }
                        model.resultFileName = model.fileName + "_output";    
                        fileHelper.saveFile(model.resultFileName, data, function(err) 
                        { 
                            if (err) {
                                console.log(err);
                                model.success = false;
                                model.error = 'Unable to convert file';
                                next(err, null);
                            } else {
                                next(null, model);
                            }
                        });
                        
                    }
                });
            }
        });
    };
    
    return {
        convert: convert
    };
};

module.exports = convertService;