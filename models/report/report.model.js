const {query} = require("../../utils/query-func");
const report = {
    getAll:async (data)=>{
        const {month, year}=data
        try {
            return await query(
                `SELECT
                            u.id,
                            u.name,
                            u.phone_number AS phoneNumber,
                            wl.id AS workLocationId,
                            IFNULL(a.total_attendance, 0) AS totalAttendance,
                            IFNULL(s.total_sick_days, 0) AS totalSickDays,
                            IFNULL(l.total_leave_days, 0) AS totalLeaveDays
                        FROM users u
                                LEFT JOIN ${process.env.DB_MG}.work_location wl on wl.id = u.work_location_id
                                LEFT JOIN (SELECT user_id, COUNT(*) AS total_attendance
                                            FROM attendance
                                            WHERE DATE_FORMAT(date, '%Y-%m') = CONCAT(?, '-', LPAD(?, 2, '0'))
                                            GROUP BY user_id) a ON u.id = a.user_id
                                LEFT JOIN (SELECT user_id, SUM(LEAST(LAST_DAY(CONCAT(?, '-', ?, '-01')), DATE_SUB(work_date, INTERVAL 1 DAY)) - GREATEST(CONCAT(?, '-', ?, '-01'), start_date) + 1) AS total_sick_days
                                            FROM ${process.env.DB_MG}.leave
                                            WHERE approval = 2
                                            AND leave_type_id = 2
                                            AND start_date <= LAST_DAY(CONCAT(?, '-', ?, '-01'))
                                            AND work_date > CONCAT(?, '-', ?, '-01')
                                            GROUP BY user_id) s ON u.id = s.user_id
                                LEFT JOIN (SELECT user_id, SUM(LEAST(LAST_DAY(CONCAT(?, '-', ?, '-01')), DATE_SUB(work_date, INTERVAL 1 DAY)) - GREATEST(CONCAT(?, '-', ?, '-01'), start_date) + 1) AS total_leave_days
                                            FROM ${process.env.DB_MG}.leave
                                            WHERE approval = 2
                                            AND leave_type_id = 1
                                            AND start_date <= LAST_DAY(CONCAT(?, '-', ?, '-01'))
                                            AND work_date > CONCAT(?, '-', ?, '-01')
                                            GROUP BY user_id) l ON u.id = l.user_id`
                ,[year, month, year, month, year, month, year, month, year, month, year, month, year, month, year, month, year, month])
        }catch (e) {
            throw e
        }
    },
    getAttendance:async (data)=>{
        const {userId, month, year}=data
        try{
            return await query(`SELECT
            id,
            DATE_FORMAT(date, '%W, %d-%m-%Y') AS formattedDate,
            clock_in AS clockIn,
            clock_out AS clockOut,
            wfh_loc AS wfhLoc,
            logbook,
            work_type_id AS workTypeId,
            image_capture AS imageCapture
        FROM
            attendance
        WHERE
            MONTH(date) = ?
            AND YEAR(date) = ?
            AND user_id = ?
        ORDER BY
            date ASC`, [month, year, userId])
        }
        catch (e) {
            throw e
        }
    },
    getLeave:async (data)=>{
        const {userId, month, year}=data
        try {
            return await query("SELECT id, destination_city AS destinationCity, destination_address AS destinationAddress, DATE_FORMAT(start_date, '%W, %d-%m-%Y') AS startDate, start_date AS sort, DATE_FORMAT(work_date, '%W, %d-%m-%Y') AS workDate FROM `leave` WHERE leave_type_id = 1 AND approval=2 AND ((MONTH(start_date) = ? AND YEAR(start_date) = ?) OR (MONTH(work_date) = ? AND YEAR(work_date) = ?)) AND user_id=? ORDER BY sort ASC;",
                [month, year, month, year, userId])
        }catch (e) {
            throw e
        }
    },
    getSick:async (data)=>{
        const {userId, month, year}=data
        try {
            return await query("SELECT id, `desc`, evidence, DATE_FORMAT(start_date, '%W, %d-%m-%Y') AS startDate, start_date AS sort, DATE_FORMAT(work_date, '%W, %d-%m-%Y') AS workDate FROM `leave` WHERE leave_type_id = 2 AND approval=2 AND ((MONTH(start_date) = ? AND YEAR(start_date) = ?) OR (MONTH(work_date) = ? AND YEAR(work_date) = ?)) AND user_id=? ORDER BY sort ASC;",
                [month, year, month, year, userId])
        }catch (e) {
            throw e
        }
    },
}

module.exports = {report}