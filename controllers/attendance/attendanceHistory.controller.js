const {res200, res400} = require("../../utils/response");
const {attendance} = require("../../models/attendance/attendance.model");
const getUserAttendanceHistory = async (req,res)=>{
    const {employeeId} = req.user
    const {month, year} = req.body
    try {
        if (month===""||month===undefined||year===""||year===undefined){
            return res400(res, {message:"Invalid Data"})
        }
        const result = await attendance.getUserHistory({employeeId, month, year})
        return res200(res, {message:"Get Data Success", data:result})
    }catch (e) {
        return res400(res, {message:"Something wong", error:e})
    }
}


module.exports = {getUserAttendanceHistory}