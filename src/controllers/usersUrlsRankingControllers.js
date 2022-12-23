import { connection } from "../database/database.js";

export async function urlsUser(req, res){
    const userToken = res.locals.userToken;

    try{
       const urlsUserId = await connection.query(`SELECT users.id, users.name, SUM(COALESCE(urls."visitCount", 0)) AS "visitCount" 
        FROM users 
        LEFT JOIN urls_and_users 
            ON users.id = urls_and_users."userId" 
        LEFT JOIN urls 
            ON urls.id = urls_and_users."urlId" 
        WHERE users.id = $1 
        GROUP BY users.id 
        ORDER BY "visitCount";`, 
        [userToken.id]);

        const urlsAllUser = await connection.query(`SELECT urls.* FROM urls 
        LEFT JOIN urls_and_users 
            ON urls.id = urls_and_users."urlId" 
        WHERE urls_and_users."userId" = $1`,
        [userToken.id]);

        const bodyUsersMe = {...urlsUserId.rows[0], shortenedUrls: urlsAllUser.rows}

        return res.status(200).send(bodyUsersMe)
    }catch(error){
        console.log(error);
        return res.sendStatus(500);
    }
}

export async function getRanking(req, res){

    try{
       const ranking = await connection.query(`SELECT users.id, users.name, COUNT(urls.id) AS "linksCount", SUM(COALESCE(urls."visitCount", 0)) AS "visitCount" 
        FROM users  
        LEFT JOIN urls_and_users  
            ON users.id = urls_and_users."userId"  
        LEFT JOIN urls   
            ON urls.id = urls_and_users."urlId"  
        GROUP BY users.id 
        ORDER BY "visitCount" DESC 
        LIMIT 10;`);

        const rankingNotNull = [];
        for(let i=0; i<ranking.rows.length; i++){
            rankingNotNull.push(
                {
                    id:ranking.rows[i].id,
                    name: ranking.rows[i].name,
                    linksCount: ranking.rows[i].linksCount,
                    visitCount: (ranking.rows[i].visitCount==null? "0":ranking.rows[i].visitCount)
                }
            )
        }

        return res.status(200).send(rankingNotNull);
    }catch(error){
        console.log(error);
        return res.sendStatus(500);
    }
}