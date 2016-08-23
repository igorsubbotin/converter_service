should = require "should"
Option = require("../../../models/models").format
optionService = require("../../../services/optionService")
options = require("../../../models/plugin/options");

describe "OptionService tests", ->
    describe "getAll", ->
        it "returns all options", ->
            optionService.getAll().should.deepEqual(options)
            
    describe "getById", ->
        it "returns correct option (dateFormat)", ->
            optionService.getById("dateFormat").should.deepEqual(options.dateFormat)
            
        it "returns correct option (separator)", ->
            optionService.getById("separator").should.deepEqual(options.separator)