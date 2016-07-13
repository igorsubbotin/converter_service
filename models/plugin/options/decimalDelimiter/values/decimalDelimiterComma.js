var types = require("./types");

function DecimalDelimiterComma() {
    this.type = types.comma;
    this.name = 'Comma (,)';
    this.value = ',';
    this.isDefault = false;
    
    this.clone = function() {
        return new DecimalDelimiterComma();
    };
}

var optionValue = new DecimalDelimiterComma();

module.exports = optionValue;