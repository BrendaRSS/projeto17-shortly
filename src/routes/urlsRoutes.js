import { Router } from "express";
import {
    postUrl, 
    getUrlsId, 
    urlOpenShort, 
    deleteUrlsId
} from "../controllers/urlsControllers.js"
import {validationToken} from "../middlewares/validationTokenMiddleware.js";
import {validationUrls} from "../middlewares/validationUrlsMiddleware.js";

const router = Router();

router.post("/urls/shorten", validationToken, validationUrls, postUrl);

router.get("/urls/:id", getUrlsId);

router.get("/urls/open/:shortUrl", urlOpenShort);

router.delete("/urls/:id", validationToken, deleteUrlsId);

export default router;