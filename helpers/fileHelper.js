var assert = require("assert");

module.exports = function FileHelper(fileAdapter)
{
    assert.ok(fileAdapter);
    
    this.isOk = function() {
        return true;
    };
    
    this.loadFile = function(fileName, type, handler) {
        assert.ok(fileName, "fileName required");
        assert.ok(type, "type required");
        assert.ok(handler, "handler required");
        
        fileAdapter.loadFile(fileName, function(err, data) {
            /* istanbul ignore if */
            if (err) { 
                handler(err);
            }
            else {
                console.log("File loaded", fileName, type);
                handler(err, data.toString(type));
            }
        });
    };
    
    this.saveFile = function(fileName, data, handler) {
        assert.ok(fileName, "fileName required");
        assert.ok(data, "data required");
        assert.ok(handler, "handler required");
        
        fileAdapter.saveFile(fileName, data, function(err, data) {
            /* istanbul ignore if */
            if (err) { 
                handler(err);
            }
            else {
                console.log("File saved", fileName);
                handler(err, data);
            }
        });
    };
};