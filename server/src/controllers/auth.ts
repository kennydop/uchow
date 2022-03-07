import { Request, Response } from "express";
import { GoogleSignInAccount } from "../interfaces";
import db from "../config/db";
import { serverError } from "../helpers";

export const googleLogin = async (
  req: Request,
  res: Response
): Promise<Response> => {
  const account: GoogleSignInAccount = req.body;
  try {
    var user = await db
      .query("SELECT * FROM users WHERE id=$1", [account.id])
      .catch((error) => {
        throw new Error(error);
      });
    if (user === null) {
      user = await db
        .query("INSERT INTO users(displayName, email, photoUrl) RETURNING *", [
          account.displayName,
          account.email,
          account.photoUrl,
        ])
        .catch((error) => {
          throw new Error(error);
        });
    }
    return res.status(200).json(user);
  } catch (error) {
    const { status, ...rest } = serverError(error);
    return res.status(status).json(rest);
  }
};
