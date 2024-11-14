const express = require('express')
const app = express()
const auth = require('./auth.route')
const teams = require('./teams/teams.route')
const role = require('./teams//role.route')
const rolePermission = require('./teams/role-permission.route')
const attendance = require('./attendance/attendance.route')
const attendanceHistory = require('./attendance/attendanceHistory.route')
const leave = require('./attendance/leave.route')
const leaveHistory = require('./attendance/leaveHistory.route')
const wfh = require('./attendance/wfh.route')
const report = require('./report/report.route')
const baseURL = "/api/v1"
const passport = require('passport')
require('../middleware/passport')

app.use(baseURL, auth)
app.use(baseURL, passport.authenticate("internal-rule", {session:false}), teams)
app.use(baseURL, passport.authenticate("internal-rule", {session:false}), role)
app.use(baseURL, passport.authenticate("internal-rule", {session:false}), rolePermission)

app.use(baseURL, passport.authenticate("internal-rule", {session:false}), attendance)
app.use(baseURL, passport.authenticate("internal-rule", {session:false}), attendanceHistory)
app.use(baseURL, passport.authenticate("internal-rule", {session:false}), leave)
app.use(baseURL, passport.authenticate("internal-rule", {session:false}), leaveHistory)
app.use(baseURL, passport.authenticate("internal-rule", {session:false}), wfh)

app.use(baseURL, passport.authenticate("internal-rule", {session:false}), report)

module.exports = app