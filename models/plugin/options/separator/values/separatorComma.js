var types = require("./types");

function SeparatorComma() {
    this.type = types.comma;
    this.name = 'Comma (,)';
    this.value = 'Delimited(,)';
    this.isDefault = true;
    
    this.clone = function() {
        return new SeparatorComma();
    };
}

var optionValue = new SeparatorComma();

module.exports = optionValue;