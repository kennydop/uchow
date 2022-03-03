import { Router } from "express";
import { addResturant, getAllRetaurants, getARetaurant } from "../controllers";

const router = Router();

router
  .get("/", getAllRetaurants)
  .get("/:id", getARetaurant)
  .post("/", addResturant);

export default router;
