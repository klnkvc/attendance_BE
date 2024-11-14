const {res400, res200} = require("../../utils/response");
const {role} = require("../../models/teams/role.model");
const {rolePermission} = require("../../models/teams/role-permission.model");
const getRolePermission=async (req,res)=>{
    const {roleId} = req.params
    if (roleId===undefined){
        return res400(res, {message:"Invalid Data"})
    }
    try {
        const [checkRole] = await role.checkRole({id:roleId, name:''})
        if (checkRole===undefined) return res400(res, {message:'Invalid data'})
        let data=[]
        const getModule=await rolePermission.getModule()

        for (const {id, name, categoryId, categoryName} of getModule){
            const [checkPermission]=await rolePermission.getPermission(({roleId:checkRole.id, moduleId:id}))
            const index=data.findIndex((val)=>val.categoryId===categoryId)
            const canCreate=checkPermission===undefined?0:checkPermission.canRead
            const canRead = checkPermission ===undefined ? 0 : checkPermission.canRead
            const canUpdate = checkPermission ===undefined ? 0 : checkPermission.canUpdate
            const canDelete = checkPermission ===undefined ? 0 : checkPermission.canDelete

            if(index===-1){
                data.push({
                    categoryId,
                    categoryName,
                    listModule:[
                        {
                            id,
                            name,
                            canCreate,
                            canRead,
                            canUpdate,
                            canDelete
                        }
                    ]
                })
            }else {
                data[index].listModule.push({
                    id,
                    name,
                    canCreate,
                    canRead,
                    canUpdate,
                    canDelete
                })
            }
        }

        return res200(res,{data})
    }catch (e) {
        return res400(res, {message:"Something wong", error:e})
    }
}

const updateRolePermission=async (req,res)=>{
    const {id:roleId, listModule} =req.body
    const {employeeId} = req.user

    try {
        const [checkRole] = await role.checkRole({id:roleId, name:''})
        if (checkRole===undefined)return res400(res, {message:"Role not exist"})
        for(let i =0; i<listModule.length; i++){
            const [checkPermissionId] = await rolePermission.checkPermissionExist({roleId:checkRole.id, moduleId:listModule[i].id})
            const moduleId = listModule[i].id
            const canCreate = listModule[i].canCreate
            const canRead = listModule[i].canRead
            const canUpdate = listModule[i].canUpdate
            const canDelete = listModule[i].canDelete
            const data={
                roleId:checkRole.id,
                moduleId,
                canCreate,
                canRead,
                canUpdate,
                canDelete,
                employeeId
            }
            if (checkPermissionId === undefined){
                await rolePermission.insert(data)
            }
            if (checkPermissionId !==undefined){
                await rolePermission.update(data)
            }
        }
        return res200(res,{data: "Permission Updated"})
    }catch (e) {
        return res400(res, {message:"Something wong"})
    }
}

module.exports = {getRolePermission, updateRolePermission}