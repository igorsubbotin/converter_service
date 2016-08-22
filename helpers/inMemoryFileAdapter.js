module.exports = function InMemoryFileAdapter()
{
    this.files = {};
    
    this.loadFile = function(fileName, handler) {
        handler(null, this.files[fileName]);
    };
    
    this.saveFile = function(fileName, data, handler) {
        this.files[fileName] = data;
        handler();
    };
};