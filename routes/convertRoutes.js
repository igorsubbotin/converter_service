var express = require("express");

var routes = function(Format) {
    var convertRouter = express.Router();
    var convertController = require("../controllers/convertController")();
    convertRouter.route('/').post(convertController.post);
    return convertRouter;
};

module.exports = routes;