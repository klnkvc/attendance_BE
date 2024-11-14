const {res400, res200} = require("../../utils/response");
const {role} = require("../../models/teams/role.model");
const {randomUUID}=require('crypto')
const validateMiddleware = async (req,res,next)=>{
    const {name} = req.body
    if (name===undefined||name==='') return res400(res, {message:'invalid data'})
    try{
        const result = await role.checkRole({id:'',name})
        if(result===undefined) return res400(res, {message: "invalid data"})
        next()
    }catch (e) {
        return res400(res, {message:"Something wong"})
    }
}
const getAll=async (req,res)=>{
    try {
        const result = await role.getAll()
        return res200(res,result)
    }catch (e) {
        return res400(res, {message:"Couldn't get data", error: e.sqlMessage})
    }
}

const created=async (req,res)=>{
    const {name} = req.body
    const {employeeId} = req.user
    const data = {
        id:randomUUID(),
        name,
        employeeId
    }
    try {
        const isExist = await role.checkRole({id:"",name})
        if (isExist.length!==0) return res400(res, {message:"Role already exist"})
        await role.create(data)
        return res200(res,{message:"Role Created"})
    }catch (e) {
        return res400(res, {message:"Something wong", error:e})
    }

}

const updated=async (req,res) =>{
    const {name} = req.body
    const {id} = req.params
    const {employeeId} = req.user
    if (id===undefined){
        return res400(res, {message:"Invalid Data"})
    }
    try{
        const [checkId] = await role.checkRole({id,name:''})
        if (checkId===undefined) return res400(res, {message:"Role not exist"})
        const checkName = await role.checkRole({id:'',name})
        if (checkName.length!==0) return res400(res, {message:"Name already exist"})
        await role.update({id:checkId.id, name, employeeId})
        return res200(res, {message:"Role Updated"})
    }catch (e) {
        return res400(res, {message:"Something wong"})
    }
}

const deleted=async (req,res)=>{
    const {id}=req.params
    const {employeeId} = req.user
    if (id===undefined){
        return res400(res, {message:"Invalid Data"})
    }
    try {
        const [checkRole] = await role.checkRole({id, name:''})
        if (checkRole===undefined)return res400(res, {message:"Role not exist"})
        await role.delete({id:checkRole.id, employeeId})
        return res200(res, {message:"Role Deleted"})
    }catch (e) {
        return res400(res, {message:"Something wong", error:e})
    }
}

module.exports = {validateMiddleware,getAll,created,updated, deleted}