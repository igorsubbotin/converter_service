var Convert = require("../models/models").convert;
var defaultPluginService = require("./pluginService");
var parseOptions = require("../models/plugin/parseOptions");
var defaultFileHelper = require("../configuration/getFileHelper")();
var csvHelper = require("../helpers/csvHelper");

var convertService = function(fileHelper, pluginService) {
    fileHelper = fileHelper || defaultFileHelper;
    pluginService = pluginService || defaultPluginService;
    var convert = function(fileName, pluginId, options, next) {
        var model = new Convert(fileName, pluginId, parseOptions(options));
        fileHelper.loadFile(fileName, 'base64', function(err, data) 
        {
            if (err) { 
                raiseError(err, model, next);
                return;
            }
            
            var convert = pluginService.getConvertHandler(pluginId);
            console.log("Convert file: ", model.toLog());
            convert(model, data, function(err, data) 
            {
                if (err) { 
                    raiseError(err, model, next);
                    return;
                } 
                data = csvHelper.removeEmptyRows(data);
                if (!model.hasHeaderRow) data = csvHelper.addFakeHeaderRow(data);
                model.resultFileName = model.fileName + "_output_new";    
                fileHelper.saveFile(model.resultFileName, data, function(err) 
                { 
                    if (err) {
                        raiseError(err, model, next);
                        return;
                    }
                    model.success = true;
                    next(null, model);
                });
            });
        });
    };
    
    var raiseError = function(err, model, next) {
        model.success = false;
        model.error = 'Unable to convert file';
        next(err, model);
    };
    
    return {
        convert: convert
    };
};

module.exports = convertService;