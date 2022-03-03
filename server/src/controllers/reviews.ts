import { Request, Response } from "express";
import { serverError } from "../helpers";
import db from "../config/db";
import reviews from "src/routes/reviews";

export const addReview = async (
  req: Request,
  res: Response
): Promise<Response> => {
  const { user_id, rating, message } = req.body;
  try {
    const newReview = await db
      .query(
        "INSERT INTO reviews (user_id, rating, message, dish_id) VALUES ($1, $2, $3, $4) RETURNING *",
        [user_id, rating, message, req.params.id]
      )
      .then((payload) => {
        return payload.rows[0];
      })
      .catch((error) => {
        throw new Error(error);
      });
    return res.status(200).json(newReview);
  } catch (error) {
    const { status, ...rest } = serverError(error);
    return res.status(status).json(rest);
  }
};

export const getAllReviews = async (
  req: Request,
  res: Response
): Promise<Response> => {
  try {
    const reviews = await db
      .query("SELECT * FROM reviews WHERE dish_id=$1", [req.params.id])
      .then((payload) => {
        return payload.rows;
      })
      .catch((error) => {
        throw new Error(error);
      });
    return res.status(200).json(reviews);
  } catch (error) {
    const { status, ...rest } = serverError(error);
    return res.status(status).json(rest);
  }
};
