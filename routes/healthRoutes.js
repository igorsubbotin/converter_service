var express = require("express");

var routes = function() {
    var healthRouter = express.Router();
    healthRouter.route('/').get(
        function(req, res) { 
            res.json(
                { 
                    status: "OK"
                }); 
        });
    return healthRouter;
};

module.exports = routes;