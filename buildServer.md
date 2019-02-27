
# 创建简易的本地服务器

1. 安装`node.js`
2. 在项目下，通过`npm init -y`创建`package.json`文件
3. 通过`npm install mime --save`加载mime插件
4. 创建`server.js`，内容如下
    ```
    var http=require("http");
    var path=require("path");
    var fs = require("fs");
    var mime = require("mime");

    http.createServer(function(req,res){
        var publicDir = path.join(__dirname);
        var filename = path.join(publicDir,req.url);
        // 控制台输出路径
        // console.log("filename ==> "+filename)
        fs.readFile(filename,function(err,data){
            if (err) {
                // 处理中文乱码
                res.writeHeader(200, {'Content-Type': 'text/html;charset=utf-8'});
                res.end("文件不存在 404 ");
            }else{
                // 统一获取资源
                res.setHeader('Content-Type', mime.getType(filename));
                res.end(data);
            }
        });

    }).listen(9090,function(){
        // 端口号9090
        console.log("http://localhost:9090");
    });
    ```


