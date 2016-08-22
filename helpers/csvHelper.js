var assert = require("assert");

var csvHelper = function() {
    var removeEmptyRows = function(csv) {
        var split = csv.split(/\r?\n/);
        var res = [];
        for (var i = 0; i < split.length; i++) {
            if (!isEmptyRow(split[i])) {
                res.push(split[i]);
            }
        }
        return res.join('\n');
    };
    
    var isEmptyRow = function(row) {
        var split = row.split(',');
        var res = 0;
        for (var i = 0; i < split.length; i++) {
            res += split[i].length;
        }
        return res == 0;
    };
    
    var addFakeHeaderRow = function(csv) {
        assert.ok(csv);
        var split = csv.split(/\r?\n/);
        var columns = [];
        for (var i = 0; i < split[0].split(',').length; i++) {
            columns.push("Column " + (i + 1));
        }
        return columns.join(',') + "\n" + csv;
    };
    
    return {
        removeEmptyRows: removeEmptyRows,
        addFakeHeaderRow: addFakeHeaderRow
    };
};

module.exports = csvHelper();