import { CookieOptions } from "express";
import jwt from "jsonwebtoken";
const dev = process.env.NODE_ENV !== "production";

export const COOKIE_OPTIONS: CookieOptions = {
  httpOnly: true,
  // Since localhost is not having https protocol,
  // secure cookies do not work correctly (in postman)
  secure: !dev,
  signed: true,
  maxAge: 60 * 60 * 24 * 30 * 1000,
  sameSite: "none",
};

export const getToken = (payload: Object) => {
  return jwt.sign(payload, process.env.JWT_SECRET!, {
    expiresIn: eval(process.env.SESSION_EXPIRY!),
  });
};

export const getRefreshToken = (payload: Object) => {
  return jwt.sign(payload, process.env.REFRESH_TOKEN_SECRET!, {
    expiresIn: eval(process.env.REFRESH_TOKEN_EXPIRY!),
  });
};

export const verifyToken = (token: string) => {
  return jwt.verify(token, process.env.REFRESH_TOKEN_SECRET!) as jwt.JwtPayload;
};
