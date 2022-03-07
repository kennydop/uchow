import { Router } from "express";
import { emailSignUp, googleLogin } from "../controllers";
import { validateUser } from "../validators";
const router = Router();
router
  .post("/signup", validateUser, emailSignUp)
  .post("/signin", validateUser)
  .post("/glogin", googleLogin);
export default router;
