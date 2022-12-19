import exporess from "express";
import cors from "cors";
import dotenv from "dotenv";
import authRouter from "./routes/authRoutes.js";

const app = exporess();
app.use(cors());
app.use(exporess.json());
app.use(authRouter);

dotenv.config();

const port = process.env.PORT ;
app.listen(port, ()=> console.log(`Server running in port: ${port}`));