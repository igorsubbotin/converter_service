module.exports = function Plugin(id, formatDisplayName, options) {
    this.id = id;
    this.formatDisplayName = formatDisplayName;
    this.options = options;
    
    this.clone = function() {
        var clonedOption = [];
        this.options.forEach(function(element, index, array) {
            clonedOption.push(element.clone());
        });
        return new Plugin(this.id, this.formatDisplayName, clonedOption);
    };
};