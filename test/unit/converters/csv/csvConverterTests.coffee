chai = require "chai"
should = chai.should()
convert = require "../../../../services/plugins/csvConverter"
Convert = require "../../../../models/convert/convertModel"
fs = require "fs"
Options = require("../../../../models/plugin/options/optionsModel")
optionTypes = require("../../../../models/plugin/options/optionTypes");
parseOptions = require("../../../../models/plugin/parseOptions")
dateFormatAutomatically = require("../../../../models/plugin/options/dateFormat/values/dateFormatAutomatically")
dateFormatMonthDayYear = require("../../../../models/plugin/options/dateFormat/values/dateFormatMonthDayYear")
dateFormatDayMonthYear = require("../../../../models/plugin/options/dateFormat/values/dateFormatDayMonthYear")
dateFormatOptionValueTypes = require("../../../../models/plugin/options/dateFormat/values/types")
decimalDelimiterComma = require("../../../../models/plugin/options/decimalDelimiter/values/decimalDelimiterComma")
decimalDelimiterDot = require("../../../../models/plugin/options/decimalDelimiter/values/decimalDelimiterDot")
decimalDelimiterOptionValueTypes = require("../../../../models/plugin/options/decimalDelimiter/values/types")
headerOptionValueTypes = require("../../../../models/plugin/options/header/types")
separatorComma = require("../../../../models/plugin/options/separator/values/separatorComma")
separatorSemicolon = require("../../../../models/plugin/options/separator/values/separatorSemicolon")
separatorTab = require("../../../../models/plugin/options/separator/values/separatorTab")
separatorOptionValueTypes = require("../../../../models/plugin/options/separator/values/types")

describe "CsvConverter tests", ->
    describe "Format tests", ->
        describe "convert", ->
            it "converts (separator:comma, decimal_delimiter:dot, date_format:d/mm/yyyy correctly", (done) ->
                options = new Options(dateFormatDayMonthYear.value, decimalDelimiterDot.value, true, separatorComma.value);
                model = new Convert(null, null, options)
                expected = 'First name,Last name,Number,Decimal,Datetime,Comment\nСергей,Мозякин,12,12.13,,"multiline\r\ncomment\r\nis\r\nhere"\nIvan,Kozlov,,,15 Dec 14,\n'
                data = new Buffer(fs.readFileSync(__dirname + "/data/comma_dot_dmmyyyy.csv")).toString('base64');
                convert model, data, (err, csv) ->
                    csv.should.be.equal(expected)
                    done()
                    
            it "converts (separator:semicolon, decimal_delimiter:comma, date_format:m/dd/yyyy correctly", (done) ->
                options = new Options(dateFormatMonthDayYear.value, decimalDelimiterComma.value, true, separatorSemicolon.value);
                model = new Convert(null, null, options)
                expected = 'First name,Last name,Number,Decimal,Datetime,Comment\nСергей,Мозякин,12,12.13,,"multiline\r\ncomment\r\nis\r\nhere"\nIvan,Kozlov,,,15 Dec 14,\n'
                data = new Buffer(fs.readFileSync(__dirname + "/data/semicolon_comma_mddyyyy.csv")).toString('base64');
                convert model, data, (err, csv) ->
                    csv.should.be.equal(expected)
                    done()
                    
            it "converts (separator:tab, decimal_delimiter:dot, date_format:d/mm/yyyy correctly", (done) ->
                options = new Options(dateFormatDayMonthYear.value, decimalDelimiterDot.value, true, separatorTab.value);
                model = new Convert(null, null, options)
                expected = 'First name,Last name,Number,Decimal,Datetime,Comment\nСергей,Мозякин,12,12.13,,"multiline\r\ncomment\r\nis\r\nhere"\nIvan,Kozlov,,,15 Dec 14,\n\n'
                data = new Buffer(fs.readFileSync(__dirname + "/data/tab_dot_dmmyyyy.txt")).toString('base64');
                convert model, data, (err, csv) ->
                    csv.should.be.equal(expected)
                    done()