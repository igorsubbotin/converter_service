var xlsx = require("xlsx");
var moment = require("moment");

function normalizeDateTime(cell) {
    var d = moment(cell.w, 'dddd, MMMM D, YYYY', true);
    if (d.isValid()) {
        cell.w = d.format('DD MMM YY');
    }
    return cell;
}

var convert = function(model, data, next) {
    var workbook = xlsx.read(data, {type:'base64' });
    var worksheet = workbook.Sheets[workbook.SheetNames[0]];
    for (var z in worksheet) {
        if(z[0] === '!') continue;
        worksheet[z] = normalizeDateTime(worksheet[z]);
    }
    var csv = xlsx.utils.sheet_to_csv(worksheet);
    next(null, csv);
};

module.exports = convert;