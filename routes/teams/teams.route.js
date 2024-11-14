const express = require('express')
const {getAll, validateMiddleware, created, updated, deleted, getGender, getWorkLocation, userWorkLocation} = require("../../controllers/teams/teams.controller");
const routes = express()

routes.get("/teams", getAll)
routes.post("/teams", [validateMiddleware, created])
routes.put("/teams/:id", [validateMiddleware, updated])
routes.delete("/teams/:id", deleted)
routes.get("/gender", getGender)
routes.get("/work-location", getWorkLocation)
routes.get("/teams-location", userWorkLocation)

module.exports = routes