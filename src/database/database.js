import pg from "pg";
import dotenv from "dotenv";
dotenv.config();

const {Pool} = pg;

export const connection = new Pool({
    connectionString: process.env.DATA_BASE_URL
});