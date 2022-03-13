import { Router } from "express";
import {
  emailSignIn,
  emailSignUp,
  googleLogin,
  refreshToken,
} from "../controllers";
import { validateUser } from "../validators";
const router = Router();
router
  .post("/signup", validateUser, emailSignUp)
  .post("/signin", validateUser, emailSignIn)
  .post("/glogin", googleLogin)
  .put("/refreshtoken", refreshToken);
export default router;
