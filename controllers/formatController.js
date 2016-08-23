var formatController = function() {
    var formatService = require("../services/formatService");
    var uriList = require("../helpers/uriList");
    
    this.getReturnFormat = function (format, req) {
        var returnFormat = format.clone();
        returnFormat.links = {};
        returnFormat.links.self = encodeURI('http://' + req.headers.host + uriList.formatUri + '/' + returnFormat.id);
        return returnFormat;
    };
    
    var get = function(req, res) {
        console.log("<GET> Get all formats");
        if (req.query.fileName) {
            res.json(this.getReturnFormat(formatService.getByFileName(req.query.fileName), req));
        } else {
            var formats = formatService.getAll();
            var returnFormats = [];
            for (var k in formats) {
                returnFormats.push(this.getReturnFormat(formats[k], req));
            }
            res.json(returnFormats);    
        }
    };
    
    var getById = function(req, res) {
        var formatId = req.params.formatId;
        console.log("<GET> Get format by id: " + formatId);
        var format = formatService.getById(formatId);
        if (format) {
            res.json(this.getReturnFormat(format, req));
        } else {
            res.status(404).send('no format found');
        }
    };
    
    return {
        get: get,
        getById: getById
    };
};

module.exports = formatController;