var convertController = function() {
    var convertService = require("../services/convertService")();
    
    var post = function(req, res) {
        var fileName = req.body.fileName;
        console.log("<GET> Convert file: " + fileName);
        convertService.convert(fileName, req.body.pluginId, req.body.options, function(err, data) {
            if (err) { console.log(err) }
            res.json(data);
        });
    };
    
    return {
        post: post,
    };
};

module.exports = convertController;