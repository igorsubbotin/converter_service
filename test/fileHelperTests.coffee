should = require "should"
fileHelper = require "../helpers/fileHelper"

describe "fileHelper Tests", -> 
    it "getExtension should parse single extension", ->
        fileHelper.getExtension("test.csv").should.equal("csv")

    it "getExtension should parse double extension", ->
        fileHelper.getExtension("test.xml.xls").should.equal("xml.xls")
        
    it "getExtension should parse double extension (with triple extension fileName)", ->
        fileHelper.getExtension("test.txt.xml.xls").should.equal("xml.xls")
        
    it "getExtension should not extract anything for fileName without extension", ->
        fileHelper.getExtension("test").should.equal("")
        
    it "getExtension should not fail on empty input", ->
        fileHelper.getExtension(null).should.equal("")
        
    it "getExtension should not fail on '.' input", ->
        fileHelper.getExtension(".").should.equal("")
        
    it "getExtension should parse extension for Russian fileName", ->
        fileHelper.getExtension("название_файла.csv").should.equal("csv")