const {query} = require("../../utils/query-func");
const {dateTimeValue, dateValue} = require("../../utils/tools");
const leave = {
    getLeaveType:async ()=>{
        try {
            return await query('SELECT id, name FROM leave_type')
        }catch (e) {
            throw e
        }
    },
    create:async (data)=>{
        const {id, destinationCity='', destinationAddress='', startDate, workDate, evidence=null, desc='', employeeId, leaveTypeId}=data
        try {
            return await query("INSERT INTO `leave`(id, destination_city, destination_address, start_date, work_date, evidence, `desc`, approval, created_by, created_at, updated_by, updated_at, user_id, leave_type_id) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
                [id, destinationCity, destinationAddress, startDate, workDate, evidence, desc, 0, employeeId, dateTimeValue(), employeeId, dateTimeValue(), employeeId, leaveTypeId])
        }catch (e) {
            throw e
        }
    },
    UserLeaveHistory:async (data)=>{
        const {employeeId, month, year}=data
        try {
            return await query("SELECT id, destination_city AS destinationCity, destination_address AS destinationAddress, DATE_FORMAT(start_date, '%W, %d-%m-%Y') AS startDate, start_date AS sort, DATE_FORMAT(work_date, '%W, %d-%m-%Y') AS workDate, approval, DATE_FORMAT(created_at, '%W, %d-%m-%Y')  AS requestDate FROM `leave` WHERE leave_type_id = 1 AND ((MONTH(created_at) = ? AND YEAR(created_at) = ?) OR (MONTH(start_date) = ? AND YEAR(start_date) = ?) OR (MONTH(work_date) = ? AND YEAR(work_date) = ?)) AND user_id=? ORDER BY sort DESC;",
                [month, year, month, year, month, year, employeeId])
        }catch (e) {
            throw e
        }
    },
    UserSickHistory:async (data)=>{
        const {employeeId, month, year}=data
        try {
            return await query("SELECT id, `desc`, evidence, DATE_FORMAT(start_date, '%W, %d-%m-%Y') AS startDate, start_date AS sort, DATE_FORMAT(work_date, '%W, %d-%m-%Y') AS workDate, approval, DATE_FORMAT(created_at, '%W, %d-%m-%Y')  AS requestDate FROM `leave` WHERE leave_type_id = 2 AND ((MONTH(created_at) = ? AND YEAR(created_at) = ?) OR (MONTH(start_date) = ? AND YEAR(start_date) = ?) OR (MONTH(work_date) = ? AND YEAR(work_date) = ?)) AND user_id=? ORDER BY sort DESC;",
                [month, year, month, year, month, year, employeeId])
        }catch (e) {
            throw e
        }
    },
    AllLeave : async (data)=>{
        const {month, year}=data
        try{
            return await query("SELECT `leave`.id, u.name, u.phone_number AS phoneNumber, destination_city AS destinationCity, destination_address AS destinationAddress, DATE_FORMAT(start_date, '%W, %d-%m-%Y') AS startDate, DATE_FORMAT(work_date, '%W, %d-%m-%Y') AS workDate, approval, DATE_FORMAT(`leave`.created_at, '%W, %d-%m-%Y')  AS requestDate FROM `leave` LEFT JOIN attendance_lite_management.users u on u.id = `leave`.user_id WHERE leave_type_id = 1 AND ((MONTH(`leave`.created_at) = ? AND YEAR(`leave`.created_at) = ?) OR (MONTH(start_date) = ? AND YEAR(start_date) = ?) OR (MONTH(work_date) = ? AND YEAR(work_date) = ?))ORDER BY start_date DESC;",
                [month, year, month, year, month, year])
        }catch (e) {
            throw e
        }
    },
    AllSick : async (data)=>{
        const {month, year}=data
        try{
            return await query("SELECT `leave`.id, u.name, u.phone_number AS phoneNumber, `desc`, evidence, DATE_FORMAT(start_date, '%W, %d-%m-%Y') AS startDate, DATE_FORMAT(work_date, '%W, %d-%m-%Y') AS workDate, approval, DATE_FORMAT(`leave`.created_at, '%W, %d-%m-%Y')  AS requestDate FROM `leave` LEFT JOIN attendance_lite_management.users u on u.id = `leave`.user_id WHERE leave_type_id = 2 AND ((MONTH(`leave`.created_at) = ? AND YEAR(`leave`.created_at) = ?) OR (MONTH(start_date) = ? AND YEAR(start_date) = ?) OR (MONTH(work_date) = ? AND YEAR(work_date) = ?))ORDER BY start_date DESC",
                [month, year, month, year, month, year])
        }catch (e) {
            throw e
        }
    },
    approval:async (data)=>{
        const {employeeId, id, approval}=data
        try {
            return await query("UPDATE `leave` SET approval = ?, updated_at=?, updated_by=? WHERE id = ?",
                [approval, dateTimeValue(), employeeId, id])
        }catch (e) {
            throw e
        }
    },
    checkDate:async(data)=>{
        const {employeeId} = data
        try {
            return await query("SELECT 1 FROM `leave` WHERE user_id = ? AND ? >= start_date AND ? < work_date AND approval = ? LIMIT 1", [employeeId,dateValue(), dateValue(),2])
        }catch (e) {
            throw e
        }
    }
}

module.exports = {leave}