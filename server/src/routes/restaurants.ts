import { Router } from "express";
import { addResturant, getAllRetaurants } from "../controllers";

const router = Router();

router.get("/", getAllRetaurants).post("/", addResturant);

export default router;
