const {dateTimeValue} = require("../../utils/tools");
const {query} = require("../../utils/query-func");

const role={
    checkRole:async (data)=>{
        const {id, name} = data
        try {
            return await query('SELECT id,name FROM roles WHERE id=? or name=?', [id, name])
        }catch (e) {
            throw e
        }
    },
    checkRoleModule:async (data)=>{
        const {id, name} = data
        try {
            return await query('SELECT id FROM roles WHERE role_id=? or name=?', [id, name])
        }catch (e) {
            throw e
        }
    },
    getAll:async ()=>{
        try {
            return await query('SELECT id, name FROM roles WHERE is_delete=0')
        }catch (e) {
            throw e
        }
    },
    create:async (data)=>{
        const {id, name, employeeId} = data
        try {
            return await query('INSERT INTO roles(id, name, is_delete, created_by, created_at, updated_by, updated_at) VALUES (?,?,?,?,?,?,?)', [id, name, 0, employeeId, dateTimeValue(), employeeId, dateTimeValue()])
        }catch (e) {
            throw e
        }
    },
    update:async (data) =>{
        const {id, name, employeeId}=data
        try {
            return await query('UPDATE roles set name=?,updated_at=?,updated_by=? WHERE id=?', [name, dateTimeValue(), employeeId, id])
        }catch (e) {
            throw e
        }
    },
    delete:async (data)=>{
        const {id, employeeId} = data
        try {
            return await query('UPDATE roles set is_delete=?,updated_at=?,updated_by=? WHERE id=?', [1, dateTimeValue(), employeeId, id])
        }catch (e) {
            throw e
        }
    }
}

module.exports = {role}