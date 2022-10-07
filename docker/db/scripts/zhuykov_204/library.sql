CREATE TABLE "book" (
  "ISBN" int PRIMARY KEY,
  "year" date,
  "name" text,
  "author" text,
  "pages" int
);

CREATE TABLE "publisher" (
  "id" int PRIMARY KEY,
  "address" text,
  "name" text
);

CREATE TABLE "bookCopy" (
  "id" int PRIMARY KEY,
  "ISBN" int
);

CREATE TABLE "category" (
  "id" int PRIMARY KEY,
  "name" text,
  "parentCategory" int references category
);

CREATE TABLE "customer" (
  "id" int PRIMARY KEY,
  "firstname" text,
  "lastname" text,
  "birth" date,
  "address" text
);

CREATE TABLE "rent" (
  "id" int PRIMARY KEY,
  "returnDate" date
);

ALTER TABLE "book" ADD FOREIGN KEY ("ISBN") REFERENCES "publisher" ("id");

ALTER TABLE "bookCopy" ADD FOREIGN KEY ("id") REFERENCES "book" ("ISBN");

CREATE TABLE "book_category" (
  "book_ISBN" int NOT NULL,
  "category_id" int NOT NULL,
  PRIMARY KEY ("book_ISBN", "category_id")
);

ALTER TABLE "book_category" ADD FOREIGN KEY ("book_ISBN") REFERENCES "book" ("ISBN");

ALTER TABLE "book_category" ADD FOREIGN KEY ("category_id") REFERENCES "category" ("id");


ALTER TABLE "bookCopy" ADD FOREIGN KEY ("id") REFERENCES "rent" ("id");

ALTER TABLE "rent" ADD FOREIGN KEY ("id") REFERENCES "customer" ("id");

-- ALTER TABLE "category" ADD FOREIGN KEY ("id") REFERENCES "category" ("parentCategory");
