const express = require('express')
const {wfoClockIn, wfhClockIn, wfoClockOut, wfhClockOut, getAttendanceByUser} = require("../../controllers/attendance/attendance.controller");
const multerAttendance = require("../../middleware/multer-attendance")
const routes =express()

routes.post('/wfo',[wfoClockIn])
routes.put('/wfo/:id',[wfoClockOut])
routes.post('/wfh',[multerAttendance,wfhClockIn])
routes.put('/wfh/:id',[wfhClockOut])
routes.get('/attendance-user',[getAttendanceByUser])
module.exports = routes