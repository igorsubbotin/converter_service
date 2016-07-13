var pluginService = function() {
    var Plugin = require("../models/models").plugin;
    var options = require("../models/plugin/options");
    
    var plugins = {
        '463B46AF-C612-4e53-8E0F-63FD23B3679F': new Plugin('463B46AF-C612-4e53-8E0F-63FD23B3679F', 'CSV', 
            [options.dateFormat, options.decimalDelimiter, options.header, options.separator]),
        'B5922C98-9F88-4cfb-9562-59C2FDAE534F': new Plugin('B5922C98-9F88-4cfb-9562-59C2FDAE534F', 'XML Spreadsheet', [options.header]),
        '5B8F85A0-79D6-407d-9527-07CE474E2574': new Plugin('463B46AF-C612-4e53-8E0F-63FD23B3679F', 'Excel', [options.header]),
        };

    var getAll = function() {
        return plugins;
    };
    var getById = function(id) {
        return plugins[id];
    };
    return {
        getAll: getAll,
        getById: getById
    };
};

module.exports = pluginService;