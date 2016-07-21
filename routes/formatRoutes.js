var express = require("express");

var routes = function() {
    var formatRouter = express.Router();
    var formatController = require("../controllers/formatController")();
    formatRouter.route('/').get(formatController.get);
    formatRouter.route('/:formatId').get(formatController.getById);
    return formatRouter;
};

module.exports = routes;