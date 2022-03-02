import { Router } from "express";
import { getAllDishes } from "src/controllers";

const router = Router();

router.get("/dishes", getAllDishes);
export default router;
