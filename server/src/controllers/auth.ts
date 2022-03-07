import { Request, Response } from "express";
import { GoogleSignInAccount } from "../interfaces";
import db from "../config/db";
import {
  COOKIE_OPTIONS,
  getRefreshToken,
  getToken,
  serverError,
} from "../helpers";
import { QueryResultRow } from "pg";

export const googleLogin = async (
  req: Request,
  res: Response
): Promise<Response> => {
  const account: GoogleSignInAccount = req.body;
  try {
    var user: QueryResultRow = await db
      .query("SELECT * FROM users WHERE email=$1", [account.email])
      .then((payload) => {
        return payload.rows[0];
      })
      .catch((error) => {
        throw new Error(error);
      });
    console.log("::::::::::::::::::::::user:", user);
    if (!user) {
      user = await db
        .query(
          "INSERT INTO users(name, email, image, provider, created_at, modified_at) VALUES($1, $2, $3, 'google', current_timestamp, current_timestamp) RETURNING *",
          [account.displayName, account.email, account.photoUrl]
        )
        .then((payload) => {
          return payload.rows[0];
        })
        .catch((error) => {
          throw new Error(error);
        });
    }
    const token: String = getToken(user);
    const refreshToken: String = getRefreshToken(user);
    res.cookie("refreshToken", refreshToken, COOKIE_OPTIONS);
    return res.status(200).json({ token: token, ...user });
  } catch (error) {
    const { status, ...rest } = serverError(error);
    return res.status(status).json(rest);
  }
};
