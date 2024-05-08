var express = require('express');
var app = express();

app.get('/', function(req, res){
    res.send('Hello All, I am Nita Septiani and you can call me nita');
});

app.listen(80, () => console.log('Express server started successfully.'));

