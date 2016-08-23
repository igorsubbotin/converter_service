chai = require "chai"
chai.use(require('chai-shallow-deep-equal'))
should = chai.should()
Options = require("../../../../../models/plugin/options/optionsModel");

describe "Options Model Tests", ->
    options = null
    data = null
    
    beforeEach ->
        data = {
            dateFormat: "mm/dd/yyyy",
            decimalDelimiter: ",",
            header: true,
            separator: ";"
        }
        options = new Options(data.dateFormat, data.decimalDelimiter, data.header, data.separator)
    
    describe "Creation", ->
        it "creates a model with correct properties", ->
            options.should.shallowDeepEqual(data)
            
        it "creates a correct model with empty input", ->
            model = new Options()
            model.dateFormat.should.be.equal('auto')
            model.decimalDelimiter.should.be.equal('auto')
            model.header.should.be.equal(false)
            model.separator.should.be.equal('auto')
            
    describe "clone", ->
        it "creates a new object", ->
            clone = options.clone()
            clone.decimalDelimiter = "."
            options.decimalDelimiter.should.not.be.equal(clone.decimalDelimiter)
            
        it "creates an object with properties equal to source object", ->
            clone = options.clone()
            clone.should.shallowDeepEqual(options)