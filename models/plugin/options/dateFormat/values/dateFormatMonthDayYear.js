var types = require("./types");

function DateFormatMonthDayYear() {
    this.type = types.monthDayYear;
    this.name = 'Month / Day / Year';
    this.value = 'M/d/yyyy';
    this.isDefault = false;
    
    this.clone = function() {
        new DateFormatMonthDayYear();
    };
}

var optionValue = new DateFormatMonthDayYear();

module.exports = optionValue;