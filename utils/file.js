const fs = require("fs");

module.exports = {
  deleteFile: (filePath, next) => {
    fs.unlink(filePath, (err) => {
      if (!filePath && err) {
        next();
      }
    });
  },
};
