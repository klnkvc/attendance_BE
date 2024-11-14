const {query} = require("../../utils/query-func");
const {dateTimeValue} = require("../../utils/tools");
const wfh = {
    create: async (data)=>{
        const {id, date, location, employeeId} = data
        try{
            return await query(`INSERT INTO wfh(id, date, location, approval, created_by, created_at, updated_by, updated_at, user_id) VALUES (?,?,?,?,?,?,?,?,?);`,
                [id, date, location, 0, employeeId, dateTimeValue(), employeeId, dateTimeValue(), employeeId])
        }catch (e) {
            throw e
        }
    },
    history:async (data)=>{
        const {employeeId, month, year}=data
        try {
            return await query("SELECT id, DATE_FORMAT(date, '%W, %d-%m-%Y') AS date, date AS sort, location, approval FROM wfh WHERE MONTH(date) = ? AND YEAR(date) = ? AND user_id = ? ORDER BY sort DESC;",
                [month, year, employeeId])
        }catch (e){
            throw e
        }
    },
    allHistory:async (data)=>{
        const {month, year}=data
        try {
            return await query("SELECT wfh.id, u.name, u.phone_number AS phoneNumber, DATE_FORMAT(date, '%W, %d-%m-%Y') AS date, date AS sort, location, approval FROM wfh LEFT JOIN users u on u.id = wfh.user_id WHERE MONTH(date) = ? AND YEAR(date) = ? ORDER BY sort DESC",
                [month, year])
        }catch (e){
            throw e
        }
    },
    approval:async (data)=>{
        const {employeeId, id, approval}=data
        try {
            return await query(`UPDATE wfh SET approval = ?, updated_at=?, updated_by=? WHERE id = ?`, [approval, dateTimeValue(), employeeId, id])
        }catch (e) {
            throw e
        }
    },
    check: async (data)=>{
        const {employeeId}=data
        try {
            // return await query('SELECT id FROM wfh WHERE user_id=? AND date=? AND approval=?', [employeeId,dateTimeValue(),2])
            return await query('SELECT id FROM wfh WHERE user_id=? AND approval=?', [employeeId,2])
        }catch (e){
            throw e
        }
    }
}
module.exports = {wfh}