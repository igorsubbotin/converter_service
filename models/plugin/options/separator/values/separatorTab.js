var types = require("./types");

function SeparatorTab() {
    this.type = types.tab;
    this.name = 'Tab';
    this.value = '\t';
    this.isDefault = false;
    
    this.clone = function() {
        return new SeparatorTab();
    };
}

var optionValue = new SeparatorTab();

module.exports = optionValue;