module.exports = function Format(id, name, extension, pluginId) {
    this.id = id;
    this.name = name;
    this.extension = extension;
    this.pluginId = pluginId;
    
    this.clone = function() {
        return new Format(this.id, this.name, this.extension, this.pluginId);
    }
};