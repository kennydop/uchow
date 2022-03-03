import { Router } from "express";
import { addResturant, getAllRetaurants, getRetaurant } from "../controllers";

const router = Router();

router
  .get("/", getAllRetaurants)
  .get("/:id", getRetaurant)
  .post("/", addResturant);

export default router;
