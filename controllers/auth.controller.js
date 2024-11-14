const {res200, res400} = require("../utils/response");
const {auth} = require("../models/auth.model");
const jwt=require('jsonwebtoken')

const validateLogin= async (req,res,next)=>{
    console.log("Validate Login")
    const {username,password} = req.body
    if (username===""||password===""||username===undefined||password===undefined){
        return res400(res,{message:"invalid data"})
    }
    try{
        const [checkByPhone] = await auth.checkByPhone({phoneNumber:username})
        if (checkByPhone){
            req.userCred = checkByPhone
            return next()
        }
        const [checkByEmail] = await auth.checkByEmail({email:username})
        if (checkByEmail){
            req.userCred = checkByEmail
            return next()
        }
        const [checkByUsername] = await auth.checkByUsername({username:username})
        if (checkByUsername){
            req.userCred = checkByUsername
            return next()
        }
        return res400(res, {message:"Wrong email/password"})
    } catch (e) {
        return res400(res, {message:"Something wong"})
    }
}
const login= async (req,res)=>{
    console.log("Login Process")
    const {id, password} = req.userCred
    const {password:passInput} = req.body
    try{
        const checkPass = password===passInput
        if (!checkPass) return res400(res, {message:"invalid username/password"})
        const getUser = await auth.login({id:id})
        if (getUser.length!==0){
            const userData = {
                id:getUser[0].id,
                name:getUser[0].name,
                username:getUser[0].username,
                email:getUser[0].email,
                workLocation:getUser[0].workLocation,
                listModuleAccess:[]
            }
            getUser.map(user=>{
                userData.listModuleAccess.push({
                    moduleId:user.moduleId,
                    moduleName:user.moduleName,
                    canRead:user.canRead,
                    canCreate:user.canCreate,
                    canUpdate:user.canUpdate,
                    canDelete:user.canDelete,
                })
            })
            return jwt.sign(userData, process.env.SECRETKEY, {expiresIn: "2 Days"}, (err,token)=>{
                if(err)throw err
                res200(res,{authorization: `Bearer ${token}`})
            })
        }
    }catch (e) {
        return res400(res, {message:"Something wong", error:e})
    }
}

module.exports = {login,validateLogin}