chai = require "chai"
should = chai.should()
convert = require "../../../../services/plugins/xmlConverter"
Convert = require "../../../../models/convert/convertModel"
fs = require "fs"

describe "XmlConverter tests", ->
    describe "Format tests", ->
        describe "convert", ->
            model = new Convert(null, null, { header: true })

            it "converts XML Spreadsheet correctly", (done) ->
                expected = 'First name,Last name,Number,Decimal,Datetime,Comment\nСергей,Мозякин,12,12.13,,"multiline\ncomment\nis\nhere"\nIvan,Kozlov,,,15 Dec 14,\n'
                data = new Buffer(fs.readFileSync(__dirname + "/data/formats_xml_spreadsheet.xml")).toString('base64');
                convert model, data, (err, csv) ->
                    csv.should.be.equal(expected)
                    done()