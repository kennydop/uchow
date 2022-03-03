import { addFavorite, getUserFavorites } from "../controllers/favorites";
import { Router } from "express";

const router = Router();

router.get("/:id", getUserFavorites).put("/:id", addFavorite);

export default router;
