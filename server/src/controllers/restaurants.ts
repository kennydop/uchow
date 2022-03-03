import { NextFunction, Request, Response } from "express";
import { serverError } from "../helpers";
import db from "../config/db";

export const getAllRetaurants = async (
  req: Request,
  res: Response,
  next: NextFunction
): Promise<Response> => {
  try {
    const restaurants = await db
      .query("SELECT * FROM restaurants")
      .then((payload) => {
        return payload.rows;
      })
      .catch((error) => {
        console.log(error);
      });
    return res.status(200).json(restaurants);
  } catch (error) {
    const { status, ...rest } = serverError(error);
    next(rest);
    return res.status(status).json({ rest });
  }
};

export const addResturant = async (
  req: Request,
  res: Response,
  next: NextFunction
): Promise<Response> => {
  const { name, diliveryTime, numberOfDishes, tel, location, avatar } =
    req.body;
  try {
    const restaurants = await db
      .query(
        "INSERT INTO restaurants(name, diliveryTime, numberOfDishes, tel, location, avatar) VALUES($1, $2, $3, $4, $5, $6) RETURNING *",
        [name, diliveryTime, numberOfDishes, tel, location, avatar]
      )
      .catch((error) => {
        console.log(error);
      });
    return res.status(200).json(restaurants);
  } catch (error) {
    const { status, ...rest } = serverError(error);
    next(rest);
    return res.status(status).json({ rest });
  }
};
