import {Router} from "express";
import {validationSignUp} from "../middlewares/validationSignUpMiddleware.js";
import {validationSignIn} from "../middlewares/validationSignInMiddleware.js";
import {postSignUp, postSignIn} from "../controllers/authControllers.js";

const router = Router();

router.post("/signUp", validationSignUp, postSignUp);

router.post("/signIn", validationSignIn, postSignIn);

export default router;