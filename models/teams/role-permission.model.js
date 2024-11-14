const {dateTimeValue} = require("../../utils/tools");
const {moduleQuery, query} = require("../../utils/query-func");
const rolePermission={
    getModule:async ()=>{
        try{
            return await moduleQuery('SELECT m.id, m.name, cm.id AS categoryId, cm.name AS categoryName FROM modules m LEFT JOIN attendance_module.category_modules cm ON cm.id = m.category_id ORDER BY cm.order, m.order')
        }catch (e) {
            throw e
        }
    },
    getPermission:async (data) =>{
        const {roleId, moduleId} = data
        try {
            return await query('SELECT id, can_create AS canCreate, can_read AS canRead, can_update AS canUpdate, can_delete AS canDelete FROM permissions WHERE role_id =? AND module_id=?', [roleId, moduleId])
        }catch (e) {
            throw e
        }
    },
    checkPermissionExist:async (data)=>{
        const {roleId, moduleId} = data
        try {
            return await query('SELECT id FROM permissions WHERE role_id=? AND module_id=?', [roleId, moduleId])
        }catch (e) {
            throw e
        }
    },
    insert:async (data)=>{
        const {roleId, moduleId, canCreate, canRead, canUpdate, canDelete, employeeId} = data
        try {
            return await query(
                'INSERT INTO permissions(can_read, can_create, can_update, can_delete, created_by, created_at, updated_by, updated_at, role_id, module_id) VALUES (?,?,?,?,?,?,?,?,?,?)',
                [canRead, canCreate, canUpdate, canDelete, employeeId, dateTimeValue(), employeeId, dateTimeValue(), roleId, moduleId])
        }catch (e) {
            throw e
        }
    },
    update:async (data)=>{
        const {roleId, moduleId, canCreate, canRead, canUpdate, canDelete, employeeId} = data
        try {
            return await query(
                'UPDATE permissions SET can_read=?, can_create=?, can_delete=?, can_update=?, updated_by=?, updated_at=? WHERE role_id=? AND module_id=?',
                [canRead, canCreate, canDelete, canUpdate, employeeId, dateTimeValue(), roleId, moduleId])
        }catch (e) {
            throw e
        }
    }
}

module.exports = {rolePermission}