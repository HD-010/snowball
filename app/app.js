var createError = require('http-errors');
var express      = require('express');
var cors         = require('cors'); //跨域访问控制模块
var path         = require('path');
var cookieParser = require('cookie-parser');
var session      = require('express-session');
var RedisStore   = require('connect-redis')(session);
var logger       = require('morgan');
var FileStreamRotator = require('file-stream-rotator');//借助file-stream-rotator插件，可以轻松完成日志分割的工作
var fs      = require('fs');
var ejs          = require('ejs');
var bodyParser   = require('body-parser');
var multer       = require('multer');
var ueditor      = require('ueditor');                        //加载ueditor模块
var myUeditor    = require('./e/vendor/esoft/plug/ueditor');  //加载ueditor插件入口文件
var appRouter    = require('./e/app');
var apiRouter    = require('./e/api');
var app          = express();
var sessionStore = new RedisStore({
    host:'127.0.0.1',
    port:6379,
    logErrors: true,
    db:1
});
// view engine setup
app.set('views', path.join(__dirname, 'views'));

app.engine('.html', ejs.__express);
app.set('view engine', 'html');

//开启跨域访问
app.use(cors());


//记录每次访问的日志开始
//定义日志记录文件
var logDirectory = path.join(__dirname+'\\modules\\api\\', 'log');
console.log(logDirectory);
fs.existsSync(logDirectory) || fs.mkdirSync(logDirectory);//日志目录不存在就创建一个log目录
//把日志写入到文件中
var accessLogStream = FileStreamRotator.getStream({
    date_format: 'YYYYMMDD',
    filename: path.join(logDirectory, 'log-%DATE%.log'),
    frequency: 'daily',
    verbose: false
   });

// 自定义token 设置时间
logger.token('localDate',function getDate(req) {
    let date = new Date();
    return date.toLocaleString()
  })
   
// 自定义format，其中包含自定义的token
logger.format('combined', ':remote-addr - :remote-user [:localDate]] ":method :url HTTP/:http-version" :status :res[content-length] ":referrer" ":user-agent"');

app.use("/api",logger('combined', {stream: accessLogStream}));
//记录每次访问的日志开始

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

//开启session
app.use(session({
    secret: 'node_snowball',
    store: sessionStore,
    cookie: {maxAge:60*1000*10},
    saveUninitialized: true,
    resave: true
}));
//更新session过期时间
app.use(function(req, res, next){
    req.session._garbage = Date();
    req.session.touch();
    next();
});

app.use("/ueditor/ue", ueditor(path.join(__dirname, 'public'), myUeditor.init));

//使用上传文件模块时需要加载
app.use(multer({ dest: '/temp/' }).array('image'));
app.use('/api', apiRouter);
app.use('/*', appRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
    next(createError(404));
});

// error handler
// app.use(function(err, req, res, next) {
//     // set locals, only providing error in development
//     res.locals.message = err.message;
//     res.locals.error   = req.app.get('env') === 'development' ? err : {};

//     // render the error page
//     res.status(err.status || 500);
//     res.render('error');
// });

module.exports = app;