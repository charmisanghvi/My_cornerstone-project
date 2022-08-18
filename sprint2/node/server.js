// content of index.js
const http = require('http');
const port = 3030;
const requestHandler = (request, response) => {
console.log(request.url);
response.end("Hello Node.js Server!");
};
const server = http.createServer(requestHandler);
server.listen(port, (err) => {
if (err) { return console.log("something bad happened", err); }
console.log("server is listening on $(port)");
});
// var http = require('http'); // 1 - Import Node.js core module

// var server = http.createServer(function (req, res) {   // 2 - creating server

//     //handle incomming requests here..

// });

// server.listen(5000); //3 - listen for any incoming requests

// console.log('Node.js web server at port 5000 is running..')