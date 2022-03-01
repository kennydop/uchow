import { Client } from "pg";

const db = new Client({
  password: "root",
  user: "root",
  host: "db",
});

export default db