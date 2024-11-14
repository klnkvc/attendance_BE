const express = require('express')
const {getLeaveType, createLeave, allLeave, allSick, update, checkDate} = require("../../controllers/attendance/leave.controller");
const multerAttendance = require("../../middleware/multer-attendance");
const routes =express()

routes.get('/leave-type',getLeaveType)
routes.post('/leave',[multerAttendance,createLeave])
routes.post('/leave-all',allLeave)
routes.post('/sick-all',allSick)
routes.put('/leave-approval/:id',update)
routes.get('/leave-check',checkDate)

module.exports = routes