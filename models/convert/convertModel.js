module.exports = function Convert(fileName, pluginId, options, error, success, resultFileName, hasHeaderRow) {
    this.fileName = fileName;
    this.pluginId = pluginId;
    this.options = options;
    this.error = error;
    this.success = success;
    this.resultFileName = resultFileName;
    this.hasHeaderRow = hasHeaderRow;
    
    this.clone = function() {
        var clonedOptions = [];
        this.options.forEach(function(element, index, array) {
            clonedOptions.push(element.clone());
        });
        return new Convert(this.fileName, this.pluginId, clonedOptions, this.error, this.success, this.resultFileName, this.hasHeaderRow);
    };
};