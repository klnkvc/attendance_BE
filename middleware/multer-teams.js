const multer = require("multer");
const { teamsDir } = require("../utils/tools");

const storage = multer.diskStorage({
    destination: (_, __, cb) => {
        cb(null, teamsDir());
    },
    filename: (_, file, cb) => {
        cb(null, new Date().getTime() + "-" + file.originalname);
    },
});

module.exports = multer({
    storage: storage,
    fileFilter: (_req, file, cb) => {
        if (
            file.mimetype == "image/png" ||
            file.mimetype == "image/jpg" ||
            file.mimetype == "image/jpeg" ||
            file.mimetype == "application/pdf"
        ) {
            cb(null, true);
        } else {
            cb(new Error("Only .pdf, .png, .jpg and .jpeg format allowed!"));
        }
    },
}).fields([
    { name: "cv", maxCount: 1 },
    { name: "photo", maxCount: 1 },
]);
