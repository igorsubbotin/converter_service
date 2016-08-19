module.exports = function Options(dateFormat, decimalDelimiter, header, separator) {
    this.dateFormat = dateFormat != null ? dateFormat : 'auto';
    this.decimalDelimiter = decimalDelimiter != null ? decimalDelimiter : 'auto';
    this.header = header != null ? header : false;
    this.separator = separator != null ? separator : 'auto';
    
    this.clone = function() {
        return new Options(this.dateFormat, this.decimalDelimiter, this.header, this.separator);
    };
};