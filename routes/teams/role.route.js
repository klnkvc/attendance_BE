const express = require("express")
const {getAll, validateMiddleware, created, updated, deleted} = require("../../controllers/teams/role.controller");
const routes = express()

routes.get('/role', getAll)
routes.post('/role',[validateMiddleware,created])
routes.put('/role/:id',[validateMiddleware,updated])
routes.delete('/role/:id', deleted)

module.exports = routes