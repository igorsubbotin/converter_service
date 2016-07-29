console.log("Application started")
console.log("AWS_ACCESS_KEY_ID:" + process.env.AWS_ACCESS_KEY_ID);
console.log("AWS_SECRET_ACCESS_KEY:" + process.env.AWS_SECRET_ACCESS_KEY);

var express = require("express"),
    bodyParser = require("body-parser");
    
var uriList = require("./helpers/uriList");
    
var app = express();

var port = process.env.PORT || 8080;

app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

var formatRouter = require("./routes/formatRoutes")();
app.use(uriList.formatUri, formatRouter);
var pluginRouter = require("./routes/pluginRoutes")();
app.use(uriList.pluginUri, pluginRouter);
var convertRouter = require("./routes/convertRoutes")();
app.use(uriList.convertUri, convertRouter);
var healthRouter = require("./routes/healthRoutes")();
app.use(uriList.healthUri, healthRouter);

app.get('/', function(req, res) {
   res.send('Converter service API'); 
});

app.listen(port, function() {});

module.exports = app;
