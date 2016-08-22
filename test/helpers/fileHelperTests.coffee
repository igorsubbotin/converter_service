should = require "should"
fileHelper = require "../../helpers/fileHelper"
assert = require "assert"

describe "fileHelper Tests", -> 
    describe "getExtension", -> 
        it "parses single extension", ->
            fileHelper.getExtension("test.csv").should.equal("csv")
    
        it "parses double extension", ->
            fileHelper.getExtension("test.xml.xls").should.equal("xml.xls")
            
        it "parses double extension (with triple extension fileName)", ->
            fileHelper.getExtension("test.txt.xml.xls").should.equal("xml.xls")
            
        it "does not extract anything for fileName without extension", ->
            fileHelper.getExtension("test").should.equal("")
            
        it "fails on empty input", ->
            assert.throws(fileHelper.getExtension, assert.AssertionError)
            
        it "does not fail on '.' input", ->
            fileHelper.getExtension(".").should.equal("")
            
        it "parses extension for Russian fileName", ->
            fileHelper.getExtension("название_файла.csv").should.equal("csv")