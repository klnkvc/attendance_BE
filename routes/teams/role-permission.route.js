const express = require("express")
const {getRolePermission, updateRolePermission} = require("../../controllers/teams/role-permission.controller");
const routes = express()

routes.get('/role-permission/:roleId', getRolePermission)
routes.put('/role-permission/', updateRolePermission)

module.exports = routes