_ = require 'lodash'
chalk = require 'chalk'

class UserController
  constructor: ->
    @users = []
    @users.push name: 'nonocast', pass: '123456'
    @users.push name: 'tony', pass: 'kongmin'

  login: (req, res, next) =>
    @authenticate req.body.email, req.body.password, (err, user) ->
      console.log chalk.red 'login result:', unless err? then 'ok' else err.message
      if user?
        req.session.regenerate ->
          req.session.user = user
          res.redirect '/'
      else
        res.redirect '/login'

  logout: (req, res, next) ->
    req.session.destroy -> res.redirect '/'

  authenticate: (name, pass, fn) ->
    console.log 'authenticating %s:%s', name, pass
    user = _.find @users, name: name
    unless user? then return fn new Error('cannot find user')
    if pass is user.pass then fn(null, user) else fn new Error('invalid password')

  restrict: (req, res, next) ->
    if req.session.user? then next() else next new Error 'unauthorized'

module.exports = exports = UserController
