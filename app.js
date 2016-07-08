var express = require("express"),
    bodyParser = require("body-parser");
    
var app = express();

var port = process.env.PORT;

app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

var formatRouter = require("./routes/formatRoutes")();
app.use('/api/formats', formatRouter);

app.get('/', function(req, res) {
   res.send('Converter service API'); 
});

app.listen(port, function() {});

module.exports = app;