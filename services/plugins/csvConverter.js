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

var convert = function(model, data, next) {
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
    var csv = '';
    var stringifier = stringify();
    stringifier.on('readable', function() {
        var row = stringifier.read();
        while(row) {
            csv += row;
            row = stringifier.read();
        }
    });
    stringifier.on('error', function(err) {
      console.log(err.message);
    });
    for (var i = 0; i < records.data.length; i++) {
        stringifier.write(normalizeDateTime(records.data[i]));
    }
    stringifier.end();
    next(null, csv);
};

module.exports = convert;