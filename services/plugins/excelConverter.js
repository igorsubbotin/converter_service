var xlsx = require("xlsx");
var fileHelper = require("../../helpers/fileHelper")();
var csvHelper = require("../../helpers/csvHelper");

var convert = function(model, handler) {
    fileHelper.loadFile(model.fileName, 'base64', function(err, data) {
        if (err) { console.log(err); }
        console.log("[Excel converter] Convert file: ", model.toLog());
        var workbook = xlsx.read(data, {type:'base64'});
        var csv = xlsx.utils.sheet_to_csv(workbook.Sheets[workbook.SheetNames[0]]);
        csv = csvHelper.removeEmptyRows(csv);
        if (!model.hasHeaderRow) {
            csv = csvHelper.addFakeHeaderRow(csv);
        }
        model.resultFileName = model.fileName +"_output";
        fileHelper.saveFile(model.resultFileName, csv, function(err, data) { handler(err) });
    });
};

module.exports = convert;