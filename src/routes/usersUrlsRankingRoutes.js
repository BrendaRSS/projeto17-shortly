import { Router } from "express";
import {urlsUser, getRanking} from "../controllers/usersUrlsRankingControllers.js"
import {validationToken} from "../middlewares/validationTokenMiddleware.js";

const router = Router();

router.get("/users/me", validationToken, urlsUser);

router.get("/ranking", getRanking);

export default router;