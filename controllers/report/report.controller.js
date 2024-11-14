const {res400, res200} = require("../../utils/response");
const {report} = require("../../models/report/report.model");
const getAllReport = async (req,res)=>{
    const {month, year} = req.body
    try {
        if (month===""||month===undefined||year===""||year===undefined){
            return res400(res, {message:"Invalid Data"})
        }
        const result = await report.getAll({month,year})
        return res200(res, {message:"Get Data Success", data:result})
    }catch (e) {
        return res400(res, {message:"Couldn't get data", error: e.sqlMessage})
    }
}
const attendanceReport = async (req,res)=>{
    const {month, year, userId} = req.body
    try {
        if (month===""||month===undefined||year===""||year===undefined||userId===""||userId===undefined){
            return res400(res, {message:"Invalid Data"})
        }
        const result = await report.getAttendance({month,year,userId})
        return res200(res, {message:"Get Data Success", data:result})
    }catch (e) {
        return res400(res, {message:"Couldn't get data", error: e.sqlMessage})
    }
}
const leaveReport = async (req,res)=>{
    const {month, year, userId} = req.body
    try {
        if (month===""||month===undefined||year===""||year===undefined||userId===""||userId===undefined){
            return res400(res, {message:"Invalid Data"})
        }
        const result = await report.getLeave({month,year,userId})
        return res200(res, {message:"Get Data Success", data:result})
    }catch (e) {
        return res400(res, {message:"Couldn't get data", error: e.sqlMessage})
    }
}
const sickReport = async (req,res)=>{
    const {month, year, userId} = req.body
    try {
        if (month===""||month===undefined||year===""||year===undefined||userId===""||userId===undefined){
            return res400(res, {message:"Invalid Data"})
        }
        const result = await report.getSick({month,year,userId})
        return res200(res, {message:"Get Data Success", data:result})
    }catch (e) {
        return res400(res, {message:"Couldn't get data", error: e.sqlMessage})
    }
}

module.exports = {getAllReport, attendanceReport,leaveReport,sickReport}