var types = require("./types");

function DateFormatDayMonthYear() {
    this.type = types.dayMonthYear;
    this.name = 'Day / Month / Year';
    this.value = 'd/mm/yyyy';
    this.isDefault = false;
    
    this.clone = function() {
        return new DateFormatDayMonthYear();
    };
}

var optionValue = new DateFormatDayMonthYear();

module.exports = optionValue;