should = require "should"
uriList = require "../helpers/uriList"

v1prefix = "/api"

describe "uriList Tests", -> 
    it "formatUri should be correct", ->
        uriList.formatUri.should.equal(v1prefix + "/formats")
    
    it "pluginUri should be correct", ->
        uriList.pluginUri.should.equal(v1prefix + "/plugins")
        
    it "convertUri should be correct", ->
        uriList.convertUri.should.equal(v1prefix + "/converts")
        
    it "optionUri should be correct", ->
        uriList.optionUri.should.equal(v1prefix + "/options")
        
    it "healthUri should be correct", ->
        uriList.healthUri.should.equal(v1prefix + "/health")
    