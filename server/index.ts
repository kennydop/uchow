import express, { Application, Request, Response } from "express";
import dotenv from "dotenv";
import helmet from "helmet";
import morgan from "morgan";
import cors from "cors";
import { usersRouter, restaurantsRouter, dishesRouter } from "./src/routes";

if (process.env.NODE_ENV !== "production") {
  // Load environment variables from .env file in non prod environments
  dotenv.config();
}
const app: Application = express();

const corsOptions = {
  origin: "*",

  credentials: true,
  optionSuccessStatus: 200,
};

//middlewares
app.use(express.static("public"));
app.use(express.json());
app.use(helmet());
app.use(morgan("common")); // remove before deploying
app.use(cors(corsOptions));

//routes
app.use("api/users", usersRouter);
app.use("api/restaurants", restaurantsRouter);
app.use("api/dishes", dishesRouter);

//listen
try {
  app.listen(process.env.PORT || 5000, (): void => {
    console.log(`Server running on port ${process.env.PORT || 5000}`);
  });
} catch (error) {
  console.error(`Error occured: ${error}`);
}
