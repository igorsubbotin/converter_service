chai = require "chai"
chai.use(require('chai-shallow-deep-equal'))
should = chai.should()
Options = require("../../../../../models/plugin/options/optionsModel")
optionTypes = require("../../../../../models/plugin/options/optionTypes");
parseOptions = require("../../../../../models/plugin/parseOptions")
dateFormatAutomatically = require("../../../../../models/plugin/options/dateFormat/values/dateFormatAutomatically")
dateFormatMonthDayYear = require("../../../../../models/plugin/options/dateFormat/values/dateFormatMonthDayYear")
dateFormatDayMonthYear = require("../../../../../models/plugin/options/dateFormat/values/dateFormatDayMonthYear")
dateFormatOptionValueTypes = require("../../../../../models/plugin/options/dateFormat/values/types")
decimalDelimiterComma = require("../../../../../models/plugin/options/decimalDelimiter/values/decimalDelimiterComma")
decimalDelimiterDot = require("../../../../../models/plugin/options/decimalDelimiter/values/decimalDelimiterDot")
decimalDelimiterOptionValueTypes = require("../../../../../models/plugin/options/decimalDelimiter/values/types")
headerOptionValueTypes = require("../../../../../models/plugin/options/header/types")
separatorComma = require("../../../../../models/plugin/options/separator/values/separatorComma")
separatorSemicolon = require("../../../../../models/plugin/options/separator/values/separatorSemicolon")
separatorTab = require("../../../../../models/plugin/options/separator/values/separatorTab")
separatorOptionValueTypes = require("../../../../../models/plugin/options/separator/values/types")

describe "parseOptions tests", ->
    describe "on empty input", ->
        it "returns object with correct default values on empty input", ->
            options = new Options()
            parseOptions().should.shallowDeepEqual(options)
        
        it "returns object with correct default values on empty option.values", ->
            options = [{
                type: optionTypes.dateFormatOption
            }]
            parseOptions(options).should.shallowDeepEqual(new Options())
            
        it "returns object with correct default values on zero length option.values", ->
            options = [{
                type: optionTypes.dateFormatOption,
                values: []
            }]
            parseOptions(options).should.shallowDeepEqual(new Options())
            
        it "returns object with correct default values on isSelect=false for value", ->
            options = [{
                type: optionTypes.dateFormatOption,
                values: [{
                    type: dateFormatOptionValueTypes.monthDayYear,
                    isSelected: false
                }]
            }]
            parseOptions(options).should.shallowDeepEqual(new Options())
    
    describe "dateFormat parser", ->
        it "parses dateFormatAutomatically correclty", ->
            options = [{
                type: optionTypes.dateFormatOption,
                values: [{
                    type: dateFormatOptionValueTypes.automatically,
                    isSelected: true
                }]
            }]
            expected = new Options()
            expected.dateFormat = dateFormatAutomatically.value
            parseOptions(options).should.shallowDeepEqual(expected)
            
        it "parses dateFormatMonthDayYear correclty", ->
            options = [{
                type: optionTypes.dateFormatOption,
                values: [{
                    type: dateFormatOptionValueTypes.monthDayYear,
                    isSelected: true
                }]
            }]
            expected = new Options()
            expected.dateFormat = dateFormatMonthDayYear.value
            parseOptions(options).should.shallowDeepEqual(expected)
        
        it "parses dateFormatDayMonthYear correclty", ->
            options = [{
                type: optionTypes.dateFormatOption,
                values: [{
                    type: dateFormatOptionValueTypes.dayMonthYear,
                    isSelected: true
                }]
            }]
            expected = new Options()
            expected.dateFormat = dateFormatDayMonthYear.value
            parseOptions(options).should.shallowDeepEqual(expected)
            
    describe "decimalDelimiter parser", ->
        it "parses decimalDelimiterComma correclty", ->
            options = [{
                type: optionTypes.decimalDelimiterOption,
                values: [{
                    type: decimalDelimiterOptionValueTypes.comma,
                    isSelected: true
                }]
            }]
            expected = new Options()
            expected.decimalDelimiter = decimalDelimiterComma.value
            parseOptions(options).should.shallowDeepEqual(expected)
            
        it "parses decimalDelimiterDot correclty", ->
            options = [{
                type: optionTypes.decimalDelimiterOption,
                values: [{
                    type: decimalDelimiterOptionValueTypes.dot,
                    isSelected: true
                }]
            }]
            expected = new Options()
            expected.decimalDelimiter = decimalDelimiterDot.value
            parseOptions(options).should.shallowDeepEqual(expected)
            
        it "parses empty value correclty", ->
            options = [{
                type: optionTypes.decimalDelimiterOption,
                values: [{
                    type: null,
                    isSelected: true
                }]
            }]
            expected = new Options()
            parseOptions(options).should.shallowDeepEqual(expected)
            
    describe "header parser", ->
        it "parses header correclty", ->
            options = [{
                type: optionTypes.headerOption,
                values: [{
                    type: headerOptionValueTypes.hasHeaderRow,
                    isSelected: true
                }]
            }]
            expected = new Options()
            expected.header = true
            parseOptions(options).should.shallowDeepEqual(expected)
            
        it "parses header correclty with empty value type", ->
            options = [{
                type: optionTypes.headerOption,
                values: [{
                    type: null,
                    isSelected: true
                }]
            }]
            expected = new Options()
            parseOptions(options).should.shallowDeepEqual(expected)
            
    describe "separator parser", ->
        it "parses separatorComma correclty", ->
            options = [{
                type: optionTypes.separatorOption,
                values: [{
                    type: separatorOptionValueTypes.comma,
                    isSelected: true
                }]
            }]
            expected = new Options()
            expected.separator = separatorComma.value
            parseOptions(options).should.shallowDeepEqual(expected)
            
        it "parses separatorSemicolon correclty", ->
            options = [{
                type: optionTypes.separatorOption,
                values: [{
                    type: separatorOptionValueTypes.semicolon,
                    isSelected: true
                }]
            }]
            expected = new Options()
            expected.separator = separatorSemicolon.value
            parseOptions(options).should.shallowDeepEqual(expected)
            
        it "parses separatorTab correclty", ->
            options = [{
                type: optionTypes.separatorOption,
                values: [{
                    type: separatorOptionValueTypes.tab,
                    isSelected: true
                }]
            }]
            expected = new Options()
            expected.separator = separatorTab.value
            parseOptions(options).should.shallowDeepEqual(expected)
            
        it "parses empty value correclty", ->
            options = [{
                type: optionTypes.separatorOption,
                values: [{
                    type: null,
                    isSelected: true
                }]
            }]
            expected = new Options()
            parseOptions(options).should.shallowDeepEqual(expected)