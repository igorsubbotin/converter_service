should = require "should"
optionTypes = require("../../../../../models/plugin/options/optionTypes");
optionUiTypes = require("../../../../../models/plugin/options/optionUiTypes");
headerOption = require("../../../../../models/plugin/options/header/headerOption")
types = require("../../../../../models/plugin/options/header/types")

describe "HeaderOption tests", ->
    data = {
        title: 'Does your file contain column headers in the first row?',
        type: optionTypes.headerOption,
        uiType: optionUiTypes.checkBox,
        values: [{  
                type: types.hasHeaderRow,
                name: 'First row is a header',
                value: true,
                isDefault: true
        }]
    }
    
    it "has a model with correct properties", ->
        headerOption.title.should.equal(data.title)
        headerOption.type.should.equal(data.type)
        headerOption.uiType.should.equal(data.uiType)
        headerOption.values.should.deepEqual(data.values)
        
    it "clones a new object", ->
        clone = headerOption.clone()
        clone.title = "No title"
        headerOption.title.should.not.equal(clone.title)
        
    it "clones an object with properties equal to source object", ->
        clone = headerOption.clone()
        clone.title.should.equal(data.title)
        clone.type.should.equal(data.type)
        clone.uiType.should.equal(data.uiType)
        clone.values.should.deepEqual(data.values)