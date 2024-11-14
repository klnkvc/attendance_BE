const passportJwt = require('passport-jwt')
const JwtStrategy = passportJwt.Strategy
const extractJwt = passportJwt.ExtractJwt
const passport = require('passport')
const {query} = require("../utils/query-func");

passport.use("internal-rule",new JwtStrategy({
    jwtFromRequest: extractJwt.fromAuthHeaderAsBearerToken(),
    secretOrKey: process.env.SECRETKEY,
}, async (payload, done)=>{
    const {id} = payload
    const [getData] =await query(`select id, role_id as roleId from users where id=?`, [id])
    // if (getData){
    //     return done(null, ...getData)
    // } else {
    //     return done(null, false)
    // }
    if (getData === undefined) return done(null, false)
    const user = {
        employeeId: getData.id,
        roleId: getData.roleId
    };
    done(null, user);
}))
