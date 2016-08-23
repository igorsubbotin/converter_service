should = require "should"
Plugin = require("../../../models/models").plugin
pluginService = require("../../../services/pluginService")
options = require("../../../models/plugin/options")

describe "PluginService tests", ->
    pluginIds = {
        CSV: '463B46AF-C612-4e53-8E0F-63FD23B3679F',
        XML: 'B5922C98-9F88-4cfb-9562-59C2FDAE534F',
        Excel: '5B8F85A0-79D6-407d-9527-07CE474E2574'
    }
    
    plugins = {}
    plugins[pluginIds.CSV] = new Plugin(pluginIds.CSV, 'CSV', 
        [options.dateFormat, options.decimalDelimiter, options.header, options.separator])
    plugins[pluginIds.XML] = new Plugin(pluginIds.XML, 'XML Spreadsheet', [options.header])
    plugins[pluginIds.Excel] = new Plugin(pluginIds.Excel, 'Excel', [options.header])
    
    pluginHandlers = {};
    pluginHandlers[pluginIds.CSV] = require("../../../services/plugins/csvConverter");
    pluginHandlers[pluginIds.XML] = require("../../../services/plugins/xmlConverter");
    pluginHandlers[pluginIds.Excel] = require("../../../services/plugins/excelConverter");
    
    describe "getAll", ->
        it "returns all plugins", ->
            pluginService.getAll().should.deepEqual(plugins)
            
    describe "getById", ->
        it "returns correct plugin (CSV)", ->
            pluginService.getById(pluginIds.CSV).should.deepEqual(plugins[pluginIds.CSV])
            
    describe "getConvertHandler", ->
        it "returns correct convert handler (XML)", ->
            pluginService.getConvertHandler(pluginIds.XML).should.deepEqual(pluginHandlers[pluginIds.XML])
            
