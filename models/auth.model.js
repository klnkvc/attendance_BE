const {query} = require("../utils/query-func");
const auth = {
    // get id by email
    checkByEmail:async (data)=>{
        const {email} = data
        try {
            return await query('select id, password from users where email = ?', [email])
        }catch (e) {
            throw e
        }

    },
    checkByPhone: async (data)=>{
        const {phoneNumber} = data
        try {
            return await query('select id, password from users where phone_number = ?', [phoneNumber])
        }catch (e) {
            throw e
        }
    },
    checkByUsername: async (data)=>{
        const {username} = data
        try {
            return await query('select id, password from users where username = ?', [username])
        }catch (e) {
            throw e
        }
    },
    login:async (data)=>{
        const {id} = data
        try {
            return await query(`select
            u.id, u.name, u.username, u.email, u.phone_number as phoneNumber, u.password,
            r.id as roleId, r.name as roleName,
            wl.id as workLocationId ,wl.name as workLocation,
            m.uuid as moduleId, m.name as moduleName,
            p.can_read as canRead, p.can_create as canCreate, p.can_delete as canDelete, p.can_update as canUpdate
            from users u
                 left join roles r on u.role_id = r.id
                 left join permissions p on r.id = p.role_id
                 left join work_location wl on wl.id = u.work_location_id
                 left join ${process.env.DB_MO}.modules m on p.module_id = m.id
                 left join ${process.env.DB_MO}.category_modules cm on m.category_id = cm.id
            where u.id=?
            order by cm.order asc, m.order asc;`, [id])
        }catch (e) {
            throw e
        }
    },
    resetPassword:async (data)=>{
        const {id, password} = data
        try {
            return await query('update users set password = ? where id=?', [id, password])
        }catch (e) {
            throw e
        }
    }
}

module.exports = {auth}