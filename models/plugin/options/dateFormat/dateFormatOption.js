var optionTypes = require("../optionTypes");
var optionUiTypes = require("../optionUiTypes");
var dateFormatAutomatically = require("./values/dateFormatAutomatically");
var dateFormatMonthDayYear = require("./values/dateFormatMonthDayYear");
var dateFormatDayMonthYear = require("./values/dateFormatDayMonthYear");

function DateFormatOption() {
    this.title = 'What date format is used in your file?';
    this.type = optionTypes.dateFormatOption;
    this.uiType = optionUiTypes.radioButtonList;
    this.values = [dateFormatAutomatically, dateFormatMonthDayYear, dateFormatDayMonthYear];
    
    this.clone = function() {
        return new DateFormatOption();
    };
}

var option = new DateFormatOption();

module.exports = option;