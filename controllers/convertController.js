var convertController = function() {
    var convertService = require("../services/convertService")();
    
    var post = function(req, res) {
        var fileName = req.body.fileName;
        console.log("<GET> Convert file: " + fileName);
        var convert = convertService.convert(fileName, req.body.pluginId, req.body.options);
        convert.then(value => {
            res.json(value);
        });
    };
    
    return {
        post: post,
    };
};

module.exports = convertController;