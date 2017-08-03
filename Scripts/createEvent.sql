DROP TABLE IF EXISTS "event";
CREATE SEQUENCE event_seq START 1;
CREATE TABLE "event" (
  "id" int PRIMARY KEY DEFAULT NEXTVAL('event_seq'),
  "name" VARCHAR(250) DEFAULT NULL,
  "location" VARCHAR(250) DEFAULT NULL,
  "startDate" TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'EET'),
  "endDate" TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'EET'), 
  "image" bytea,
  "category_id" int NOT NULL 
);
ALTER TABLE "event" ADD CONSTRAINT categoryForeignKey FOREIGN KEY(category_id) REFERENCES category(id);
