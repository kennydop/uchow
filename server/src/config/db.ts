import { Pool } from "pg";

const db = new Pool({
  user: process.env.PGUSER,
  password: process.env.PGPASSWORD,
  host: process.env.DPGHOST,
  // host: process.env.PGHOST,
  port: 5432,
  database: process.env.PGDATABASE,
});

export default db;
