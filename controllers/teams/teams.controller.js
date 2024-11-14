const {res400, res200} = require("../../utils/response");
const {teams} = require("../../models/teams/teams.model");
const {randomUUID}=require('crypto')
const validateMiddleware = async (req,res,next)=>{
    const {name, username, email, phoneNumber, password, confPassword, roleId, genderId, workLocationId} = req.body
    if (
        name===undefined||
        username===undefined||
        email===undefined||
        phoneNumber===undefined||
        isNaN(+phoneNumber)||
        genderId===undefined||
        password===undefined||
        confPassword===undefined||
        roleId===undefined||
        workLocationId===undefined
    ) return res400(res, {message: "invalid data"})
    if (password !== confPassword){
        return res400(res, {message: "Password not match"})
    }
    try{
        const [getRole] = await teams.getRole({id:roleId})
        if (getRole===undefined) return res400(res, {message: "invalid data"})
        next()
    }catch (e) {
        return res400(res, {message:"Something wong", error:e})
    }
}
const getAll =async (req,res)=>{
    try{
        const result = await teams.getAll()
        return res200(res, result)
    }catch (e) {
        return res400(res, {message:"Couldn't get data", error: e.sqlMessage})
    }
}
const created=async (req, res)=>{
    const {name, username, email, phoneNumber, password, genderId, roleId, workLocationId} = req.body
    const {employeeId} = req.user
    const data = {
        id:randomUUID(),
        name,
        username,
        email,
        phoneNumber,
        password,
        genderId,
        roleId,
        employeeId,
        workLocationId
    }
    try {
        const isExist=await isUserExist({email, phoneNumber, username})
        if (!!isExist) return res400(res, {message:"User already exist"})
        await teams.create(data)
        return res200(res,{message:"User Created"})
    }catch (e) {
        return res400(res, {message:"Something wong", error:e})
    }
}
const isUserExist =async ({id="", email="", phoneNumber=0, username=""})=>{
    const data = {
        id,
        email,
        phoneNumber,
        username
    }
    try {
        const [checkUser] = await teams.checkUserExist(data)
        return checkUser !== undefined;
    }catch (e) {
        throw e
    }
}

const updated = async (req, res)=>{
    const {name, email, phoneNumber, isActive, genderId, roleId, workLocationId} = req.body
    const {id} = req.params
    const {employeeId} = req.user

    if (id===undefined||""){
        return res400(res, {message:"Invalid Data"})
    }
    const data = {
        id,
        name,
        email,
        phoneNumber,
        employeeId,
        activeValue:!!isActive?1:0,
        genderId,
        roleId,
        workLocationId
    }
    try {
        const isExist = await isUserExist({id:id})
        if (!isExist)res400(res, {message:"User not exist"})
        await teams.update(data)
        return res200(res, {message:"User Updated"})
    } catch (e) {
        return res400(res, {message:"Something wong", error:e})
    }
}
const deleted = async (req, res)=>{
    const {id} = req.params
    const {employeeId} = req.user

    if (id===undefined||""){
        return res400(res, {message:"Invalid Data"})
    }
    try {
        const isExist = await isUserExist({id})
        if (!isExist)res400(res, {message:"User not exist"})
        await teams.delete({id, employeeId})
        return res200(res, {message:"User Deleted"})
    }catch (e) {
        return res400(res, {message:"Something wong"})
    }
}
const getGender=async (req,res)=>{
    try {
        const result = await teams.getGender()
        return res200(res,result)
    }catch (e) {
        return res400(res, {message:"Couldn't get data", error: e.sqlMessage})
    }
}
const getWorkLocation=async (req,res)=>{
    try {
        const result = await teams.getWorkLocation()
        return res200(res,result)
    }catch (e) {
        return res400(res, {message:"Couldn't get data", error: e.sqlMessage})
    }
}
const userWorkLocation = async (req,res)=>{
    const {employeeId} = req.user
    try {
        const result = await teams.userWorkLocation({employeeId})
        return res200(res,{message:"Get Data Success", data:result})
    }catch (e) {
        return res400(res, {message:"Couldn't get data", error: e.sqlMessage})
    }
}
module.exports = {getAll, validateMiddleware, created, updated, deleted, getGender, getWorkLocation,userWorkLocation}