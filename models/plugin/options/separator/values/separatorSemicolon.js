var types = require("./types");

function SeparatorSemicolon() {
    this.type = types.semicolon;
    this.name = 'Semicolon (;)';
    this.value = 'Delimited(;)';
    this.isDefault = false;
    
    this.clone = function() {
        return new SeparatorSemicolon();       
    };
}

var optionValue = new SeparatorSemicolon();

module.exports = optionValue;