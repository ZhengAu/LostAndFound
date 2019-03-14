
var http = require("http");
var path = require("path");
var fs = require("fs");
var mime = require("mime");

http.createServer(function(req,res){
	/*
		__dirname : G:\LostAndFound
		req.url   : /admin/login.html
		publicDir : G:\LostAndFound
		filename  : G:\LostAndFound\admin\login.html
	*/
	var publicDir = path.join(__dirname);
	// 设置 "/" 时，是读取 template.html 文件
	if(req.url === "/"){
		req.url = "/template.html"
	}
	var filename = path.join(publicDir,req.url);
	/*
		读文件：
			err ： 读取错误
			data： 读取正常
			mime.getType()： 获取文件的类型，可以读取css，js等文件
	*/
	fs.readFile(filename,function(err,data){
		if (err) {
			res.writeHeader(200, {'Content-Type' : 'text/html;charset=utf-8'});
			res.end("<h2 style='color:#f00;'>File not found!  404 </h2>");
		} else {
			res.setHeader('Content-Type', mime.getType(filename));
			res.end(data);
		}
	});

}).listen(9090,function(){
	console.log("http://localhost:9090");
});