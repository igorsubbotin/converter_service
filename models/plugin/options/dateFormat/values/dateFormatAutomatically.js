var types = require("./types");

function DateFormatAutomatically() {
    this.type = types.automatically;
    this.name = 'Determine automatically (in case of problems try other settings)';
    this.value = 'auto';
    this.isDefault = true;
    
    this.clone = function() {
        return new DateFormatAutomatically();
    };
}

var optionValue = new DateFormatAutomatically();

module.exports = optionValue;