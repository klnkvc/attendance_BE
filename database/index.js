// const mysql = require('mysql2/promise')
const {createPool} = require('mysql2/promise')
require('dotenv').config()

// const internalDB = mysql.createPool({
//     host:process.env.host,
//     user:process.env.USER,
//     database:process.env.DB_MG,
//     password:process.env.PASSWORD,
//     connectionLimit:10,
//     enableKeepAlive:true,
//     keepAliveInitialDelay:0
// })
// const moduleDB=mysql.createPool({
//     host:process.env.host,
//     user:process.env.USER,
//     database:process.env.DB_MO,
//     password:process.env.PASSWORD,
//     connectionLimit:10,
//     enableKeepAlive:true,
//     keepAliveInitialDelay:0
// })
//
// const query =async (query,value)=>{
//     try {
//         return await internalDB.query(query, value ?? [])
//     }catch (e) {
//         throw e
//     }
// }
//
// const moduleQuery = async (query,value)=>{
//     try {
//         return await moduleDB.query(query, value ?? [])
//     }catch (e) {
//         throw e
//     }
// }

// module.exports = {query, moduleQuery}

module.exports ={
    internalDB: createPool({
        host:process.env.host,
        user:process.env.USER,
        database:process.env.DB_MG,
        password:process.env.PASSWORD,
        connectionLimit:10,
        enableKeepAlive:true,
        keepAliveInitialDelay:0
    }),
    moduleDB : createPool({
        host:process.env.host,
        user:process.env.USER,
        database:process.env.DB_MO,
        password:process.env.PASSWORD,
        connectionLimit:10,
        enableKeepAlive:true,
        keepAliveInitialDelay:0
    })
}
