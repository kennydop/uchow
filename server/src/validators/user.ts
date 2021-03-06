import { NextFunction, Request, Response } from "express";
import Joi from "joi";
import { LoginDetails } from "../interfaces";
import { serverError } from "../helpers";
const schema = Joi.object({
  name: Joi.string().min(3),
  email: Joi.string()
    .email({
      minDomainSegments: 2,
      tlds: { allow: ["com", "net", "org", "dev", "co", "gov", "io"] },
    })
    .required(),
  password: Joi.string().pattern(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$/),
}).with("email", "password");

export const validateUser = async (
  req: Request,
  res: Response,
  next: NextFunction
): Promise<void> => {
  try {
    const loginDetails: LoginDetails = await schema.validateAsync(req.body);
    next();
  } catch (error) {
    const { status, ...rest } = serverError(error);
    res.status(status).json(rest);
  }
};
