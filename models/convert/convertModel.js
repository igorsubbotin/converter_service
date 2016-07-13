module.exports = function Convert() {
    this.clone = function() {
        return new Convert();
    };
};