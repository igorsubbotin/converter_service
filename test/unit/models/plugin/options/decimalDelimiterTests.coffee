chai = require "chai"
chai.use(require('chai-shallow-deep-equal'))
should = chai.should()
optionTypes = require("../../../../../models/plugin/options/optionTypes");
optionUiTypes = require("../../../../../models/plugin/options/optionUiTypes");
decimalDelimiterOption = require("../../../../../models/plugin/options/decimalDelimiter/decimalDelimiterOption")
types = require("../../../../../models/plugin/options/decimalDelimiter/values/types")
decimalDelimiterComma = require("../../../../../models/plugin/options/decimalDelimiter/values/decimalDelimiterComma")
decimalDelimiterDot = require("../../../../../models/plugin/options/decimalDelimiter/values/decimalDelimiterDot")

describe "Decimal Delimiter tests", ->
    describe "DecimalDelimiterOption", ->
        data = {
            title: 'What kind of decimal separator does you file use?',
            type: optionTypes.decimalDelimiterOption,
            uiType: optionUiTypes.radioButtonList,
            values: [decimalDelimiterDot, decimalDelimiterComma]
        }
        
        it "has a model with correct properties", ->
            decimalDelimiterOption.should.shallowDeepEqual(data)
            
        it "clones a new object", ->
            clone = decimalDelimiterOption.clone()
            clone.title = "No title"
            decimalDelimiterOption.title.should.not.be.equal(clone.title)
            
        it "clones an object with properties equal to source object", ->
            clone = decimalDelimiterOption.clone()
            clone.should.shallowDeepEqual(decimalDelimiterOption)
    
    describe "DecimalDelimiterComma", ->
        data = {
            type: types.comma,
            name: 'Comma (,)',
            value: ',',
            isDefault: false
        }
        
        it "has a model with correct properties", ->
            decimalDelimiterComma.should.shallowDeepEqual(data)
            
        it "clones a new object", ->
            clone = decimalDelimiterComma.clone()
            clone.name = "No name"
            decimalDelimiterComma.name.should.not.be.equal(clone.name)
            
        it "clones an object with properties equal to source object", ->
            clone = decimalDelimiterComma.clone()
            clone.should.shallowDeepEqual(decimalDelimiterComma)
            
    describe "DecimalDelimiterDot", ->
        data = {
            type: types.dot,
            name: 'Dot (.)',
            value: '.',
            isDefault: true
        }
        
        it "has a model with correct properties", ->
            decimalDelimiterDot.should.shallowDeepEqual(data)
            
        it "clones a new object", ->
            clone = decimalDelimiterDot.clone()
            clone.name = "No name"
            decimalDelimiterDot.name.should.not.be.equal(clone.name)
            
        it "clones an object with properties equal to source object", ->
            clone = decimalDelimiterDot.clone()
            clone.should.shallowDeepEqual(decimalDelimiterDot)