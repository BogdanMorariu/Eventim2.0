DROP TABLE IF EXISTS "event";
CREATE TABLE "event" (
  "id" int PRIMARY KEY,
  "name" VARCHAR(250) DEFAULT NULL,
  "location" VARCHAR(250) DEFAULT NULL,
  "startDate" TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'EET'),
  "endDate" TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'EET'), 
  "image" bytea
);
