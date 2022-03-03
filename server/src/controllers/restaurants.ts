import { Request, Response } from "express";
import { serverError } from "../helpers";
import db from "../config/db";

export const getAllRetaurants = async (
  req: Request,
  res: Response
): Promise<Response> => {
  try {
    const restaurants = await db
      .query("SELECT * FROM restaurants")
      .then((payload) => {
        return payload.rows;
      })
      .catch((error) => {
        throw new Error(error);
      });
    return res.status(200).json(restaurants);
  } catch (error) {
    const { status, ...rest } = serverError(error);
    return res.status(status).json(rest);
  }
};

export const getRetaurant = async (
  req: Request,
  res: Response
): Promise<Response> => {
  try {
    const restaurants = await db
      .query("SELECT * FROM restaurants WHERE id=$1", [req.params.id])
      .then((payload) => {
        return payload.rows;
      })
      .catch((error) => {
        throw new Error(error);
      });
    return res.status(200).json(restaurants);
  } catch (error) {
    const { status, ...rest } = serverError(error);
    return res.status(status).json(rest);
  }
};

export const addResturant = async (
  req: Request,
  res: Response
): Promise<Response> => {
  const { name, tel, description, location, image, college } = req.body;
  try {
    const restaurants = await db
      .query(
        "INSERT INTO restaurants(name, tel, description, location, image, college) VALUES($1, $2, $3, $4, $5, $6) RETURNING *",
        [name, tel, description, location, image, college]
      )
      .then((payload) => {
        return payload.rows;
      })
      .catch((error) => {
        throw new Error(error);
      });
    return res.status(200).json(restaurants);
  } catch (error) {
    const { status, ...rest } = serverError(error);
    return res.status(status).json(rest);
  }
};
