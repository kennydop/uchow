import { addReview, getAllReviews } from "../controllers/";
import { Router } from "express";

const router = Router();

router.get("/:id", getAllReviews).post("/:id", addReview);

export default router;
