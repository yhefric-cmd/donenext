
CREATE TABLE IF NOT EXISTS "users" (
  "id" serial PRIMARY KEY,
  "full_name" varchar(255),
  "email" varchar(255) NOT NULL UNIQUE,
  "phone" varchar(20) UNIQUE,
  "password_hash" text NOT NULL,
  "department_id" int4 REFERENCES "departments"("id"),
  "municipality_id" int4 REFERENCES "municipalities"("id"),
  "created_at" timestamp NOT NULL DEFAULT now()
);
