should = require "should"
types = require("../../../../models/plugin/options/dateFormat/values/types")
dateFormatAutomatically = require("../../../../models/plugin/options/dateFormat/values/dateFormatAutomatically")
dateFormatDayMonthYear = require("../../../../models/plugin/options/dateFormat/values/dateFormatDayMonthYear")
dateFormatMonthDayYear = require("../../../../models/plugin/options/dateFormat/values/dateFormatMonthDayYear")

describe "Date Format tests", ->
    describe "DateFormatAutomatically", ->
        it "has a model with correct properties", ->
            dateFormatAutomatically.type.should.equal(types.automatically)
            dateFormatAutomatically.name.should.equal('Determine automatically (in case of problems try other settings)')
            dateFormatAutomatically.value.should.equal('auto')
            dateFormatAutomatically.isDefault.should.equal(true)
            
        it "clones a new object", ->
            clone = dateFormatAutomatically.clone()
            clone.name = "No name"
            dateFormatAutomatically.name.should.not.equal(clone.name)
            
        it "clones an object with properties equal to source object", ->
            clone = dateFormatAutomatically.clone()
            clone.type.should.equal(types.automatically)
            clone.name.should.equal('Determine automatically (in case of problems try other settings)')
            clone.value.should.equal('auto')
            clone.isDefault.should.equal(true)
            
    describe "DateFormatDayMonthYear", ->
        it "has a model with correct properties", ->
            dateFormatDayMonthYear.type.should.equal(types.dayMonthYear)
            dateFormatDayMonthYear.name.should.equal('Day / Month / Year')
            dateFormatDayMonthYear.value.should.equal('d/mm/yyyy')
            dateFormatDayMonthYear.isDefault.should.equal(false)
            
        it "clones a new object", ->
            clone = dateFormatDayMonthYear.clone()
            clone.name = "No name"
            dateFormatDayMonthYear.name.should.not.equal(clone.name)
            
        it "clones an object with properties equal to source object", ->
            clone = dateFormatDayMonthYear.clone()
            clone.type.should.equal(types.dayMonthYear)
            clone.name.should.equal('Day / Month / Year')
            clone.value.should.equal('d/mm/yyyy')
            clone.isDefault.should.equal(false)
            
    describe "DateFormatMonthDayYear", ->
        it "has a model with correct properties", ->
            dateFormatMonthDayYear.type.should.equal(types.monthDayYear)
            dateFormatMonthDayYear.name.should.equal('Month / Day / Year')
            dateFormatMonthDayYear.value.should.equal('m/dd/yyyy')
            dateFormatMonthDayYear.isDefault.should.equal(false)
            
        it "clones a new object", ->
            clone = dateFormatMonthDayYear.clone()
            clone.name = "No name"
            dateFormatMonthDayYear.name.should.not.equal(clone.name)
            
        it "clones an object with properties equal to source object", ->
            clone = dateFormatMonthDayYear.clone()
            clone.type.should.equal(types.monthDayYear)
            clone.name.should.equal('Month / Day / Year')
            clone.value.should.equal('m/dd/yyyy')
            clone.isDefault.should.equal(false)