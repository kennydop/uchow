import { Router } from "express";
import {
  addDish,
  getDish,
  getAllDishes,
  getPopularDishes,
} from "../controllers";

const router = Router();

router
  .get("/", getAllDishes)
  .get("/:id", getDish)
  .get("/popular/:uni", getPopularDishes)
  .post("/", addDish);
export default router;
