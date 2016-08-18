var fileHelper = require("../../helpers/fileHelper")();
var csvHelper = require("../../helpers/csvHelper");
var csvparse = require('js-csvparser');
var stringify = require('csv-stringify');
var moment = require("moment");

function normalizeDateTime(record) {
    var result = [];
    for (var i = 0; i < record.length; i++) {
        var item = record[i];
        if (Object.prototype.toString.call(item) === '[object Date]') {
            item = moment(item).format("DD MMM YY");
        }
        result.push(item);
    }
    return result;
}

var convert = function(model, handler) {
    fileHelper.loadFile(model.fileName, 'base64', function(err, data) {
        if (err) { console.log(err); }
        console.log("[CSV converter] Convert file: ", model.toLog());
        var text = new Buffer(data, 'base64').toString('utf-8');
        var options = {
            delimiter: model.options.separator,
            convertToTypes: {
                convert: true,
                decimalDelimiter: model.options.decimalDelimiter,
                dateFormat: model.options.dateFormat
            },
            header: false
        };
        var records = csvparse(text, options);
        var output = '';
        var stringifier = stringify();
        stringifier.on('readable', function() {
            var row;
            while(row = stringifier.read()) {
                output += row;
            }
        });
        stringifier.on('error', function(err){
          console.log(err.message);
        });
        for (var i = 0; i < records.data.length; i++) {
            stringifier.write(normalizeDateTime(records.data[i]));
        }
        stringifier.end();
        output = csvHelper.removeEmptyRows(output);
        if (!model.hasHeaderRow) {
            output = csvHelper.addFakeHeaderRow(output);
        }
        model.resultFileName = model.fileName +"_output";
        fileHelper.saveFile(model.resultFileName, output, function(err, data) { handler(err) });
    });
};

module.exports = convert;