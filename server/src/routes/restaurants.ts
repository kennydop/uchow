import { Router } from "express";
import { addResturant, getAllRetaurants } from "src/controllers";

const router = Router();

router.get("/restaurants", getAllRetaurants).post("/restaurants", addResturant);

export default router;
