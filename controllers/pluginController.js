var pluginController = function() {
    var pluginService = require("../services/pluginService");
    var uriList = require("../helpers/uriList");
    
    var get = function(req, res) {
        console.log("<GET> Get all plugins");
        var plugins = pluginService.getAll();
        var returnPlugins = [];
        for (var k in plugins) {
            var newPlugin = plugins[k].clone();
            newPlugin.links = {};
            newPlugin.links.self = encodeURI('http://' + req.headers.host + uriList.pluginUri + "/" + newPlugin.id);
            returnPlugins.push(newPlugin);
        }
        
        res.json(returnPlugins);
    };
    
    var getById = function(req, res) {
        var pluginId = req.params.pluginId;
        console.log("<GET> Get plugin by id: " + pluginId);
        var plugin = pluginService.getById(pluginId);
        if (plugin) {
            res.json(plugin);
        } else {
            res.status(404).send('no plugin found');
        }
    };
    
    return {
        get: get,
        getById: getById
    };
};

module.exports = pluginController;