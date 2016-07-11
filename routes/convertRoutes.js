var express = require("express");

var routes = function(Format) {
    var convertRouter = express.Router();
    var convertController = require("../controllers/convertController")();
    convertRouter.route('/').get(convertController.get);
    convertRouter.route('/').post(convertController.post);
    convertRouter.route('/:convertId').get(convertController.getById);
    convertRouter.route('/:convertId').put(convertController.put);
    convertRouter.route('/:convertId').put(convertController.patch);
    return convertRouter;
};

module.exports = routes;