should = require "should"
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
            decimalDelimiterOption.title.should.equal(data.title, "title")
            decimalDelimiterOption.type.should.equal(data.type, "type")
            decimalDelimiterOption.uiType.should.equal(data.uiType, "uiType")
            decimalDelimiterOption.values.should.deepEqual(data.values, "values")
            
        it "clones a new object", ->
            clone = decimalDelimiterOption.clone()
            clone.title = "No title"
            decimalDelimiterOption.title.should.not.equal(clone.title)
            
        it "clones an object with properties equal to source object", ->
            clone = decimalDelimiterOption.clone()
            clone.title.should.equal(data.title, "title")
            clone.type.should.equal(data.type, "type")
            clone.uiType.should.equal(data.uiType, "uiType")
            clone.values.should.deepEqual(data.values, "values")
    
    describe "DecimalDelimiterComma", ->
        data = {
            type: types.comma,
            name: 'Comma (,)',
            value: ',',
            isDefault: false
        }
        
        it "has a model with correct properties", ->
            decimalDelimiterComma.type.should.equal(data.type)
            decimalDelimiterComma.name.should.equal(data.name)
            decimalDelimiterComma.value.should.equal(data.value)
            decimalDelimiterComma.isDefault.should.equal(data.isDefault)
            
        it "clones a new object", ->
            clone = decimalDelimiterComma.clone()
            clone.name = "No name"
            decimalDelimiterComma.name.should.not.equal(clone.name)
            
        it "clones an object with properties equal to source object", ->
            clone = decimalDelimiterComma.clone()
            clone.type.should.equal(data.type)
            clone.name.should.equal(data.name)
            clone.value.should.equal(data.value)
            clone.isDefault.should.equal(data.isDefault)
            
    describe "DecimalDelimiterDot", ->
        data = {
            type: types.dot,
            name: 'Dot (.)',
            value: '.',
            isDefault: true
        }
        
        it "has a model with correct properties", ->
            decimalDelimiterDot.type.should.equal(data.type)
            decimalDelimiterDot.name.should.equal(data.name)
            decimalDelimiterDot.value.should.equal(data.value)
            decimalDelimiterDot.isDefault.should.equal(data.isDefault)
            
        it "clones a new object", ->
            clone = decimalDelimiterDot.clone()
            clone.name = "No name"
            decimalDelimiterDot.name.should.not.equal(clone.name)
            
        it "clones an object with properties equal to source object", ->
            clone = decimalDelimiterDot.clone()
            clone.type.should.equal(data.type)
            clone.name.should.equal(data.name)
            clone.value.should.equal(data.value)
            clone.isDefault.should.equal(data.isDefault)