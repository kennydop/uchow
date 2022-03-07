import { Request, Response } from "express";
import { serverError } from "../helpers";
import db from "../config/db";
import { QueryResultRow } from "pg";

export const getUserPurchases = async (
  req: Request,
  res: Response
): Promise<Response> => {
  try {
    const userPurchases = await db
      .query("SELECT * FROM purchases WHERE user_id=$1", [req.params.id])
      .then((payload) => {
        return payload.rows;
      })
      .catch((error) => {
        throw new Error(error);
      });
    return res.status(200).json(userPurchases);
  } catch (error) {
    const { status, ...rest } = serverError(error);
    return res.status(status).json(rest);
  }
};

export const recordPurchase = async (
  req: Request,
  res: Response
): Promise<Response> => {
  const { user_id, dish_id, restaurant_id, number_ordered, price } = req.body;
  try {
    const newOrder: QueryResultRow = await db
      .query(
        "INSERT INTO purchases(user_id, dish_id, restaurant_id, number_ordered, price) VALUES ($1, $2, $3, $4, $5) RETURNING *",
        [user_id, dish_id, restaurant_id, number_ordered, price]
      )
      .then((payload) => {
        return payload.rows;
      })
      .catch((error) => {
        throw new Error(error);
      });
    return res.status(200).json(newOrder);
  } catch (error) {
    const { status, ...rest } = serverError(error);
    return res.status(status).json(rest);
  }
};
