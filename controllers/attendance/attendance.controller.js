const {res400, res200} = require("../../utils/response");
const {attendance} = require("../../models/attendance/attendance.model");
const {randomUUID}=require('crypto')

const wfoClockIn = async (req,res)=>{
    const {employeeId} = req.user
    const data ={
        id:randomUUID(),
        employeeId,
        workTypeId:1
    }
    try{
        const result = await attendance.create(data)
        return res200(res,{message:"Attendance Clocked In", data:result})
    }catch (e) {
        return res400(res, {message:"Something wong", error:e})
    }
}

const wfoClockOut = async (req,res)=>{
    const {employeeId} = req.user
    const {id} = req.params
    const data = {
        id,
        employeeId
    }
    try {
        if (id===""||id===undefined){
            return res400(res, {message:"Invalid Data"})
        }
        const check = await attendance.checkAttendance(data)
        if (check.length===0) return res400(res, {message:"Attendance Not Found"})
        const result = await attendance.clockOut(data)
        return res200(res, {message:"Attendance Clocked Out", data:result})
    }catch (e) {
        return res400(res, {message:"Something wong", error:e})
    }
}

const wfhClockIn = async (req,res)=>{
    if (!req.files || !req.files.photo){
        return res.status(400).json({error:"No Images"})
    }
    const {employeeId} = req.user
    const {wfhLoc} = req.body
    const {photo} = req.files
    const data ={
        id:randomUUID(),
        wfhLoc,
        imageCapture : photo[0].filename,
        employeeId,
        workTypeId:2
    }
    try{
        if (wfhLoc===""||wfhLoc===undefined){
            return res400(res, {message:"Invalid Data"})
        }
        const result = await attendance.create(data)
        return res200(res,{message:"Attendance Clocked In", data:result})
    }catch (e) {
        return res400(res, {message:"Something wong", error:e})
    }
}

const wfhClockOut = async (req,res)=>{
    const {employeeId} = req.user
    const {id} = req.params
    const {logbook} = req.body
    const data = {
        id,
        logbook,
        employeeId
    }
    try {
        if (id===""||id===undefined||logbook===""||logbook===undefined){
            return res400(res, {message:"Invalid Data"})
        }
        const check = await attendance.checkAttendance(data)
        if (check.length===0) return res400(res, {message:"Attendance Not Found"})
        const result = await attendance.clockOut(data)
        return res200(res, {message:"Attendance Clocked Out", data:result})
    }catch (e) {
        return res400(res, {message:"Something wong", error:e})
    }
}

const getAttendanceByUser = async (req,res)=>{
    const {employeeId} = req.user
    try {
        const result = await attendance.getTodayByUser({employeeId})
        return res200(res, {message:"Get Data Success", data:result})
    }catch (e) {
        return res400(res, {message:"Something wong", error:e})
    }
}

module.exports = {wfoClockIn, wfhClockIn, wfoClockOut, wfhClockOut, getAttendanceByUser}