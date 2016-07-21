var convertController = function() {
    var convertService = require("../services/convertService")();
    
    var post = function(req, res) {
        var convert = convertService.convert(req.body.fileName, req.body.pluginId, req.body.options);
        convert.then(value => {
            res.json(value);
        });
    };
    
    return {
        post: post,
    };
};

module.exports = convertController;