const express = require('express')
const {getAllReport, attendanceReport, leaveReport, sickReport} = require("../../controllers/report/report.controller");
const routes =express()

routes.post('/report',getAllReport)
routes.post('/attendance-report',attendanceReport)
routes.post('/leave-report',leaveReport)
routes.post('/sick-report',sickReport)


module.exports = routes