chai = require "chai"
should = chai.should()
convert = require "../../../../services/plugins/excelConverter"
Convert = require "../../../../models/convert/convertModel"
fs = require "fs"

describe "ExcelConverter tests", ->
    describe "Format tests", ->
        describe "convert", ->
            model = new Convert(null, null, { header: true })
            
            it "converts Excel 2007 (*.xlsx) correctly", (done) ->
                expected = 'First name,Last name,Number,Decimal,Datetime,Comment\nСергей,Мозякин,12,12.13,,"multiline\r\ncomment\r\nis\r\nhere"\nIvan,Kozlov,,,15 Dec 14,\n'
                data = new Buffer(fs.readFileSync(__dirname + "/data/formats_xlsx.xlsx")).toString('base64');
                convert model, data, (err, csv) ->
                    csv.should.be.equal(expected)
                    done()
                    
            it "converts Excel 2007 Macro-enabled (*.xlsm) correctly", (done) ->
                expected = 'First name,Last name,Number,Decimal,Datetime,Comment\nСергей,Мозякин,12,12.13,,"multiline\r\ncomment\r\nis\r\nhere"\nIvan,Kozlov,,,15 Dec 14,\n'
                data = new Buffer(fs.readFileSync(__dirname + "/data/formats_xlsm.xlsm")).toString('base64');
                convert model, data, (err, csv) ->
                    csv.should.be.equal(expected)
                    done()
                    
            it "converts Excel 97/2000/2003 (*.xls) correctly", (done) ->
                expected = 'First name,Last name,Number,Decimal,Datetime,Comment\nСергей,Мозякин,12,12.13,,"multiline\ncomment\nis\nhere"\nIvan,Kozlov,,,15 Dec 14,\n'
                data = new Buffer(fs.readFileSync(__dirname + "/data/formats_xls.xls")).toString('base64');
                convert model, data, (err, csv) ->
                    csv.should.be.equal(expected)
                    done()