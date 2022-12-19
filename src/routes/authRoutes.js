import {Router} from "express";
import {validationSignUp} from "../middlewares/validationSignUpMiddleware.js"
import {postSignUp} from "../controllers/authControllers.js"

const router = Router();

router.post("/signUp", validationSignUp, postSignUp);

// router.post("/signIn", postSignIn);

export default router;