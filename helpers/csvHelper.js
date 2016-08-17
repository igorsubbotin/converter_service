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
        var split = csv.split(/\r?\n/);
        if (split.length == 0) {
            return csv;
        }
        var columns = [];
        for (var i = 0; i < split[0].split(',').length; i++) {
            columns.push("Column " + i);
        }
        return columns.join(',') + "\n" + csv;
    };
    
    return {
        removeEmptyRows: removeEmptyRows,
        addFakeHeaderRow: addFakeHeaderRow
    };
};

module.exports = csvHelper();