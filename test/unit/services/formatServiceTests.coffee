chai = require "chai"
chai.use(require('chai-shallow-deep-equal'))
should = chai.should()
Format = require("../../../models/models").format
formatService = require("../../../services/formatService")

describe "FormatService tests", ->
    formats = {
        'CSV': new Format('CSV', 'CSV format', 'csv', '463B46AF-C612-4e53-8E0F-63FD23B3679F'),
        'TXT': new Format('TXT', 'TXT format', 'txt', '463B46AF-C612-4e53-8E0F-63FD23B3679F'),
        'XML Spreadsheet': new Format('XML Spreadsheet', 'XML Spreadsheet', 'xml', 'B5922C98-9F88-4cfb-9562-59C2FDAE534F'),
        'XML Spreadsheet (xls extension)': new Format('XML Spreadsheet (xls extension)', 'XML Spreadsheet', 'xml.xls', 'B5922C98-9F88-4cfb-9562-59C2FDAE534F'),
        'Excel 12.0': new Format('Excel 12.0', 'Excel 2007 (*.xlsx)', 'xlsx', '5B8F85A0-79D6-407d-9527-07CE474E2574'),
        'Excel 12.0 Xml': new Format('Excel 12.0 Xml', 'Excel 2007 XML (*.xlsl)', 'xlsl', '5B8F85A0-79D6-407d-9527-07CE474E2574'),
        'Excel 12.0 Macro': new Format('Excel 12.0 Macro', 'Excel 2007 Macro-enabled (*.xlsm)', 'xlsm', '5B8F85A0-79D6-407d-9527-07CE474E2574'),
        'Excel 8.0': new Format('Excel 8.0', 'Excel 97/2000/2003 (*.xls)', 'xls', '5B8F85A0-79D6-407d-9527-07CE474E2574'), 
        };
        
    describe "getAll", ->
        it "returns all formats", ->
            formatService.getAll().should.shallowDeepEqual(formats) 
            
    describe "getById", ->
        it "returns correct format object (CSV)", ->
            formatService.getById('CSV').should.shallowDeepEqual(formats['CSV'])
            
        it "returns correct format object (XML Spreadsheet)", ->
            formatService.getById('XML Spreadsheet').should.shallowDeepEqual(formats['XML Spreadsheet'])
            
        it "returns correct format object (Excel 12.0 Xml)", ->
            formatService.getById('Excel 12.0 Xml').should.shallowDeepEqual(formats['Excel 12.0 Xml'])
            
    describe "getByFileName", ->
        it "returns correct format object (.csv)", ->
            formatService.getByFileName('file.csv').should.shallowDeepEqual(formats['CSV'])
                
        it "returns correct format object (.xls)", ->
            formatService.getByFileName('file.xls').should.shallowDeepEqual(formats['Excel 8.0'])
        
        it "returns correct format object (.xml.xls)", ->
            formatService.getByFileName('file.xml.xls').should.shallowDeepEqual(formats['XML Spreadsheet (xls extension)'])