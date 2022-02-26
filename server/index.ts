import express, { Application, Request, Response } from "express";
import dotenv from "dotenv";
import helmet from "helmet";
import morgan from "morgan";
import cors from "cors";

if (process.env.NODE_ENV !== "production") {
  // Load environment variables from .env file in non prod environments
  dotenv.config();
}
const app: Application = express();

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

try {
  app.listen(process.env.PORT || 5000, (): void => {
      console.log(`Server running on port ${process.env.PORT || 5000}`);
  });
} catch (error) {
  console.error(`Error occured: ${error}`);
}
