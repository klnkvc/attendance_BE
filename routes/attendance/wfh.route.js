const express = require('express')
const {createWfh, historyWfh, allHistoryWfh, update, wfhCheck} = require("../../controllers/attendance/wfh.controller");
const routes =express()

routes.post('/wfh-request',createWfh)
routes.post('/wfh-history',historyWfh)
routes.post('/wfh-allhistory',allHistoryWfh)
routes.put('/wfh-approval/:id', update)
routes.get('/wfh-check', wfhCheck)

module.exports = routes