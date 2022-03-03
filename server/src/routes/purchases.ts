import { recordPurchase, getUserPurchases } from "../controllers/purchases";
import { Router } from "express";

const router = Router();

router.get("/:id", getUserPurchases).post("/:id", recordPurchase);

export default router;
