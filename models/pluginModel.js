module.exports = function Plugin(id, formatDisplayName) {
    this.id = id;
    this.formatDisplayName = formatDisplayName;
    
    this.clone = function() {
        return new Plugin(this.id, this.formatDisplayName);
    }
};