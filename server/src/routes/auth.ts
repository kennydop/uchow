import { Router } from "express";
import { googleLogin } from "../controllers";
import { validateUser } from "src/validations";
const router = Router();
router
  .post("/signup", validateUser)
  .post("/signin", validateUser)
  .post("/glogin", googleLogin);
export default router;
