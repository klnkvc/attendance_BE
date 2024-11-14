const {res400, res200} = require("../../utils/response");
const {randomUUID}=require('crypto')
const {wfh} = require("../../models/attendance/wfh.model");
const {dateConvert} = require("../../utils/tools");
const createWfh = async (req,res)=>{
    const {employeeId} = req.user
    const {date, location} = req.body
    try {
        if (date===""||date===undefined||location===""||location===undefined){
            return res400(res, {message:"Invalid Data"})
        }
        await wfh.create({id:randomUUID(), date:dateConvert(date), location, employeeId})
        return res200(res,{message:"WFH request created"})
    }catch (e) {
        return res400(res, {message:"Something wong", error:e})
    }
}

const historyWfh = async (req,res)=>{
    const {employeeId} = req.user
    const {month, year} = req.body
    try {
        if (month===""||month===undefined||year===""||year===undefined){
            return res400(res, {message:"Invalid Data"})
        }
        const result = await wfh.history({employeeId, month, year})
        return res200(res, {message:"Get Data Success", data:result})
    }catch (e) {
        return res400(res, {message:"Something wong", error:e})
    }
}
const allHistoryWfh = async (req,res)=>{
    const {month, year} = req.body
    try {
        if (month===""||month===undefined||year===""||year===undefined){
            return res400(res, {message:"Invalid Data"})
        }
        const result = await wfh.allHistory({month, year})
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
        if (approval===""||approval===undefined){
            return res400(res, {message:"Invalid Data"})
        }
        await wfh.approval({employeeId,approval,id})
        return res200(res,{message:"WFH approval updated"})
    }catch (e) {
        return res400(res, {message:"Something wong", error:e})
    }
}

const wfhCheck = async (req,res)=>{
    const {employeeId} = req.user
    try {
        const result=await wfh.check({employeeId})
        return res200(res, {message:"Get Data Success", data:result})
    }catch (e) {
        return res400(res, {message:"Something wong", error:e})
    }
}

module.exports = {createWfh, historyWfh, allHistoryWfh, update, wfhCheck}