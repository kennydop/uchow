import { Router } from "express";
import {
  addDish,
  getADish,
  getAllDishes,
  getPopularDishes,
} from "../controllers";

const router = Router();

router
  .get("/", getAllDishes)
  .get("/:id", getADish)
  .get("/popular/:uni", getPopularDishes)
  .post("/", addDish);
export default router;
