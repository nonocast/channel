express = require 'express'
module.exports = app = express.Router()

UserController = require './controller/user'
userController = new UserController

# VIEW
# app.get '/', userController.restrict, (req, res, next) -> res.render 'index.html'
app.get '/', (req, res, next) -> res.render 'index.html'
app.get '/login', (req, res, next) -> res.render 'login.html'
app.get '/app/about', (req, res, next) -> res.render 'app/about.html'
app.get '/app/mbo', (req, res, next) -> res.render 'app/mbo.html'
app.get '/app/talk', (req, res, next) -> res.render 'app/talk.html'
app.get '/app/blog', (req, res, next) -> res.render 'app/blog.html'
app.get '/app/project', (req, res, next) -> res.render 'app/project.html'
app.get '/app/task', (req, res, next) -> res.render 'app/task.html'
app.get '/app/meeting', (req, res, next) -> res.render 'app/meeting.html'
app.get '/app/calendar', (req, res, next) -> res.render 'app/calendar.html'
app.get '/app/administrator', (req, res, next) -> res.render 'app/administrator.html'
app.get '/app/people', (req, res, next) -> res.render 'app/people.html'

# ADMIN
app.get '/config', (req, res, next) -> res.render 'config.html'
app.get '/config/project', (req, res, next) -> res.render 'config/project.html'

# API
app.post '/login', userController.login
app.get '/logout', userController.logout
