chai = require "chai"
chai.use(require('chai-shallow-deep-equal'))
should = chai.should()
optionTypes = require("../../../../../models/plugin/options/optionTypes");
optionUiTypes = require("../../../../../models/plugin/options/optionUiTypes");
separatorOption = require("../../../../../models/plugin/options/separator/separatorOption")
types = require("../../../../../models/plugin/options/separator/values/types")
separatorComma = require("../../../../../models/plugin/options/separator/values/separatorComma")
separatorSemicolon = require("../../../../../models/plugin/options/separator/values/separatorSemicolon")
separatorTab = require("../../../../../models/plugin/options/separator/values/separatorTab")

describe "Separator tests", ->
    describe "SeparatorOption", ->
        data = {
            title: 'How do you separate columns in your file?',
            type: optionTypes.separatorOption,
            uiType: optionUiTypes.radioButtonList,
            values: [separatorComma, separatorSemicolon, separatorTab]
        }
        
        it "has a model with correct properties", ->
            separatorOption.should.shallowDeepEqual(data)
            
        it "clones a new object", ->
            clone = separatorOption.clone()
            clone.title = "No title"
            separatorOption.title.should.not.be.equal(clone.title)
            
        it "clones an object with properties equal to source object", ->
            clone = separatorOption.clone()
            clone.should.shallowDeepEqual(separatorOption)
    
    describe "SeparatorComma", ->
        data = {
            type: types.comma,
            name: 'Comma (,)',
            value: ',',
            isDefault: true
        }
        
        it "has a model with correct properties", ->
            separatorComma.should.shallowDeepEqual(data)
            
        it "clones a new object", ->
            clone = separatorComma.clone()
            clone.name = "No name"
            separatorComma.name.should.not.be.equal(clone.name)
            
        it "clones an object with properties equal to source object", ->
            clone = separatorComma.clone()
            clone.should.shallowDeepEqual(separatorComma)
            
    describe "SeparatorSemicolon", ->
        data = {
            type: types.semicolon,
            name: 'Semicolon (;)',
            value: ';',
            isDefault: false
        }
        
        it "has a model with correct properties", ->
            separatorSemicolon.should.shallowDeepEqual(data)
            
        it "clones a new object", ->
            clone = separatorSemicolon.clone()
            clone.name = "No name"
            separatorSemicolon.name.should.not.be.equal(clone.name)
            
        it "clones an object with properties equal to source object", ->
            clone = separatorSemicolon.clone()
            clone.should.shallowDeepEqual(separatorSemicolon)
            
    describe "SeparatorTab", ->
        data = {
            type: types.tab,
            name: 'Tab',
            value: '\t',
            isDefault: false
        }
        
        it "has a model with correct properties", ->
            separatorTab.should.shallowDeepEqual(data)
            
        it "clones a new object", ->
            clone = separatorTab.clone()
            clone.name = "No name"
            separatorTab.name.should.not.equal(clone.name)
            
        it "clones an object with properties equal to source object", ->
            clone = separatorTab.clone()
            clone.should.shallowDeepEqual(separatorTab)