import { Request, Response } from "express";
import { serverError } from "../helpers";
import db from "../config/db";

export const addFavorite = async (
  req: Request,
  res: Response
): Promise<Response> => {
  try {
    const newFavorite = await db
      .query(
        "UPDATE users SET favorites = ARRAY_APPEND(favorites, $1) WHERE id=$2 RETURNING *",
        [req.body.dish_id, req.params.id]
      )
      .then((payload) => {
        return payload.rows;
      })
      .catch((error) => {
        throw new Error(error);
      });
    return res.status(200).json(newFavorite);
  } catch (error) {
    const { status, ...rest } = serverError(error);
    return res.status(status).json(rest);
  }
};

export const getUserFavorites = async (
  req: Request,
  res: Response
): Promise<Response> => {
  try {
    var favorites: Array<Object> = [];
    const favoritesID: Array<number> = await db
      .query("SELECT favorites FROM users WHERE id=$1", [req.params.id])
      .then((payload) => {
        return payload.rows[0].favorites;
      })
      .catch((error) => {
        throw new Error(error);
      });

    await favoritesID.forEach((id) => {
      db.query("SELECT * FROM dishes WHERE id=$1", [id]).then((payload) => {
        favorites.push(payload.rows);
      });
    });

    return res.status(200).json(favorites);
  } catch (error) {
    const { status, ...rest } = serverError(error);
    return res.status(status).json(rest);
  }
};
