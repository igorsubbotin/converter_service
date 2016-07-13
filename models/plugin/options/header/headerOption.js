var optionTypes = require("../optionTypes");
var optionUiTypes = require("../optionUiTypes");

function HeaderOption() {
    this.title = 'Does your file contain column headers in the first row?';
    this.type = optionTypes.headerOption;
    this.uiType = optionUiTypes.checkBox;
    this.values = [
        {
            type: 0,
            name: 'First row is a header',
            value: true,
            isDefault: true
        }];
    
    this.clone = function() {
        return option;
    };
}

var option = new HeaderOption();

module.exports = option;