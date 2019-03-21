var app = require('express')();
var server = require('http').Server(app);
var io = require('socket.io')(server);
//var mysql = require('mysql');
// require ('dotenv'). Config ();

  // app.use('/css', require('express').static('login_style'));
  app.use('/img', require('express').static('img'));
  app.use('/css', require('express').static('css'));
  app.use('/css', require('express').static(__dirname + '/node_modules/bootstrap/dist/css'));



//server.listen(1777);
// WARNING: app.listen(80) will NOT work here!

app.get('/', function (req, res) {
  res.sendFile(__dirname + '/index.html');
});

app.get('/consultation', function (req, res) {
  res.sendFile(__dirname + '/consultation.html');
});

app.get('/admin', function (req, res) {
  res.sendFile(__dirname + '/admin.html');
});

/*var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "db_biomedicale"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});*/

io.on('connection', function (socket) {
  socket.emit('news', { hello: 'world' });
  socket.on('my other event', function (data) {
    console.log(data);
  });
});

const PORT = process.env.PORT || 1777;

server.listen(PORT, console.log(`Server started on port ${PORT}`));
