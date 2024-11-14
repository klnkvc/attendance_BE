const express = require('express')
const {getUserAttendanceHistory} = require("../../controllers/attendance/attendanceHistory.controller");
const routes =express()

routes.post('/attendance-history',[getUserAttendanceHistory])
module.exports = routes