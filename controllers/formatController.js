var formatController = function() {
    var formatService = require("../services/formatService")();
    var uriList = require("../helpers/uriList");
    
    this.getReturnFormat = function (format, req) {
        var returnFormat = format.clone();
        returnFormat.links = {};
        returnFormat.links.self = encodeURI('http://' + req.headers.host + uriList.formatUri + '/' + returnFormat.id);
        return returnFormat;
    };
    
    var get = function(req, res) {
        console.log("Format controller <GET>");
        console.log(req);
        if (req.query.fileName) {
            res.json(this.getReturnFormat(formatService.getByFileName(req.query.fileName), req));
        } else {
            var formats = formatService.getAll();
            var returnFormats = [];
            for (var k in formats) {
                returnFormats.push(this.getReturnFormat(formats[k], req));
            }
            res.json(returnFormats);    
            console.log(res);
        }
    };
    
    var getById = function(req, res) {
        console.log("Format controller <GET> by Id");
        console.log(req);
        var format = formatService.getById(req.params.formatId);
        if (format) {
            res.json(this.getReturnFormat(format, req));
            console.log(res);
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