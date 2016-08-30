module.exports = function InMemoryFileAdapter(errorOnLoad, errorOnSave)
{
    this.files = {};
    
    this.loadFile = function(fileName, handler) {
        if (errorOnLoad) {
            handler("error during file load");
        } else {
            handler(null, this.files[fileName]);
        }
    };
    
    this.saveFile = function(fileName, data, handler) {
        if (errorOnSave) {
            handler("error during file save");
        } else {
            this.files[fileName] = data;
            handler();
        }
    };
};