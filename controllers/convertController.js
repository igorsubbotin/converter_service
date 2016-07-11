var convertController = function() {
    var convertService = require("../services/convertService")();
    var uriList = require("../helpers/uriList");
    
    var get = function(req, res) {
        return res.json();
        // var plugins = convertService.getAll();
        // var returnPlugins = [];
        // for (var k in plugins) {
        //     var newPlugin = plugins[k].clone();
        //     newPlugin.links = {};
        //     newPlugin.links.self = encodeURI('http://' + req.headers.host + uriList.pluginUri + "/" + newPlugin.id);
        //     returnPlugins.push(newPlugin);
        // }
        
        // res.json(returnPlugins);
    };
    
    var post = function(req, res) {
        
    };
    
    var getById = function(req, res) {
        // var plugin = convertService.getById(req.params.pluginId);
        // if (plugin) {
        //     res.json(plugin);
        // } else {
        //     res.status(404).send('no plugin found');
        // }
    };
    
    var put = function(req, res) {
        
    };
    
    var patch = function(req, res) {
        
    };
    
    return {
        get: get,
        post: post,
        getById: getById,
        put: put,
        patch: patch
    };
};

module.exports = convertController;