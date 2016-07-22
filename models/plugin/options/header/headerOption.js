var optionTypes = require("../optionTypes");
var optionUiTypes = require("../optionUiTypes");
var types = require("./types");

function HeaderOption() {
    this.title = 'Does your file contain column headers in the first row?';
    this.type = optionTypes.headerOption;
    this.uiType = optionUiTypes.checkBox;
    this.values = [
        {
            type: types.hasHeaderRow,
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