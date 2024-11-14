const {res200, res400} = require("../../utils/response");
const {randomUUID}=require('crypto')
const {leave} = require("../../models/attendance/leave.model");
const {dateConvert} = require("../../utils/tools");
const getLeaveType = async (req,res)=>{
    try {
        const result = await leave.getLeaveType()
        return res200(res,result)
    }catch (e) {
        return res400(res, {message:"Couldn't get data", error: e.sqlMessage})
    }
}

const createLeave = async (req,res) =>{
    const {destinationCity, destinationAddress, startDate, workDate, desc, leaveTypeId} = req.body
    console.log(req.body)
    let evidence = null;
    if (leaveTypeId !== '1') {
        if (req.files.photo) {
            const { photo } = req.files;
            evidence = photo[0].filename;
        }
    }
    const {employeeId} = req.user
    const data = {
        id:randomUUID(),
        destinationCity,
        destinationAddress,
        startDate:dateConvert(startDate),
        workDate:dateConvert(workDate),
        evidence:evidence,
        desc,
        employeeId,
        leaveTypeId
    }
    try{
        if (
            startDate===""||startDate===undefined||
            workDate===""||workDate===undefined
        ){
            return res400(res, {message:"Invalid Data"})
        }
        await leave.create(data)
        return res200(res,{message:leaveTypeId===1?"Leave Created":"Sick Created"})
    }catch (e) {
        return res400(res, {message:"Couldn't get data", error: e.sqlMessage})
    }
}

const allLeave = async (req,res)=>{
    const {month, year} = req.body
    try {
        if (month===""||month===undefined||year===""||year===undefined){
            return res400(res, {message:"Invalid Data"})
        }
        const result = await leave.AllLeave({month, year})
        return res200(res, {message:"Get Data Success", data:result})
    }catch (e) {
        return res400(res, {message:"Something wong", error:e})
    }
}
const allSick = async (req,res)=>{
    const {month, year} = req.body
    try {
        if (month===""||month===undefined||year===""||year===undefined){
            return res400(res, {message:"Invalid Data"})
        }
        const result = await leave.AllSick({month, year})
        return res200(res, {message:"Get Data Success", data:result})
    }catch (e) {
        return res400(res, {message:"Something wong", error:e})
    }
}
const update = async (req,res)=>{
    const {employeeId} = req.user
    const {approval} = req.body
    const {id} = req.params
    try {
        if (approval===""||approval===undefined||id===""||id===undefined){
            return res400(res, {message:"Invalid Data"})
        }
        await leave.approval({employeeId,approval,id})
        return res200(res,{message:"Leave approval updated"})
    }catch (e) {
        return res400(res, {message:"Something wong", error:e})
    }
}
const checkDate = async (req,res)=>{
    const {employeeId} = req.user
    try {
        const result = await leave.checkDate({employeeId})
        return res200(res,{message:"Data Check Success", data:result})
    }catch (e) {
        return res400(res, {message:"Something wong", error:e})
    }
}

module.exports = {getLeaveType, createLeave, allLeave, allSick, update, checkDate}