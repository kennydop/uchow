import { NextFunction, Request, Response } from "express";
import db from "../config/db";
import { serverError } from "../helpers";

export const getAllDishes = async (
  req: Request,
  res: Response,
  next: NextFunction
): Promise<Response> => {
  try {
    const dishes = await db
      .query("SELECT * FROM dishes")
      .then((payload) => {
        return payload.rows;
      })
      .catch((error) => {
        console.log(error);
      });
    return res.status(200).json(dishes);
  } catch (error) {
    const { status, ...rest } = serverError(error);
    next(rest);
    return res.status(status).json({ rest });
  }
};
