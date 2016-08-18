module.exports = function Convert(fileName, pluginId, options, error, success, resultFileName) {
    this.fileName = fileName;
    this.pluginId = pluginId;
    this.options = options;
    this.error = error;
    this.success = success;
    this.resultFileName = resultFileName;
    this.hasHeaderRow = options.header;
    
    this.clone = function() {
        var clonedOptions = [];
        this.options.forEach(function(element, index, array) {
            clonedOptions.push(element.clone());
        });
        return new Convert(this.fileName, this.pluginId, clonedOptions, this.error, this.success, this.resultFileName);
    };
    
    this.toLog = function() {
        return "fileName:" + this.fileName + ", pluginId:" + this.pluginId + ", error:" + this.error + ", resultFileName:" + this.resultFileName + ", hasHeaderRow:" + this.hasHeaderRow;
    };
};