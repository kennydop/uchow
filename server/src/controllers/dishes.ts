import { Request, Response } from "express";
import { QueryResultRow } from "pg";
import db from "../config/db";
import { serverError } from "../helpers";

export const getAllDishes = async (
  req: Request,
  res: Response
): Promise<Response> => {
  try {
    const dishes: QueryResultRow = await db
      .query("SELECT * FROM dishes")
      .then((payload) => {
        return payload.rows;
      })
      .catch((error) => {
        throw new Error(error);
      });
    return res.status(200).json(dishes);
  } catch (error) {
    const { status, ...rest } = serverError(error);
    return res.status(status).json(rest);
  }
};

export const getDish = async (
  req: Request,
  res: Response
): Promise<Response> => {
  try {
    const dishes: QueryResultRow = await db
      .query("SELECT * FROM dishes WHERE id=$1", [req.params.id])
      .then((payload) => {
        return payload.rows[0];
      })
      .catch((error) => {
        throw new Error(error);
      });
    return res.status(200).json(dishes);
  } catch (error) {
    const { status, ...rest } = serverError(error);
    return res.status(status).json(rest);
  }
};

export const addDish = async (
  req: Request,
  res: Response
): Promise<Response> => {
  const { restaurant_id, name, price, toppings, image, description } = req.body;
  try {
    const newDish: QueryResultRow = await db
      .query(
        "INSERT INTO dishes(restaurant_id, name, price, toppings, image, description) VALUES($1, $2, $3, $4, $5, $6) RETURNING *",
        [restaurant_id, name, price, toppings, image, description]
      )
      .then((payload) => {
        return payload.rows[0];
      })
      .catch((error) => {
        throw new Error(error);
      });
    return res.status(200).json(newDish);
  } catch (error) {
    const { status, ...rest } = serverError(error);
    return res.status(status).json(rest);
  }
};

export const getPopularDishes = async (
  req: Request,
  res: Response
): Promise<Response> => {
  try {
    const popular: QueryResultRow = await db
      .query(
        "SELECT dishes.id, dishes.restaurant_id AS restaurantID, dishes.name, dishes.price, dishes.toppings, dishes.image, dishes.description, dishes.purchases, restaurants.name AS restaurantName, restaurants.location AS restaurantLocation FROM dishes JOIN restaurants ON restaurant_id=restaurants.id WHERE restaurants.college=$1 ORDER BY dishes.purchases DESC",
        [req.params.uni]
      )
      .then((payload) => {
        return payload.rows;
      })
      .catch((error) => {
        throw new Error(error);
      });
    console.log(popular);
    return res.status(200).json(popular);
  } catch (error) {
    const { status, ...rest } = serverError(error);
    return res.status(status).json(rest);
  }
};
