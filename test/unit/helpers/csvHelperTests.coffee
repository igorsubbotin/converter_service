should = require "should"
assert = require "assert"
csvHelper = require "../../helpers/csvHelper"

describe "csvHelper Tests", -> 
    describe "removeEmptyRows", -> 
        it "removes random order empty rows", ->
            content = ",\nData1_1,Data1_2\n,\n,\nData4_1,Data4_2\n,\n,\nData6_1,Data6_2\n,\n,"
            result = csvHelper.removeEmptyRows(content)
            result.should.equal("Data1_1,Data1_2\nData4_1,Data4_2\nData6_1,Data6_2")
        
        it "removes empty rows \\n", ->
            content = "Column1,Column2\nData1_1,Data1_2\n,\nData3_1,Data3_2\n,"
            result = csvHelper.removeEmptyRows(content)
            result.should.equal("Column1,Column2\nData1_1,Data1_2\nData3_1,Data3_2")
        
        it "removes empty rows with \\r\\n", ->
            content = "Column1,Column2\r\nData1_1,Data1_2\r\n,\r\nData3_1,Data3_2\r\n,"
            result = csvHelper.removeEmptyRows(content)
            result.should.equal("Column1,Column2\nData1_1,Data1_2\nData3_1,Data3_2")
            
        it "returns empty string on all empty rows input", ->
            content = ",\n,\n,\n,\n,"
            result = csvHelper.removeEmptyRows(content)
            result.should.equal("")
            
        it "doesn't remove row with one filled element and all others empty", ->
            content = "Column1,Column2\nData1_1,"
            result = csvHelper.removeEmptyRows(content)
            result.should.equal("Column1,Column2\nData1_1,")
            
        it "doesn't remove row with multiline quoted element", ->
            content = 'Column1,Column2\n,"\n,"'
            result = csvHelper.removeEmptyRows(content)
            result.should.equal(content)
            
    describe "addFakeHeaderRow", ->
        it "adds correct header to csv", ->
            content = "Data0_1,Data0_2\nData1_1,Data1_2"
            result = csvHelper.addFakeHeaderRow(content)
            result.should.equal("Column 1,Column 2\nData0_1,Data0_2\nData1_1,Data1_2")
        
        it "fails on empty input", ->
            csvHelper.addFakeHeaderRow.should.throw(assert.AssertionError)