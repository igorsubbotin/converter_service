var types = require("./types");

function DateFormatMonthDayYear() {
    this.type = types.monthDayYear;
    this.name = 'Month / Day / Year';
    this.value = 'm/dd/yyyy';
    this.isDefault = false;
    
    this.clone = function() {
        return new DateFormatMonthDayYear();
    };
}

var optionValue = new DateFormatMonthDayYear();

module.exports = optionValue;