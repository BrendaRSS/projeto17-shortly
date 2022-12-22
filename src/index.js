import exporess from "express";
import cors from "cors";
import dotenv from "dotenv";
import authRouter from "./routes/authRoutes.js";
import urlsRouter from "./routes/urlsRoutes.js";
import usersUrlsRanking from "./routes/usersUrlsRankingRoutes.js"

const app = exporess();
app.use(cors());
app.use(exporess.json());
app.use(authRouter);
app.use(urlsRouter);
app.use(usersUrlsRanking);

dotenv.config();

const port = process.env.PORT ;
app.listen(port, ()=> console.log(`Server running in port: ${port}`));