chai = require "chai"
should = chai.should()
getExtension = require "../../../helpers/getExtension"
assert = require "assert"

describe "getExtension Tests", -> 
    it "parses single extension", ->
        getExtension("test.csv").should.be.equal("csv")
    
    it "parses double extension", ->
        getExtension("test.xml.xls").should.be.equal("xml.xls")
        
    it "parses double extension (with triple extension fileName)", ->
        getExtension("test.txt.xml.xls").should.be.equal("xml.xls")
        
    it "does not extract anything for fileName without extension", ->
        getExtension("test").should.be.equal("")
        
    it "fails on empty input", ->
        getExtension.should.throw(assert.AssertionError)
        
    it "does not fail on '.' input", ->
        getExtension(".").should.be.equal("")
        
    it "parses extension for Russian fileName", ->
        getExtension("название_файла.csv").should.be.equal("csv")