chai = require "chai"
chai.use(require('chai-shallow-deep-equal'))
should = chai.should()
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
        headerOption.should.shallowDeepEqual(data)
        
    it "clones a new object", ->
        clone = headerOption.clone()
        clone.title = "No title"
        headerOption.title.should.not.be.equal(clone.title)
        
    it "clones an object with properties equal to source object", ->
        clone = headerOption.clone()
        clone.should.shallowDeepEqual(headerOption)