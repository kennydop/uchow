import { Request, Response } from "express";
import db from "../config/db";
import bcrypt from "bcrypt";
import { GoogleSignInAccount, User } from "../interfaces";
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
    const results = refactorUserData(user);
    const token: String = getToken(user);
    const refreshToken: String = getRefreshToken(results);
    res.cookie("refreshToken", refreshToken, COOKIE_OPTIONS);
    return res.status(200).json({ token: token, ...results });
  } catch (error) {
    const { status, ...rest } = serverError(error);
    return res.status(status).json(rest);
  }
};

export const emailSignUp = async (
  req: Request,
  res: Response
): Promise<Response> => {
  console.log("::::::::::body:", req.body);
  const { email, name, password } = req.body;
  const saltRounds = 12;
  try {
    const hash = bcrypt.hash(password, saltRounds, async (error, hash) => {
      if (error) {
        throw new Error(error.message);
      }
      return hash;
    });
    const user = await db
      .query(
        "INSERT INTO users(name, email, password, provider, created_at, modified_at) VALUES ($1, $2, $3, $4, current_timestamp, current_timestamp) RETURNING *",
        [name, email, hash, "email"]
      )
      .then((payload) => {
        console.log(payload.rows[0]);
        return payload.rows[0];
      })
      .catch((error) => {
        throw new Error(error);
      });
    const results = refactorUserData(user);
    const token: String = getToken(results);
    const refreshToken: String = getRefreshToken(results);
    res.cookie("refreshToken", refreshToken, COOKIE_OPTIONS);
    return res.status(200).json({ token: token, ...results });
  } catch (error) {
    console.log(error);
    const { status, ...rest } = serverError(error);
    return res.status(status).json(rest);
  }
};

const refactorUserData = (user: QueryResultRow) => {
  console.log(user);
  const {
    password,
    provider,
    favorites,
    payment_methods,
    created_at,
    modified_at,
    ...other
  } = user as User;
  return other;
};
