import { Router } from "express";
import { getAllDishes } from "../controllers";

const router = Router();

router.get("/", getAllDishes);
export default router;
