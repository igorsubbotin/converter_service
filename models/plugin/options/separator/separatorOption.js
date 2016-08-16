var optionTypes = require("../optionTypes");
var optionUiTypes = require("../optionUiTypes");
var separatorComma = require("./values/separatorComma");
var separatorSemicolon = require("./values/separatorSemicolon");
var separatorTab = require("./values/separatorTab");

function SeparatorOption() {
    this.title = 'How do you separate columns in your file?';
    this.type = optionTypes.separatorOption;
    this.uiType = optionUiTypes.radioButtonList;
    this.values = [separatorComma, separatorSemicolon, separatorTab];
    
    this.clone = function() {
        return new SeparatorOption();
    };
}

var option = new SeparatorOption();

module.exports = option;