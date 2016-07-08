var formatController = function() {
    var formatService = require("../services/formatService")();
    var uriList = require("../helpers/uriList");
    
    var get = function(req, res) {
        var formats = formatService.getAll();
        var returnFormats = [];
        for (var k in formats) {
            var newFormat = formats[k].clone();
            newFormat.links = {};
            newFormat.links.self = encodeURI('http://' + req.headers.host + uriList.formatUri + "/" + newFormat.id);
            returnFormats.push(newFormat);
        }
        
        res.json(returnFormats);
    };
    
    var getById = function(req, res) {
        var format = formatService.getById(req.params.formatId);
        if (format) {
            var returnFormat = format.clone();
            returnFormat.links = {};
            returnFormat.links.GetPluginById = encodeURI('http://' + req.headers.host + uriList.pluginUri + "/" + returnFormat.pluginId); 
            res.json(returnFormat);
        } else {
            res.status(404).send('no format found');
        }
    };
    
    return {
        get: get,
        getById: getById
    };
};

module.exports = formatController;