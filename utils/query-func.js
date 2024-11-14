const { internalDB, moduleDB } = require("../database");

module.exports = {
    query: async (query, array) => {
        const [value] = await internalDB.query(query, array === undefined ? [] : array); // return value in array
        return value;
    },
    formatQueryBulk: async (query, array) => {
        return internalDB.format(query, array === undefined ? [] : array);
    },
    moduleQuery: async (query, array) => {
        const [value] = await moduleDB.query(query, array === undefined ? [] : array); // return value in array
        return value;
    },
};
