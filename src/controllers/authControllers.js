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
    const token = uuidV4();

    console.log(userExist);
    console.log(token);

    try{
        await connection.query(`INSERT INTO sessions (token, "userId") VALUES ($1, $2)`,
        [token, userExist.id]);
   
        delete userExist.password
        delete userExist.confirmPassword
        return res.status(200).send({token, userExist});
    }catch(error){
        console.log(error);
        return res.sendStatus(500);
    }
}