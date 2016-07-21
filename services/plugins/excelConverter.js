var xlsx = require("xlsx");
var fileHelper = require("../../helpers/fileHelper")();

var convert = function(model, handler) {
    fileHelper.loadFile(model.fileName, 'base64', function(err, data) {
        var workbook = xlsx.read(data, {type:'base64'});
        var csv = xlsx.utils.sheet_to_csv(workbook.Sheets[workbook.SheetNames[0]]);
        model.resultFileName = model.fileName +"_output";
        fileHelper.saveFile(model.resultFileName, csv, function(err, data) { handler(err) });
    });
};

module.exports = convert;