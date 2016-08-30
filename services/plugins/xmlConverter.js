var xlsx = require("xlsx");
var stripBom = require('strip-bom');
var moment = require("moment");

function normalizeDateTime(cell) {
    var d = moment(cell.w, 'dddd, MMMM D, YYYY', true);
    if (d.isValid()) {
        cell.w = d.format('DD MMM YY');
    }
    return cell;
}

var convert = function(model, data, next) {
    var workbook = xlsx.read(new Buffer(stripBom(new Buffer(data, 'base64').toString())), {type:'buffer'});
    var worksheet = workbook.Sheets[workbook.SheetNames[0]];
    for (var z in worksheet) {
        if(z[0] === '!') continue;
        worksheet[z] = normalizeDateTime(worksheet[z]);
    }
    var csv = xlsx.utils.sheet_to_csv(workbook.Sheets[workbook.SheetNames[0]]);
    next(null, csv);
};

module.exports = convert;