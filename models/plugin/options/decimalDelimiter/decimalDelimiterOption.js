var optionTypes = require("../optionTypes");
var optionUiTypes = require("../optionUiTypes");
var decimalDelimiterComma = require("./values/decimalDelimiterComma");
var decimalDelimiterDot = require("./values/decimalDelimiterDot");

function DecimalDelimiterOption() {
    this.title = 'What kind of decimal separator does you file use?';
    this.type = optionTypes.decimalDelimiterOption;
    this.uiType = optionUiTypes.radioButtonList;
    this.values = [decimalDelimiterDot, decimalDelimiterComma];
    
    this.clone = function() {
        return new DecimalDelimiterOption();
    };
}

var option = new DecimalDelimiterOption();

module.exports = option;