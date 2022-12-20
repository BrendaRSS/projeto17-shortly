import { Router } from "express";
import {postUrl} from "../controllers/urlsControllers.js"

const router = Router();

router.post("/urls/shorten", postUrl)

export default router;