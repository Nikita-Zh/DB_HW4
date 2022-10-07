CREATE TABLE "train" (
  "trainNr" int PRIMARY KEY,
  "length" int
);

CREATE TABLE "station" (
  "id" int PRIMARY KEY,
  "name" text,
  "tracks" int
);

CREATE TABLE "city" (
  "id" int PRIMARY KEY,
  "name" text,
  "region" text
);

CREATE TABLE "connected" (
  "id" int PRIMARY KEY,
  "departure" date,
  "arrival" date,
  "trainNr" int,
  "startStation" int,
  "endStation" int
);

ALTER TABLE "station" ADD FOREIGN KEY ("id") REFERENCES "city" ("id");



ALTER TABLE "connected" ADD FOREIGN KEY ("startStation") REFERENCES "station" ("id");

ALTER TABLE "connected" ADD FOREIGN KEY ("endStation") REFERENCES "station" ("id");

ALTER TABLE "connected" ADD FOREIGN KEY ("trainNr") REFERENCES "train" ("trainNr");
