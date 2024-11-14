const {dateTimeValue} = require("../../utils/tools");
const {query} = require("../../utils/query-func");
const teams = {
    checkUserExist:async (data)=>{
        const {id, email, phoneNumber, username}=data
        try{
            return await query(
                `SELECT id, name FROM users WHERE email=? OR phone_number=? OR id=? OR username=?`,
                [email, phoneNumber, id, username]
            )
        }catch (e) {
            throw e
        }
    },
    getAll:async ()=>{
        try{
            return await query(
                `select id, name, username, email, phone_number as phoneNumber, is_active as isActive, gender_id as genderId, role_id as roleId, work_location_id as workLocationId FROM users WHERE is_delete=0 ORDER BY username`
            )
        }catch (e) {
            throw e
        }
    },
    create:async (data)=>{
        // TODO USERNAME CASE SENSITIVE?
        const {id, name, username, email, phoneNumber, password, genderId, roleId, employeeId, workLocationId} = data
        try {
            return await query(
                `INSERT INTO users(id, name, username, email, phone_number, password, is_active, is_delete, created_by, created_at, updated_by, updated_at, role_id, gender_id, work_location_id) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)`,
                [id, name, username, email, phoneNumber, password, 1, 0, employeeId, dateTimeValue(), employeeId, dateTimeValue(), roleId, genderId, workLocationId]
            )
        }catch (e) {
            throw e
        }
    },
    update:async (data)=>{
        const {id, name, email, phoneNumber, roleId, employeeId, activeValue, genderId, workLocationId} = data
        try {
            return await query(
                `UPDATE users set name=?, email=?, phone_number=?, is_active=?, updated_by=?, updated_at=?, role_id=?, gender_id=?, work_location_id=? WHERE id=?`,
                [name, email, phoneNumber, activeValue, employeeId, dateTimeValue(), roleId, genderId, workLocationId, id]
            )
        }catch (e) {
            throw e
        }
    },
    delete:async (data)=>{
        const {id, employeeId} = data
        try {
            return await query(
                `UPDATE users SET is_delete=?, updated_by=?, updated_at=? WHERE id=?`,
                [1, employeeId, dateTimeValue(), id]
            )
        }catch (e) {
            throw e
        }
    },
    getRole:async (data)=>{
        const {id} = data
        try{
            return await query('SELECT id,name FROM roles WHERE id=? AND is_delete=0', [id])
        }catch (e) {
            throw e
        }
    },
    getGender:async ()=>{
        try {
            return await query('SELECT id, name FROM gender')
        }catch (e) {
            throw e
        }
    },
    getWorkLocation:async ()=>{
        try {
            return await query('SELECT id, name FROM work_location')
        }catch (e) {
            throw e
        }
    },
    userWorkLocation:async (data)=>{
        const {employeeId}=data
        try {
            return await query('SELECT u.id, wl.id, wl.name FROM users u LEFT JOIN work_location wl on wl.id = u.work_location_id WHERE u.id=?', [employeeId])
        }catch (e) {
            throw e
        }
    },
}

module.exports = {teams}