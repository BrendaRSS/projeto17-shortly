import {connection} from "../database/database.js";
import {userSchema} from "../models/schemas.js";
import bcrypt from "bcrypt";

export async function validationSignUp(req, res, next){
    const body= req.body;

    const {error} = userSchema.validate(body, {abortEarly: false});

    if(error){
        const errors = error.details.map((detail)=> detail.message);
        return res.status(422).send(errors)
    }

    const userExist = await connection.query(`SELECT * FROM users WHERE email = $1`, [body.email]);
    if(userExist.rows.length>0){
        return res.sendStatus(409);
    }

    const hashPassword = bcrypt.hashSync(body.password, 10);
    const bodyUserHashPassword = {...body, password: hashPassword, confirmPassword: hashPassword}
    res.locals.bodyUserHashPassword = bodyUserHashPassword;
    next();
}

