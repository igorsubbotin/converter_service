chai = require "chai"
should = chai.should()
Option = require("../../../models/models").format
optionService = require("../../../services/optionService")
options = require("../../../models/plugin/options");

describe "OptionService tests", ->
    describe "getAll", ->
        it "returns all options", ->
            optionService.getAll().should.be.deep.equal(options)
            
    describe "getById", ->
        it "returns correct option (dateFormat)", ->
            optionService.getById("dateFormat").should.be.deep.equal(options.dateFormat)
            
        it "returns correct option (separator)", ->
            optionService.getById("separator").should.be.deep.equal(options.separator)