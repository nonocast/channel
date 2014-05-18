express = require 'express'
module.exports = app = express.Router()

UserController = require './controller/user'
userController = new UserController

# VIEW
app.get '/', userController.restrict, (req, res, next) -> res.render 'index.html'
app.get '/login', (req, res, next) -> res.render 'login.html'

# API
app.post '/login', userController.login
app.get '/logout', userController.logout
