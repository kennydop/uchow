import { Router } from "express";
import { emailSignIn, emailSignUp, googleLogin } from "../controllers";
import { validateUser } from "../validators";
const router = Router();
router
  .post("/signup", validateUser, emailSignUp)
  .post("/signin", validateUser, emailSignIn)
  .post("/glogin", googleLogin);
export default router;
