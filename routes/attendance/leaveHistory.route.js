const express = require('express')
const {getUserLeaveHistory, getUserSickHistory} = require("../../controllers/attendance/leaveHistory.controller");
const routes =express()

routes.post('/leave-history',[getUserLeaveHistory])
routes.post('/sick-history',[getUserSickHistory])
module.exports = routes