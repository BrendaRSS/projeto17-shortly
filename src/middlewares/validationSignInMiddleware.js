import { connection } from "../database/database.js";
import bcrypt from "bcrypt";
import {loginSchema} from "../models/schemas.js";

export async function validationSignIn(req, res, next){
    const body = req.body;

    const {error} = loginSchema.validate(body, {abortEarly: false});
    if(error){
        const errors = error.details.map((detail)=> detail.message);
        return res.status(422).send(errors);
    }

    try{
        const userExist = await connection.query(`SELECT * FROM users WHERE email = $1`, [body.email]);
        if(userExist.rows.length===0){
            return res.sendStatus(401);
        }

        const passwordValidate = bcrypt.compareSync(body.password, userExist.rows[0].password);
        if(!passwordValidate){
            return res.sendStatus(401);
        }

        req.userExist = userExist;
        next();
    }catch(err){
        console.log(err);
        return res.sendStatus(500);
    }
}