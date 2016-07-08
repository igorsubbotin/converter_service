var express = require("express");

var routes = function(Format) {
    var pluginRouter = express.Router();
    var pluginController = require("../controllers/pluginController")();
    pluginRouter.route('/').get(pluginController.get);
    pluginRouter.route('/:pluginId').get(pluginController.getById);
    return pluginRouter;
};

module.exports = routes;