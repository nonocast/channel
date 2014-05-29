express = require 'express'
path = require 'path'
favicon = require 'static-favicon'
logger = require 'morgan'
cookieParser = require 'cookie-parser'
bodyParser = require 'body-parser'
session = require 'express-session'
chalk = require 'chalk'

app = express()

app.engine 'html', require('ejs').renderFile
app.set 'view engine', 'ejs'
app.set 'views', __dirname + '/view'

app.use favicon()
app.use logger 'dev'
app.use bodyParser.json()
app.use bodyParser.urlencoded()
app.use cookieParser()
app.use session secret: 'h705c', key: 'sid', cookie: { maxAge: 20*60*1000 } # 20 min
app.use express.static path.join __dirname, 'public'

app.use require './routes'

app.use (err, req, res, next) ->
  if err? and err.message is 'unauthorized' then res.redirect '/login'

app.use (req, res, next) ->
  err = new Error 'Not Found'
  err.status = 404
  next err

if app.get('env') is 'development'
  app.use (err, req, res, next) ->
    res.status err.status or 500
    res.render 'error', message: err.message, error: err

app.use (err, req, res, next) ->
  res.status err.status or 500
  res.render 'error', message: err.message, error: {}

unless module.parent?
  server = app.listen 3000, -> console.log 'listening on port %d', server.address().port
else
  module.exports = app
