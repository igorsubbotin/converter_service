chai = require "chai"
chai.use(require('chai-shallow-deep-equal'))
should = chai.should()
Format = require("../../../models/format/formatModel")

describe "Format Model Tests", ->
    format = null
    data = null
    
    before ->
        data = {
            id: "CSV",
            name: "CSV format",
            extension: "csv",
            pluginId: '463B46AF-C612-4e53-8E0F-63FD23B3679F'
        }
        format = new Format(data.id, data.name, data.extension, data.pluginId)
    
    describe "Creation", ->
        it "creates a model with correct properties", ->
            format.should.shallowDeepEqual(data)
            
    describe "clone", ->
        it "creates a new object", ->
            model = new Format(data.id, data.name, data.extension, data.pluginId)
            clone = model.clone()
            clone.id = "new id"
            model.id.should.not.be.equal(clone.id)
            
        it "creates an object with properties equal to source object", ->
            model = new Format(data.id, data.name, data.extension, data.pluginId)
            clone = model.clone()
            clone.should.shallowDeepEqual(model)