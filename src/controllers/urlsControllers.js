import { connection } from "../database/database.js";
import { customAlphabet } from 'nanoid'
const nanoid = customAlphabet('1234567890abcdef', 5)

export async function postUrl(req, res){
    const bodyUrl = req.bodyUrl;
    const userToken = res.locals.userToken;
    const visitCount = 0;
    const shortUlr = nanoid()
  
    try{
        await connection.query(`INSERT INTO urls ("url", "shortUrl", "visitCount") VALUES ($1, $2, $3)`,
        [bodyUrl.url, shortUlr, visitCount])

       const idUrl = await connection.query(`SELECT * FROM urls WHERE "shortUrl" = $1;`,
        [shortUlr]);

        await connection.query(`INSERT INTO urls_and_users ("urlId", "userId") VALUES ($1, $2)`,
        [idUrl.rows[0].id, userToken.id]);
        return res.status(201).send({"shortUrl": shortUlr});
    }catch(error){
        console.log(error);
        return res.sendStatus(500);
    }
}

export async function getUrlsId(req, res){
    const {id} = req.params;

    try{
        const urlExist = await connection.query(`SELECT * FROM urls WHERE id = $1`, [id]);
        if(urlExist.rows.length===0){
            return res.sendStatus(404);
        }
        delete urlExist.rows[0].visitCount;
        return res.status(200).send(urlExist.rows[0]);
    }catch(error){
        console.log(error);
        return res.sendStatus(500);
    }
}

export async function urlOpenShort(req, res){
    const {shortUrl} = req.params;
    if(!shortUrl){
        return res.sendStatus(404);
    }

    try{
        const shorUrlExist = await connection.query(`SELECT * FROM urls WHERE "shortUrl" = $1`,
        [shortUrl]);

        const visitCountAtualization = shorUrlExist.rows[0].visitCount + 1;
        
        await connection.query(`UPDATE urls SET "visitCount" = $1 WHERE "shortUrl" = $2`, 
        [visitCountAtualization, shortUrl]);

        return res.redirect(shorUrlExist.rows[0].url);
    }catch(error){
        console.log(error);
        return res.sendStatus(500);
    }
}

export async function deleteUrlsId(req, res){
    const userToken = res.locals.userToken;
    const {id} =  req.params;

    try{
        const urlExist = await connection.query(`SELECT * FROM urls WHERE id = $1`,
        [id]);
        if(urlExist.rows.length===0){
            return res.status(404).send("url inexistente!");
        }
        
        const pertenceUser = await connection.query(`SELECT * FROM urls_and_users WHERE "urlId" = $1`,
        [urlExist.rows[0].id]);
        
        if(pertenceUser.rows[0].userId!==userToken.id){
            return res.sendStatus(401);
        }

        await connection.query(`DELETE FROM urls_and_users WHERE "urlId" = $1`, [urlExist.rows[0].id]);
        await connection.query(`DELETE FROM urls WHERE id = $1`, [id]);
       
        return res.sendStatus(204);
    }catch(error){
        console.log(error);
        return res.sendStatus(500);
    }
}