should = require "should"
Options = require("../models/plugin/options/optionsModel");

describe "Options Model Tests", ->
    options = null
    data = null
    
    before ->
        data = {
            dateFormat: "mm/dd/yyyy",
            decimalDelimiter: ",",
            header: true,
            separator: ";"
        }
        options = new Options(data.dateFormat, data.decimalDelimiter, data.header, data.separator)
    
    describe "Creation", ->
        it "creates a model with correct properties", ->
            options.dateFormat.should.equal(data.dateFormat)
            options.decimalDelimiter.should.equal(data.decimalDelimiter)
            options.header.should.equal(data.header)
            options.separator.should.equal(data.separator)
            
        it "creates a correct model with empty input", ->
            model = new Options()
            model.dateFormat.should.equal('auto')
            model.decimalDelimiter.should.equal('auto')
            model.header.should.equal(false)
            model.separator.should.equal('auto')
            
    describe "clone", ->
        it "creates a new object", ->
            model = new Options(data.dateFormat, data.decimalDelimiter, data.header, data.separator)
            clone = model.clone()
            clone.decimalDelimiter = "."
            model.decimalDelimiter.should.not.equal(clone.decimalDelimiter)
            
        it "creates an object with properties equal to source object", ->
            clone = options.clone()
            clone.dateFormat.should.equal(options.dateFormat)
            clone.decimalDelimiter.should.equal(options.decimalDelimiter)
            clone.header.should.equal(options.header)
            clone.separator.should.equal(options.separator)