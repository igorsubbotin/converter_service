var types = require("./types");

function DecimalDelimiterDot() {
    this.type = types.dot;
    this.name = 'Dot (.)';
    this.value = '.';
    this.isDefault = true;
    
    this.clone = function() {
        return new DecimalDelimiterDot();
    };
}

var optionValue = new DecimalDelimiterDot();

module.exports = optionValue;