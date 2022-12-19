import { connection } from "../database/database.js";

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

// export async function postSignIn(req, res){

// }