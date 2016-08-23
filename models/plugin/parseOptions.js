var Options = require("./options/optionsModel");
var optionTypes = require("./options/optionTypes");

function parseDateFormat(value)
{
    var dateFormatAutomatically = require("./options/dateFormat/values/dateFormatAutomatically");
    var dateFormatMonthDayYear = require("./options/dateFormat/values/dateFormatMonthDayYear");
    var dateFormatDayMonthYear = require("./options/dateFormat/values/dateFormatDayMonthYear");
    var dateFormatOptionValueTypes = require("./options/dateFormat/values/types");
    switch (value.type) {
        case dateFormatOptionValueTypes.monthDayYear:
            return dateFormatMonthDayYear.value;
        case dateFormatOptionValueTypes.dayMonthYear:
            return dateFormatDayMonthYear.value;
        case dateFormatOptionValueTypes.automatically:
        default:
            return dateFormatAutomatically.value;
    }
}

function parseDecimalDelimiter(value)
{
    var decimalDelimiterComma = require("./options/decimalDelimiter/values/decimalDelimiterComma");
    var decimalDelimiterDot = require("./options/decimalDelimiter/values/decimalDelimiterDot");
    var decimalDelimiterOptionValueTypes = require("./options/decimalDelimiter/values/types");
    switch (value.type) {
        case decimalDelimiterOptionValueTypes.comma:
            return decimalDelimiterComma.value;
        case decimalDelimiterOptionValueTypes.dot:
            return decimalDelimiterDot.value;
        default:
            return 'auto';
    }
}

function parseHeader(value)
{
    var headerOptionValueTypes = require("./options/header/types");
    if (value.type == headerOptionValueTypes.hasHeaderRow) {
        return true;
    }
    return false;
}

function parseSeparator(value)
{
    var separatorComma = require("./options/separator/values/separatorComma");
    var separatorSemicolon = require("./options/separator/values/separatorSemicolon");
    var separatorTab = require("./options/separator/values/separatorTab");
    var separatorOptionValueTypes = require("./options/separator/values/types");
    switch (value.type) {
        case separatorOptionValueTypes.comma:
            return separatorComma.value;
        case separatorOptionValueTypes.semicolon:
            return separatorSemicolon.value;
        case separatorOptionValueTypes.tab:
            return separatorTab.value;
        default:
            return 'auto';
    }
}

var parseOptions = function(options) 
{
    var result = new Options();
    if (options == null) {
        return result;
    }
    for (var i = 0; i < options.length; i++) {
        var option = options[i];
        if (option.values == null || option.values.length == 0) {
            continue;
        }
        for (var j = 0; j < option.values.length; j++) {
            var value = option.values[j];
            if (!value.isSelected) {
                continue;
            }
            switch (option.type) {
                case optionTypes.dateFormatOption:
                    result.dateFormat = parseDateFormat(value);
                    break;
                case optionTypes.decimalDelimiterOption:
                    result.decimalDelimiter = parseDecimalDelimiter(value);
                    break;
                case optionTypes.headerOption:
                    result.header = parseHeader(value);
                    break;
                case optionTypes.separatorOption:
                    result.separator = parseSeparator(value);
                    break;
            }
        }
    }
    return result;
};

module.exports = parseOptions;