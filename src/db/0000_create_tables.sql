
CREATE TABLE IF NOT EXISTS "departments" (
	"id"	serial PRIMARY KEY,
	"name"	varchar(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS "municipalities" (
	"id"	serial PRIMARY KEY,
	"name"	varchar(255) NOT NULL,
	"department_id"	int4 NOT NULL
);
