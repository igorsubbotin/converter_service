should = require "should"
uriList = require "../helpers/uriList"

v1prefix = "/v1"

describe "uriList Tests", -> 
    describe "formatUri", ->
        it "is correct", ->
            uriList.formatUri.should.equal(v1prefix + "/formats")
            
    describe "pluginUri", ->
        it "is correct", ->
            uriList.pluginUri.should.equal(v1prefix + "/plugins")
    
    describe "convertUri", ->
        it "is correct", ->
            uriList.convertUri.should.equal(v1prefix + "/converts")
        
    describe "optionUri", ->
        it "is correct", ->
            uriList.optionUri.should.equal(v1prefix + "/options")
        
    describe "healthUri", ->
        it "is correct", ->
            uriList.healthUri.should.equal(v1prefix + "/health")
    