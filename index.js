const fs = require('fs');
require('dotenv').config()
const express = require('express')
const bodyParser = require("body-parser");
const {res200} = require("./utils/response");
const cors = require('cors')
const app = express()
const PORT = process.env.PORT
const routes=require('./routes')
const {privateDir} = require("./utils/tools");

app.use(cors())
app.use(bodyParser.json())
app.get('/', (req, res)=>res200(res, "OK"))
app.use(express.static(privateDir()));
app.use(routes)

app.listen(PORT, '0.0.0.0',()=>console.log("Server is running on PORT", PORT))
