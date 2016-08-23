chai = require "chai"
chai.use(require('chai-shallow-deep-equal'))
should = chai.should()
optionTypes = require("../../../../../models/plugin/options/optionTypes");
optionUiTypes = require("../../../../../models/plugin/options/optionUiTypes");
dateFormatOption = require("../../../../../models/plugin/options/dateFormat/dateFormatOption")
types = require("../../../../../models/plugin/options/dateFormat/values/types")
dateFormatAutomatically = require("../../../../../models/plugin/options/dateFormat/values/dateFormatAutomatically")
dateFormatDayMonthYear = require("../../../../../models/plugin/options/dateFormat/values/dateFormatDayMonthYear")
dateFormatMonthDayYear = require("../../../../../models/plugin/options/dateFormat/values/dateFormatMonthDayYear")

describe "Date Format tests", ->
    describe "DateFormatOption", ->
        data = {
            title: 'What date format is used in your file?',
            type: optionTypes.dateFormatOption,
            uiType: optionUiTypes.radioButtonList,
            values: [dateFormatAutomatically, dateFormatMonthDayYear, dateFormatDayMonthYear]
        }
        
        it "has a model with correct properties", ->
            dateFormatOption.should.shallowDeepEqual(data)
            
        it "clones a new object", ->
            clone = dateFormatOption.clone()
            clone.title = "No title"
            dateFormatOption.title.should.not.be.equal(clone.title)
            
        it "clones an object with properties equal to source object", ->
            clone = dateFormatOption.clone()
            clone.should.shallowDeepEqual(dateFormatOption)
    
    describe "DateFormatAutomatically", ->
        data = {
            type: types.automatically,
            name: 'Determine automatically (in case of problems try other settings)',
            value: 'auto',
            isDefault: true
        }
        
        it "has a model with correct properties", ->
            dateFormatAutomatically.should.shallowDeepEqual(data)
            
        it "clones a new object", ->
            clone = dateFormatAutomatically.clone()
            clone.name = "No name"
            dateFormatAutomatically.name.should.not.be.equal(clone.name)
            
        it "clones an object with properties equal to source object", ->
            clone = dateFormatAutomatically.clone()
            clone.should.shallowDeepEqual(dateFormatAutomatically)
            
    describe "DateFormatDayMonthYear", ->
        data = {
            type: types.dayMonthYear,
            name: 'Day / Month / Year',
            value: 'd/mm/yyyy',
            isDefault: false
        }
        
        it "has a model with correct properties", ->
            dateFormatDayMonthYear.should.shallowDeepEqual(data)
            
        it "clones a new object", ->
            clone = dateFormatDayMonthYear.clone()
            clone.name = "No name"
            dateFormatDayMonthYear.name.should.not.be.equal(clone.name)
            
        it "clones an object with properties equal to source object", ->
            clone = dateFormatDayMonthYear.clone()
            clone.should.shallowDeepEqual(dateFormatDayMonthYear)
            
    describe "DateFormatMonthDayYear", ->
        data = {
            type: types.monthDayYear,
            name: 'Month / Day / Year',
            value: 'm/dd/yyyy',
            isDefault: false
        }
        
        it "has a model with correct properties", ->
            dateFormatMonthDayYear.should.shallowDeepEqual(data)
            
        it "clones a new object", ->
            clone = dateFormatMonthDayYear.clone()
            clone.name = "No name"
            dateFormatMonthDayYear.name.should.not.be.equal(clone.name)
            
        it "clones an object with properties equal to source object", ->
            clone = dateFormatMonthDayYear.clone()
            clone.should.shallowDeepEqual(dateFormatMonthDayYear)