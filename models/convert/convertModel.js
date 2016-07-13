module.exports = function Convert(fileName, pluginId, options, error, success, resultFileName) {
    this.fileName = fileName;
    this.pluginId = pluginId;
    this.options = options;
    this.error = null;
    this.success = null;
    this.resultFileName = null;
    
    this.clone = function() {
        var clonedOptions = [];
        this.options.forEach(function(element, index, array) {
            clonedOptions.push(element.clone());
        });
        return new Convert(this.fileName, this.pluginId, clonedOptions, this.error, this.success, this.resultFileName);
    };
};