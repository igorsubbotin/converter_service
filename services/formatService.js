var formatService = function() {
    var Format = require("../models/models").format;
    var fileHelper = require("../helpers/fileHelper")();
    
    var formats = {
        'CSV': new Format('CSV', 'CSV format', 'csv', '463B46AF-C612-4e53-8E0F-63FD23B3679F'),
        'TXT': new Format('TXT', 'TXT format', 'txt', '463B46AF-C612-4e53-8E0F-63FD23B3679F'),
        'XML Spreadsheet': new Format('XML Spreadsheet', 'XML Spreadsheet', 'xml', 'B5922C98-9F88-4cfb-9562-59C2FDAE534F'),
        'XML Spreadsheet (xls extension)': new Format('XML Spreadsheet (xls extension)', 'XML Spreadsheet', 'xml.xls', 'B5922C98-9F88-4cfb-9562-59C2FDAE534F'),
        'Excel 12.0': new Format('Excel 12.0', 'Excel 2007 Binary (*.xlsb)', 'xlsb', '5B8F85A0-79D6-407d-9527-07CE474E2574'),
        'Excel 12.0 Xml': new Format('Excel 12.0 Xml', 'Excel 2007 XML (*.xlsl)', 'xlsx', '5B8F85A0-79D6-407d-9527-07CE474E2574'),
        'Excel 12.0 Macro': new Format('Excel 12.0 Macro', 'Excel 2007 Macro-enabled (*.xlsm)', 'xlsm', '5B8F85A0-79D6-407d-9527-07CE474E2574'),
        'Excel 8.0': new Format('Excel 8.0', 'Excel 97/2000/2003 (*.xls)', 'xls', '5B8F85A0-79D6-407d-9527-07CE474E2574'), 
        };
        
    var formatsByExtension = {};
    for (var k in formats) {
        var format = formats[k];
        formatsByExtension[format.extension] = format;
    }

    var getAll = function() {
        return formats;
    };
    
    var getById = function(id) {
        return formats[id];
    };
    
    var getByFileName = function(fileName) {
        var extension = fileHelper.getExtension(fileName);
        return formatsByExtension[extension];
    };
    
    return {
        getAll: getAll,
        getById: getById,
        getByFileName: getByFileName
    };
};

module.exports = formatService;