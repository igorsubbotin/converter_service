chai = require "chai"
chai.use(require('chai-shallow-deep-equal'))
should = chai.should()
sinon = require "sinon"
ConvertService = require("../../../services/convertService")
FileHelper = require("../../../helpers/fileHelper")
InMemoryFileAdapter = require("../../../helpers/inMemoryFileAdapter")
optionTypes = require("../../../models/plugin/options/optionTypes");
parseOptions = require("../../../models/plugin/parseOptions")
dateFormatAutomatically = require("../../../models/plugin/options/dateFormat/values/dateFormatAutomatically")
dateFormatMonthDayYear = require("../../../models/plugin/options/dateFormat/values/dateFormatMonthDayYear")
dateFormatDayMonthYear = require("../../../models/plugin/options/dateFormat/values/dateFormatDayMonthYear")
dateFormatOptionValueTypes = require("../../../models/plugin/options/dateFormat/values/types")
decimalDelimiterComma = require("../../../models/plugin/options/decimalDelimiter/values/decimalDelimiterComma")
decimalDelimiterDot = require("../../../models/plugin/options/decimalDelimiter/values/decimalDelimiterDot")
decimalDelimiterOptionValueTypes = require("../../../models/plugin/options/decimalDelimiter/values/types")
headerOptionValueTypes = require("../../../models/plugin/options/header/types")
separatorComma = require("../../../models/plugin/options/separator/values/separatorComma")
separatorSemicolon = require("../../../models/plugin/options/separator/values/separatorSemicolon")
separatorTab = require("../../../models/plugin/options/separator/values/separatorTab")
separatorOptionValueTypes = require("../../../models/plugin/options/separator/values/types")

describe "ConvertService tests", ->
    inMemoryFileAdapter = null
    fileHelper = null
    convertService = null
    fileName = null
    pluginId = null
    options = null
    content = null
    buffer = null
    content64 = null
    outputFilename = null
    expectedContentWithoutHeader = null
    expectedContent = null
    beforeEach ->
        fileName = 'file.csv'
        pluginId = '463B46AF-C612-4e53-8E0F-63FD23B3679F'
        options = [
            {
                type: optionTypes.dateFormatOption,
                values: [{
                    type: dateFormatOptionValueTypes.dayMonthYear,
                    isSelected: false
                }]
            }
            {
                type: optionTypes.decimalDelimiterOption,
                values: [{
                    type: decimalDelimiterOptionValueTypes.dot,
                    isSelected: true
                }]
            }
            {
                type: optionTypes.headerOption
                values: [{
                    type: headerOptionValueTypes.hasHeaderRow,
                    isSelected: false
                }]
            }
            {
                type: optionTypes.separatorOption,
                values: [{
                    type: separatorOptionValueTypes.comma,
                    isSelected: true
                }]
            }]
        inMemoryFileAdapter = new InMemoryFileAdapter()
        fileHelper = new FileHelper(inMemoryFileAdapter)    
        convertService = new ConvertService(fileHelper)
        content = "Peter,Johnson,12,12.13,,comment\nIvan,Kozlov,,,15/12/2014,\n,,,,,,"
        expectedContentWithoutHeader = "Peter,Johnson,12,12.13,,comment\nIvan,Kozlov,,,15/12/2014,"
        expectedContent = "Column 1,Column 2,Column 3,Column 4,Column 5,Column 6\n" + expectedContentWithoutHeader
        buffer = new Buffer(content)
        content64 = buffer.toString('base64')
        
        
    describe "convert", ->
        it "works correct after error on file load", (done) ->
            inMemoryFileAdapter = new InMemoryFileAdapter(true, false)
            fileHelper = new FileHelper(inMemoryFileAdapter)
            convertService = new ConvertService(fileHelper)
            convertService.convert fileName, pluginId, options, (err, data) ->
                err.should.be.ok
                data.error.should.be.ok
                data.success.should.be.false
                done()
                
        it "parses csv input correctly and saves file", (done) ->
            inMemoryFileAdapter.files[fileName] = content64
            convertService.convert fileName, pluginId, options, (err, data) ->
                inMemoryFileAdapter.files[data.resultFileName].should.be.equal(expectedContent)
                data.resultFileName.should.be.equal(fileName + "_output_new")
                data.success.should.be.true
                done()
                
        it "works correct after error on file save", (done) ->
            inMemoryFileAdapter = new InMemoryFileAdapter(false, true)
            inMemoryFileAdapter.files[fileName] = content64
            fileHelper = new FileHelper(inMemoryFileAdapter)
            convertService = new ConvertService(fileHelper)
            convertService.convert fileName, pluginId, options, (err, data) ->
                err.should.be.ok
                data.error.should.be.ok
                data.success.should.be.false
                done()
                
        it "doesn't add fake header row if hasHeaderRow is true", (done) ->
            inMemoryFileAdapter.files[fileName] = content64
            options[2].values[0].isSelected = true # hasHeaderRow => true
            convertService.convert fileName, pluginId, options, (err, data) ->
                inMemoryFileAdapter.files[data.resultFileName].should.be.equal(expectedContentWithoutHeader)
                done()
                
        it "returns failed result on convert handler error", (done) ->
            inMemoryFileAdapter.files[fileName] = content64
            pluginService = 
            {                 
                getConvertHandler: ->
                    return (model, data, next) ->
                        next("error occured during convertion")
                        
            }
            convertService = new ConvertService(fileHelper, pluginService)
            convertService.convert fileName, pluginId, options, (err, data) ->
                err.should.be.ok
                data.error.should.be.ok
                data.success.should.be.false
                done()
        
            
            
            
    