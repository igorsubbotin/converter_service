var express = require("express");

var routes = function() {
    var optionRouter = express.Router();
    var optionController = require("../controllers/optionController")();
    optionRouter.route('/').get(optionController.get);
    optionRouter.route('/:optionId').get(optionController.getById);
    return optionRouter;
};

module.exports = routes;