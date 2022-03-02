import express, { Application, Request, Response } from "express";
import dotenv from "dotenv";
import helmet from "helmet";
import morgan from "morgan";
import cors from "cors";
import db from "./src/db";

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

app.use(express.static("public"));
app.use(express.json());
app.use(helmet());
app.use(morgan("common")); // remove before deploying
app.use(cors(corsOptions));

app.get("/", async (req: Request, res: Response): Promise<Response> => {
  return res.status(200).send({
    message: "Hello World!",
  });
});

app.get(
  "/restaurants",
  async (req: Request, res: Response): Promise<Response> => {
    const results = await db
      .query("SELECT * FROM restaurants")
      .then((payload) => {
        return payload.rows;
      })
      .catch((error) => {
        console.log(error);
        return error;
      });
    res.setHeader("Content-Type", "application/json");
    return res.status(200).send(JSON.stringify(results));
  }
);

app.get("/dishes", async (req: Request, res: Response): Promise<Response> => {
  const results = await db
    .query("SELECT * FROM dishes")
    .then((payload) => {
      return payload.rows;
    })
    .catch((error) => {
      console.log(error);
      return error;
    });
  res.setHeader("Content-Type", "application/json");
  return res.status(200).send(JSON.stringify(results));
});

app.post(
  "/restaurants",
  async (req: Request, res: Response): Promise<Response> => {
    const { name, diliveryTime, numberOfDishes, tel, location, avatar } =
      req.body;
    try {
      const data = await db
        .query(
          "INSERT INTO restaurants( name, diliveryTime, numberOfDishes, tel, location, avatar) VALUES($1, $2, $3, $4, $5, $6) RETURNING *",
          [name, diliveryTime, numberOfDishes, tel, location, avatar]
        )
        .catch((error) => {
          console.log(error);
          return error;
        });
      return res.status(200).json(data);
    } catch (error) {
      console.log(error);
      throw new Error("Query failed");
    }
  }
);

try {
  app.listen(process.env.PORT || 5000, (): void => {
    console.log(`Server running on port ${process.env.PORT || 5000}`);
  });
} catch (error) {
  console.error(`Error occured: ${error}`);
}
