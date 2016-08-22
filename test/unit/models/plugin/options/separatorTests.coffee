should = require "should"
optionTypes = require("../../../../models/plugin/options/optionTypes");
optionUiTypes = require("../../../../models/plugin/options/optionUiTypes");
separatorOption = require("../../../../models/plugin/options/separator/separatorOption")
types = require("../../../../models/plugin/options/separator/values/types")
separatorComma = require("../../../../models/plugin/options/separator/values/separatorComma")
separatorSemicolon = require("../../../../models/plugin/options/separator/values/separatorSemicolon")
separatorTab = require("../../../../models/plugin/options/separator/values/separatorTab")

describe "Separator tests", ->
    describe "SeparatorOption", ->
        data = {
            title: 'How do you separate columns in your file?',
            type: optionTypes.separatorOption,
            uiType: optionUiTypes.radioButtonList,
            values: [separatorComma, separatorSemicolon, separatorTab]
        }
        
        it "has a model with correct properties", ->
            separatorOption.title.should.equal(data.title)
            separatorOption.type.should.equal(data.type)
            separatorOption.uiType.should.equal(data.uiType)
            separatorOption.values.should.deepEqual(data.values)
            
        it "clones a new object", ->
            clone = separatorOption.clone()
            clone.title = "No title"
            separatorOption.title.should.not.equal(clone.title)
            
        it "clones an object with properties equal to source object", ->
            clone = separatorOption.clone()
            clone.title.should.equal(data.title)
            clone.type.should.equal(data.type)
            clone.uiType.should.equal(data.uiType)
            clone.values.should.deepEqual(data.values)
    
    describe "SeparatorComma", ->
        data = {
            type: types.comma,
            name: 'Comma (,)',
            value: ',',
            isDefault: true
        }
        
        it "has a model with correct properties", ->
            separatorComma.type.should.equal(data.type)
            separatorComma.name.should.equal(data.name)
            separatorComma.value.should.equal(data.value)
            separatorComma.isDefault.should.equal(data.isDefault)
            
        it "clones a new object", ->
            clone = separatorComma.clone()
            clone.name = "No name"
            separatorComma.name.should.not.equal(clone.name)
            
        it "clones an object with properties equal to source object", ->
            clone = separatorComma.clone()
            clone.type.should.equal(data.type)
            clone.name.should.equal(data.name)
            clone.value.should.equal(data.value)
            clone.isDefault.should.equal(data.isDefault)
            
    describe "SeparatorSemicolon", ->
        data = {
            type: types.semicolon,
            name: 'Semicolon (;)',
            value: ';',
            isDefault: false
        }
        
        it "has a model with correct properties", ->
            separatorSemicolon.type.should.equal(data.type)
            separatorSemicolon.name.should.equal(data.name)
            separatorSemicolon.value.should.equal(data.value)
            separatorSemicolon.isDefault.should.equal(data.isDefault)
            
        it "clones a new object", ->
            clone = separatorSemicolon.clone()
            clone.name = "No name"
            separatorSemicolon.name.should.not.equal(clone.name)
            
        it "clones an object with properties equal to source object", ->
            clone = separatorSemicolon.clone()
            clone.type.should.equal(data.type)
            clone.name.should.equal(data.name)
            clone.value.should.equal(data.value)
            clone.isDefault.should.equal(data.isDefault)
            
    describe "SeparatorTab", ->
        data = {
            type: types.tab,
            name: 'Tab',
            value: '\t',
            isDefault: false
        }
        
        it "has a model with correct properties", ->
            separatorTab.type.should.equal(data.type)
            separatorTab.name.should.equal(data.name)
            separatorTab.value.should.equal(data.value)
            separatorTab.isDefault.should.equal(data.isDefault)
            
        it "clones a new object", ->
            clone = separatorTab.clone()
            clone.name = "No name"
            separatorTab.name.should.not.equal(clone.name)
            
        it "clones an object with properties equal to source object", ->
            clone = separatorTab.clone()
            clone.type.should.equal(data.type)
            clone.name.should.equal(data.name)
            clone.value.should.equal(data.value)
            clone.isDefault.should.equal(data.isDefault)