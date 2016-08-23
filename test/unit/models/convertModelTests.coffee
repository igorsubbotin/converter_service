chai = require "chai"
chai.use(require('chai-shallow-deep-equal'))
should = chai.should()
Convert = require("../../../models/models").convert;
Options = require("../../../models/plugin/options/optionsModel")

describe "Convert Model Tests", ->
    convert = null
    data = null
    
    beforeEach ->
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
            convert.should.shallowDeepEqual(data)
    
    describe "clone", ->
        it "returns a new object", ->
            clone = convert.clone()
            clone.fileName += "_change"
            clone.fileName.should.not.be.equal(convert.fileName)
            
        it "creates an object with properties equal to source object", ->
            clone = convert.clone()
            clone.should.shallowDeepEqual(convert)
            
    describe "toLog", ->
        it "returns valid string", ->
            convert.toLog().should.be.equal(
                "fileName:" + convert.fileName + ", pluginId:" + 
                convert.pluginId + ", error:" + convert.error + 
                ", resultFileName:" + convert.resultFileName + 
                ", hasHeaderRow:" + convert.hasHeaderRow)