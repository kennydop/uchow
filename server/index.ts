import express, { Application } from "express";
import dotenv from "dotenv";
import helmet from "helmet";
import morgan from "morgan";
import cors from "cors";
import cookieParser from "cookie-parser";

import {
  usersRouter,
  restaurantsRouter,
  dishesRouter,
  reviewsRouter,
  purchasesRouter,
  favoritesRouter,
  authRouter,
} from "./src/routes";

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
app.use(cookieParser(process.env.COOKIE_SECRET));
app.use(morgan("common")); // remove before deploying
app.use(cors(corsOptions));

//routes
app.use("/api/users", usersRouter);
app.use("/api/auth", authRouter);
app.use("/api/restaurants", restaurantsRouter);
app.use("/api/dishes", dishesRouter);
app.use("/api/reviews", reviewsRouter);
app.use("/api/purchases", purchasesRouter);
app.use("/api/favorites", favoritesRouter);

//listen
try {
  app.listen(process.env.PORT || 5000, (): void => {
    console.log(`Server running on port ${process.env.PORT || 5000}`);
  });
} catch (error) {
  console.error(`Error occured: ${error}`);
}
