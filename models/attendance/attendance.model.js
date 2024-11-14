const {query} = require("../../utils/query-func");
const {timeValue, dateTimeValue, dateValue} = require("../../utils/tools");

const attendance = {
    checkAttendance:async (data)=>{
        const {id} = data
        try{
            return await query('SELECT id FROM attendance WHERE id = ?', [id])
        }catch (e) {
            throw e
        }
    },
    create:async (data)=>{
        const {id, clockOut = null, imageCapture="", wfhLoc="", logbook="", workTypeId, employeeId} = data
        try {
            return await query(`INSERT INTO attendance(id, date, clock_in, clock_out, image_capture, wfh_loc, logbook, created_by, created_at, updated_by, updated_at, user_id, work_type_id) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)`,
                [id, dateValue(), timeValue(), clockOut, imageCapture, wfhLoc, logbook, employeeId, dateTimeValue(), employeeId, dateTimeValue(), employeeId, workTypeId])
        }catch (e){
            throw e
        }
    },
    clockOut:async (data)=>{
        const {id, logbook = "", employeeId} = data
        try {
            return await query(`UPDATE attendance SET clock_out = ?, logbook = ?, updated_by = ?, updated_at = ? WHERE id = ?`,
                [timeValue(), logbook, employeeId, dateTimeValue(), id])
        }catch (e){
            throw e
        }
    },
    getTodayByUser:async (data)=>{
        const {employeeId}=data
        try {
            return await query(`select id, date, clock_in as clockIn, clock_out as clockOut, wfh_loc as wfhLoc, logbook, work_type_id as workTypeId from attendance where date=? AND user_id=?`, [dateValue(), employeeId])
        }catch (e) {
            throw e
        }
    },
    getUserHistory:async (data)=>{
        const {employeeId, month, year}=data
        try {
            return await query(`SELECT 
            id, 
            DATE_FORMAT(date, '%W, %d-%m-%Y') AS formattedDate, 
            clock_in AS clockIn, 
            clock_out AS clockOut, 
            wfh_loc AS wfhLoc, 
            logbook, 
            work_type_id AS workTypeId 
        FROM 
            attendance 
        WHERE 
            MONTH(date) = ? 
            AND YEAR(date) = ? 
            AND user_id = ? 
        ORDER BY 
            date DESC`, [month, year, employeeId])
        }catch (e) {
            throw e
        }
    }
}

module.exports = {attendance}