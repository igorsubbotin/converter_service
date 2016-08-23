var optionService = function() {
    var options = require("../models/plugin/options");
    
    var getAll = function() {
        return options;
    };
    var getById = function(id) {
        return options[id];
    };
    return {
        getAll: getAll,
        getById: getById,
    };
};

module.exports = optionService();