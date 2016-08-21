should = require "should"
types = require("../../../../models/plugin/options/dateFormat/values/types")
dateFormatAutomatically = require("../../../../models/plugin/options/dateFormat/values/dateFormatAutomatically")

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