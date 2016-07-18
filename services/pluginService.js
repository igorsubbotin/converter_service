var pluginService = function() {
    var Plugin = require("../models/models").plugin;
    var options = require("../models/plugin/options");
    
    var pluginIds = {
        CSV: '463B46AF-C612-4e53-8E0F-63FD23B3679F',
        XML: 'B5922C98-9F88-4cfb-9562-59C2FDAE534F',
        Excel: '5B8F85A0-79D6-407d-9527-07CE474E2574'
    };
    
    var plugins = {};
    plugins[pluginIds.CSV] = new Plugin(pluginIds.CSV, 'CSV', 
        [options.dateFormat, options.decimalDelimiter, options.header, options.separator]);
    plugins[pluginIds.XML] = new Plugin(pluginIds.XML, 'XML Spreadsheet', [options.header]);
    plugins[pluginIds.Excel] = new Plugin(pluginIds.Excel, 'Excel', [options.header]);
    
    var pluginHandlers = {}
    pluginHandlers[pluginIds.CSV] = require("./plugins/csvConverter")
    pluginHandlers[pluginIds.XML] = require("./plugins/excelConverter")
    pluginHandlers[pluginHandlers.Excel] = require("./plugins/excelConverter")

    var getAll = function() {
        return plugins;
    };
    var getById = function(id) {
        return plugins[id];
    };
    var getConvertHandler = function(id) {
          
    };
    return {
        getAll: getAll,
        getById: getById,
        getConvertHandler: getConvertHandler
    };
};

module.exports = pluginService;