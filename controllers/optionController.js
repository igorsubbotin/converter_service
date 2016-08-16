var optionController = function() {
    var optionService = require("../services/optionService")();
    var uriList = require("../helpers/uriList");
    
    var get = function(req, res) {
        console.log("<GET> Get all options");
        var options = optionService.getAll();
        var returnOptions = [];
        for (var k in options) {
            var newOption = options[k].clone();
            newOption.links = {};
            newOption.links.self = encodeURI('http://' + req.headers.host + uriList.optionUri + "/" + k);
            returnOptions.push(newOption);
        }
        
        res.json(returnOptions);
    };
    
    var getById = function(req, res) {
        var optionId = req.params.optionId;
        console.log("<GET> Get option by id: " + optionId);
        var option = optionService.getById(optionId);
        if (option) {
            res.json(option);
        } else {
            res.status(404).send('no plugin found');
        }
    };
    
    return {
        get: get,
        getById: getById
    };
};

module.exports = optionController;