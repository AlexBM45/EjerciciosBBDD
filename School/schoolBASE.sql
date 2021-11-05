CREATE TABLE "student" (
  "id" SERIAL PRIMARY KEY,
  "firstname" varchar NOT NULL,
  "lastname" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "address_id" int,
  "curp" varchar UNIQUE NOT NULL,
  "birth" date,
  "ins_id" int
);

CREATE TABLE "subject" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar NOT NULL,
  "hrs" numeric NOT NULL,
  "min_score" numeric NOT NULL,
  "teacher_id" int
);

CREATE TABLE "employee" (
  "id" SERIAL PRIMARY KEY,
  "firstname" varchar NOT NULL,
  "lastname" varchar NOT NULL,
  "address_id" int,
  "email" varchar UNIQUE NOT NULL,
  "position" varchar
);

CREATE TABLE "address" (
  "id" SERIAL PRIMARY KEY,
  "street" varchar,
  "number" int,
  "subsurb" varchar,
  "town" varchar,
  "state" varchar
);

CREATE TABLE "inscription" (
  "id" SERIAL PRIMARY KEY,
  "grade" int,
  "date_ins" date DEFAULT (now()),
  "ins_by" varchar,
  "student_id" int
);

ALTER TABLE "subject" ADD FOREIGN KEY ("teacher_id") REFERENCES "employee" ("id");

ALTER TABLE "address" ADD FOREIGN KEY ("id") REFERENCES "student" ("address_id");

ALTER TABLE "inscription" ADD FOREIGN KEY ("ins_by") REFERENCES "employee" ("id");

ALTER TABLE "inscription" ADD FOREIGN KEY ("student_id") REFERENCES "student" ("id");

ALTER TABLE "inscription" ADD FOREIGN KEY ("id") REFERENCES "student" ("ins_id");

ALTER TABLE "employee" ADD FOREIGN KEY ("address_id") REFERENCES "address" ("id");
