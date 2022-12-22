import { connection } from "../database/database.js";
import {urlSchema} from "../models/schemas.js"

export async function validationUrls(req, res, next){
    const body = req.body;

    const {error} = urlSchema.validate(body, {abortEarly: false});
    if(error){
        const errors = error.details.map((detail)=> detail.message);
        return res.status(422).send(errors);
    }

    req.bodyUrl = body;
    next();
}