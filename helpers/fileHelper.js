var assert = require("assert");

var fileHelper = function(fileAdapter)
{
    this.loadFile = function(fileName, type, handler) {
        assert.ok(fileName, "fileName required");
        assert.ok(type, "type required");
        
        fileAdapter.loadFile(fileName, function(err, data) {
            if (err) { console.log(err) }
            else {
                console.log("File loaded", fileName, type);
                handler(err, data.Body.toString(type));
            }
        });
    };
    
    this.saveFile = function(fileName, data, handler) {
        assert.ok(fileName, "fileName required");
        assert.ok(data, "data required");
        
        fileAdapter.saveFile(fileName, data, function(err, data) {
            if (err) { console.log(err); }
            else {
                console.log("File saved", fileName);
                handler(err);
            }
        });
    };
};

module.exports = fileHelper();