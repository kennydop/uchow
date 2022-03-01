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

app.use(express.static("public"));

const corsOptions = {
  origin: '*', 
  credentials:true,
  optionSuccessStatus:200
}
app.use(helmet());
app.use(morgan("common")); // remove before deploying
app.use(cors(corsOptions));

app.get(
  "/",
  async (req: Request, res: Response): Promise<Response> => {
      return res.status(200).send({
          message: "Hello World!",
      });
  }
);

app.get("/employees", async (req: Request, res: Response): Promise<Response> => {
  const results = await db
    .query("SELECT * FROM employees")
    .then((payload) => {
      return payload.rows;
    })
    .catch(() => {
      throw new Error("Query failed");
    });
  res.setHeader("Content-Type", "application/json");
  return res.status(200).send(JSON.stringify(results));
});

try {
  (async () => {
    await db.connect();
    app.listen(process.env.PORT || 5000, (): void => {
      console.log(`Server running on port ${process.env.PORT || 5000}`);
    });
  })();
} catch (error) {
  console.error(`Error occured: ${error}`);
}
