import { NextFunction, Request, Response } from "express";
import db from "../config/db";
import bcrypt from "bcrypt";
import { User } from "../interfaces";
import {
  COOKIE_OPTIONS,
  getRefreshToken,
  getToken,
  serverError,
  verifyToken,
} from "../helpers";
import { QueryResultRow } from "pg";

export const googleLogin = async (
  req: Request,
  res: Response
): Promise<Response> => {
  const { email, name, image } = req.body;
  try {
    var user: QueryResultRow = await db
      .query("SELECT * FROM users WHERE email=$1", [email])
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
          [name, email, image]
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
    const refreshToken: String = await dbAddRefreshToken(user);
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
  const { email, name, password } = req.body;
  const saltRounds = 12;
  try {
    const hash = await bcrypt.hash(password, saltRounds);
    const user: QueryResultRow = await db
      .query(
        "INSERT INTO users(name, email, password, provider, created_at, modified_at) VALUES ($1, $2, $3, $4, current_timestamp, current_timestamp) RETURNING *",
        [name, email, hash, "email"]
      )
      .then((payload) => {
        return payload.rows[0];
      })
      .catch((error) => {
        throw new Error(error);
      });
    const results = refactorUserData(user);
    const token: String = getToken(user);
    const refreshToken: String = await dbAddRefreshToken(user);
    res.cookie("refreshToken", refreshToken, COOKIE_OPTIONS);
    return res.status(200).json({ token: token, ...results });
  } catch (error) {
    const { status, ...rest } = serverError(error);
    return res.status(status).json(rest);
  }
};

export const emailSignIn = async (
  req: Request,
  res: Response
): Promise<Response> => {
  const { email, password } = req.body;
  try {
    const user: QueryResultRow = await db
      .query("SELECT * FROM users WHERE email=$1", [email])
      .then((payload) => {
        return payload.rows[0];
      })
      .catch((error) => {
        throw new Error(error);
      });
    if (user) {
      const matches = await bcrypt.compare(password, user.password);
      if (!matches) {
        throw new Error("Incorrect Password");
      }
      const results = refactorUserData(user);
      const token: String = getToken(user);
      const refreshToken: String = await dbAddRefreshToken(user);
      res.cookie("refreshToken", refreshToken, COOKIE_OPTIONS);
      return res.status(200).json({ token: token, ...results });
    } else {
      throw new Error("Account not found");
    }
  } catch (error) {
    console.log(error);
    const { status, ...rest } = serverError(error);
    return res.status(status).json(rest);
  }
};

export const refreshToken = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const { signedCookies = {} } = req;
  const { refreshToken } = signedCookies;
  if (refreshToken) {
    try {
      const payload = verifyToken(refreshToken);
      const userId = payload.id;
      const user: QueryResultRow = await db
        .query("SELECT * FROM users WHERE id=$1", [userId])
        .then((payload) => {
          return payload.rows[0];
        })
        .catch((error) => {
          throw new Error(error);
        });
      if (user) {
        const refreshTokens: Array<string> = user.refreshTokens;
        const tokenIndex = refreshTokens.findIndex(refreshToken);
        if (tokenIndex == -1) throw new Error("Unauthorized");
        const results = refactorUserData(user);
        const newToken: String = getToken(user);
        const newRefreshToken: String = await dbAddRefreshToken(user);
        res.cookie("refreshToken", newRefreshToken, COOKIE_OPTIONS);
        return res.status(200).json({ token: newToken, ...results });
      } else {
        throw new Error("Account not found");
      }
    } catch (error) {
      const { status, ...rest } = serverError(error);
      res.status(status).json(rest);
      next();
    }
  } else {
    res.status(401).json("Unauthorized");
    next();
  }
};

const refactorUserData = (user: QueryResultRow) => {
  const {
    password,
    provider,
    favorites,
    payment_methods,
    refresh_tokens,
    created_at,
    modified_at,
    ...other
  } = user as User;
  return other;
};

const dbAddRefreshToken = async (payload: any) => {
  const refreshToken: String = getRefreshToken(payload);
  await db.query(
    "UPDATE users SET refresh_tokens = array_append(refresh_tokens, $2) WHERE id=$1",
    [payload.id, refreshToken]
  );
  return refreshToken;
};
