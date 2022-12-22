import { connection } from "../database/database.js";
import jwt from "jsonwebtoken";
import dotenv from "dotenv";
dotenv.config();

export async function validationToken(req, res, next){
    const {authorization} = req.headers;
    const token = authorization?.replace("Bearer ", "");

    if(!token){
        return res.sendStatus(401)
    }

    try{
        jwt.verify(token, process.env.SECRET_JWT, async (error, decoded)=>{
            if(error){
                return res.status(401).send("token inválido");
            };

            console.log(decoded);

            const userToken = await connection.query(`SELECT * FROM users WHERE id = $1`,
            [decoded.id]);
            if(userToken.rows.length===0){
                return res.sendStatus(401);
            }
    
            res.locals.userToken = userToken.rows[0];
            next();
        });
    } catch(error){
        console.log(error);
        return res.sendStatus(500)
    }
}