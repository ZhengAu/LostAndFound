
var http=require("http");
var path=require("path");
var fs = require("fs");
var mime = require("mime");

http.createServer(function(req,res){
	var publicDir = path.join(__dirname);
	var filename = path.join(publicDir,req.url);
	// console.log("filename ==> "+filename);
	fs.readFile(filename,function(err,data){
		if (err) {
			res.writeHeader(200, {'Content-Type': 'text/html;charset=utf-8'});
			res.end("File not found!  404 ");
		}else{
			res.setHeader('Content-Type', mime.getType(filename));
			res.end(data);
		}
	});

}).listen(9090,function(){
	
	console.log("http://localhost:9090");
});