var xlsx = require("xlsx");
var fileHelper = require("../../configuration/getFileHelper")();
var csvHelper = require("../../helpers/csvHelper");
var stripBom = require('strip-bom');

var convert = function(model, handler) {
    fileHelper.loadFile(model.fileName, 'base64', function(err, data) {
        if (err) { console.log(err); }
        console.log("[XML Spreadsheet converter] Convert file: ", model.toLog());
        var workbook = xlsx.read(new Buffer(stripBom(new Buffer(data, 'base64').toString())), {type:'buffer'});
        var csv = xlsx.utils.sheet_to_csv(workbook.Sheets[workbook.SheetNames[0]]);
        csv = csvHelper.removeEmptyRows(csv);
        if (!model.hasHeaderRow) {
            csv = csvHelper.addFakeHeaderRow(csv);
        }
        model.resultFileName = model.fileName +"_output";
        fileHelper.saveFile(model.resultFileName, csv, function(err) { handler(err) });
    });
};

module.exports = convert;