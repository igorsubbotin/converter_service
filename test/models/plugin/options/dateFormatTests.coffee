should = require "should"
optionTypes = require("../../../../models/plugin/options/optionTypes");
optionUiTypes = require("../../../../models/plugin/options/optionUiTypes");
dateFormatOption = require("../../../../models/plugin/options/dateFormat/dateFormatOption")
types = require("../../../../models/plugin/options/dateFormat/values/types")
dateFormatAutomatically = require("../../../../models/plugin/options/dateFormat/values/dateFormatAutomatically")
dateFormatDayMonthYear = require("../../../../models/plugin/options/dateFormat/values/dateFormatDayMonthYear")
dateFormatMonthDayYear = require("../../../../models/plugin/options/dateFormat/values/dateFormatMonthDayYear")

describe "Date Format tests", ->
    describe "DateFormatOption", ->
        data = {
            title: 'What date format is used in your file?',
            type: optionTypes.dateFormatOption,
            uiType: optionUiTypes.radioButtonList,
            values: [dateFormatAutomatically, dateFormatMonthDayYear, dateFormatDayMonthYear]
        }
        
        it "has a model with correct properties", ->
            dateFormatOption.title.should.equal(data.title)
            dateFormatOption.type.should.equal(data.type)
            dateFormatOption.uiType.should.equal(data.uiType)
            dateFormatOption.values.should.deepEqual(data.values)
            
        it "clones a new object", ->
            clone = dateFormatOption.clone()
            clone.title = "No title"
            dateFormatOption.title.should.not.equal(clone.title)
            
        it "clones an object with properties equal to source object", ->
            clone = dateFormatOption.clone()
            clone.title.should.equal(data.title)
            clone.type.should.equal(data.type)
            clone.uiType.should.equal(data.uiType)
            clone.values.should.deepEqual(data.values)
    
    describe "DateFormatAutomatically", ->
        data = {
            type: types.automatically,
            name: 'Determine automatically (in case of problems try other settings)',
            value: 'auto',
            isDefault: true
        }
        
        it "has a model with correct properties", ->
            dateFormatAutomatically.type.should.equal(data.type)
            dateFormatAutomatically.name.should.equal(data.name)
            dateFormatAutomatically.value.should.equal(data.value)
            dateFormatAutomatically.isDefault.should.equal(data.isDefault)
            
        it "clones a new object", ->
            clone = dateFormatAutomatically.clone()
            clone.name = "No name"
            dateFormatAutomatically.name.should.not.equal(clone.name)
            
        it "clones an object with properties equal to source object", ->
            clone = dateFormatAutomatically.clone()
            clone.type.should.equal(data.type)
            clone.name.should.equal(data.name)
            clone.value.should.equal(data.value)
            clone.isDefault.should.equal(data.isDefault)
            
    describe "DateFormatDayMonthYear", ->
        data = {
            type: types.dayMonthYear,
            name: 'Day / Month / Year',
            value: 'd/mm/yyyy',
            isDefault: false
        }
        
        it "has a model with correct properties", ->
            dateFormatDayMonthYear.type.should.equal(data.type)
            dateFormatDayMonthYear.name.should.equal(data.name)
            dateFormatDayMonthYear.value.should.equal(data.value)
            dateFormatDayMonthYear.isDefault.should.equal(false)
            
        it "clones a new object", ->
            clone = dateFormatDayMonthYear.clone()
            clone.name = "No name"
            dateFormatDayMonthYear.name.should.not.equal(clone.name)
            
        it "clones an object with properties equal to source object", ->
            clone = dateFormatDayMonthYear.clone()
            clone.type.should.equal(data.type)
            clone.name.should.equal(data.name)
            clone.value.should.equal(data.value)
            clone.isDefault.should.equal(data.isDefault)
            
    describe "DateFormatMonthDayYear", ->
        data = {
            type: types.monthDayYear,
            name: 'Month / Day / Year',
            value: 'm/dd/yyyy',
            isDefault: false
        }
        
        it "has a model with correct properties", ->
            dateFormatMonthDayYear.type.should.equal(data.type)
            dateFormatMonthDayYear.name.should.equal(data.name)
            dateFormatMonthDayYear.value.should.equal(data.value)
            dateFormatMonthDayYear.isDefault.should.equal(false)
            
        it "clones a new object", ->
            clone = dateFormatMonthDayYear.clone()
            clone.name = "No name"
            dateFormatMonthDayYear.name.should.not.equal(clone.name)
            
        it "clones an object with properties equal to source object", ->
            clone = dateFormatMonthDayYear.clone()
            clone.type.should.equal(data.type)
            clone.name.should.equal(data.name)
            clone.value.should.equal(data.value)
            clone.isDefault.should.equal(data.isDefault)