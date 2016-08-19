should = require "should"
Convert = require("../models/models").convert;
Options = require("../models/plugin/options/optionsModel")

describe "Convert Model Tests", ->
    convert = null
    data = null
    
    before ->
        data = {
            fileName: "test.csv",
            pluginId: "463B46AF-C612-4e53-8E0F-63FD23B3679F",
            options: new Options(),
            error: "Error message",
            success: true,
            resultFileName: "output.csv"
        }        
        convert = new Convert(
            data.fileName, data.pluginId, data.options, data.error, 
            data.success, data.resultFileName)
    
    describe "Creation", ->
        it "creates a model instance with correct properties", ->
            convert.fileName.should.equal(data.fileName)
            convert.pluginId.should.equal(data.pluginId)
            convert.options.should.equal(data.options)
            convert.error.should.equal(data.error)
            convert.success.should.equal(data.success)
            convert.resultFileName.should.equal(data.resultFileName)
            convert.hasHeaderRow.should.equal(data.options.header)
    
    describe "clone", ->
        it "returns a new object", ->
            clone = convert.clone()
            clone.fileName += "_change"
            clone.fileName.should.not.equal(convert.fileName)
            
        it "creates an object with properties equal to source object", ->
            clone = convert.clone()
            clone.fileName.should.equal(convert.fileName)
            clone.pluginId.should.equal(convert.pluginId)
            clone.options.should.deepEqual(convert.options)
            clone.error.should.equal(convert.error)
            clone.success.should.equal(convert.success)
            clone.resultFileName.should.equal(convert.resultFileName)
            clone.hasHeaderRow.should.equal(convert.options.header)
            
    describe "toLog", ->
        it "returns valid string", ->
            convert.toLog().should.equal(
                "fileName:" + convert.fileName + ", pluginId:" + 
                convert.pluginId + ", error:" + convert.error + 
                ", resultFileName:" + convert.resultFileName + 
                ", hasHeaderRow:" + convert.hasHeaderRow)