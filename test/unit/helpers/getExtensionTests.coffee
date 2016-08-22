should = require "should"
getExtension = require "../../../helpers/getExtension"
assert = require "assert"

describe "getExtension Tests", -> 
    it "parses single extension", ->
        getExtension("test.csv").should.equal("csv")
    
    it "parses double extension", ->
        getExtension("test.xml.xls").should.equal("xml.xls")
        
    it "parses double extension (with triple extension fileName)", ->
        getExtension("test.txt.xml.xls").should.equal("xml.xls")
        
    it "does not extract anything for fileName without extension", ->
        getExtension("test").should.equal("")
        
    it "fails on empty input", ->
        getExtension.should.throw(assert.AssertionError)
        
    it "does not fail on '.' input", ->
        getExtension(".").should.equal("")
        
    it "parses extension for Russian fileName", ->
        getExtension("название_файла.csv").should.equal("csv")