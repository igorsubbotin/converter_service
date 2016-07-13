var convertController = function() {
    var convertService = require("../services/convertService")();
    
    var post = function(req, res) {
        var convert = convertService.convert(req.body.fileName, req.body.pluginId, req.body.options);
        res.json(convert);
    };
    
    return {
        post: post,
    };
};

module.exports = convertController;