const express = require('express')
const {login, validateLogin} = require("../controllers/auth.controller");
const routes =express()

routes.post('/login',[validateLogin, login])
module.exports = routes