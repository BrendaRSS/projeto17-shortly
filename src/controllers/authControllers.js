import { connection } from "../database/database.js";
import jwt from "jsonwebtoken";
import dotenv from "dotenv";
dotenv.config();

export async function postSignUp(req, res){
    const bodyUser = res.locals.bodyUserHashPassword;
    // console.log(bodyUser);

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

    try{
        const token = jwt.sign({id: userExist.id}, process.env.SECRET_JWT, {expiresIn: 86400});
   
        delete userExist.password
        delete userExist.confirmPassword
        return res.status(200).send({token, userExist});
    }catch(error){
        console.log(error);
        return res.sendStatus(500);
    }
}