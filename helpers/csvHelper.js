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
    
    return {
        removeEmptyRows: removeEmptyRows
    };
};

module.exports = csvHelper();