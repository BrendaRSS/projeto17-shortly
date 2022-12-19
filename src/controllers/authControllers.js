import { connection } from "../database/database.js";
import {v4 as uuidV4} from "uuid";

export async function postSignUp(req, res){
    const bodyUser = res.locals.bodyUserHashPassword;
    console.log(bodyUser);

    try{
        await connection.query(`INSERT INTO users (name, email, password, "confirmPassword") VALUES ($1, $2, $3, $4)`,
        [bodyUser.name, bodyUser.email, bodyUser.password, bodyUser.confirmPassword]);
        return res.sendStatus(201);
    } catch(error){
        console.log(error);
        return res.sendStatus(500);
    }
   
}

export async function postSignIn(req, res){
    const userExist = req.userExist;
    // const token = uuidV4();
    
    delete userExist.rows[0].password
    delete userExist.rows[0].confirmPassword
    console.log(userExist.rows[0]);
    return res.sendStatus(200);
}