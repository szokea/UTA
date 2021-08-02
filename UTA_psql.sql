CREATE TYPE "products_status" AS ENUM (
  'out_of_stock',
  'in_stock',
  'running_low'
);

CREATE TABLE "kartya_nev" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "desc" varchar
);

CREATE TABLE "Kartya" (
  "kartya_id" SERIAL PRIMARY KEY,
  "tipus" int,
  "serial_num" varchar,
  "uzembe_h" date,
  "gar_vege" date
);

CREATE TABLE "berendezes" (
  "ber_id" int PRIMARY KEY NOT NULL,
  "all" int,
  "szek" varchar,
  "polc" varchar,
  "poz" varchar
);

CREATE TABLE "hely" (
  "id" int,
  "ber_id" int,
  "kartya_id" int,
  "datum" date DEFAULT 'now()',
  "nev" varchar,
  "desc" varchar
);

CREATE TABLE "allomas" (
  "all" SERIAL PRIMARY KEY,
  "all_nev" varchar,
  "szakasz" varchar,
  "fonokseg" varchar
);

ALTER TABLE "Kartya" ADD FOREIGN KEY ("tipus") REFERENCES "kartya_nev" ("id");

ALTER TABLE "berendezes" ADD FOREIGN KEY ("ber_id") REFERENCES "hely" ("ber_id");

ALTER TABLE "hely" ADD FOREIGN KEY ("kartya_id") REFERENCES "Kartya" ("kartya_id");

ALTER TABLE "berendezes" ADD FOREIGN KEY ("all") REFERENCES "allomas" ("all");
