const dayjs = require("dayjs");
const path = require("path");
const dateTimeValue = () => dayjs().format("YYYY-MM-DD H:mm:ss");
const dateValue = () => dayjs().format("YYYY-MM-DD");
const timeValue = () => dayjs().format("H:mm:ss");
const teamsDir = () => path.join(__dirname, "../../images/teams");
const dateConvert = (theString) => dayjs(theString).format("YYYY-MM-DD");
const privateDir =()=>path.join(__dirname, "../images")



module.exports = {
    dateTimeValue,
    dateValue,
    timeValue,
    teamsDir,
    dateConvert,
    privateDir
}