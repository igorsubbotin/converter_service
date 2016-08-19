should = require "should"
fileHelper = require "../../helpers/fileHelper"

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
            
        it "does not fail on empty input", ->
            fileHelper.getExtension(null).should.equal("")
            
        it "does not fail on '.' input", ->
            fileHelper.getExtension(".").should.equal("")
            
        it "parses extension for Russian fileName", ->
            fileHelper.getExtension("название_файла.csv").should.equal("csv")