CREATE DATABASE medical

CREATE TABLE "patients" (
  "id" INT,
  "name" VARCHAR(60),
  "date_of_birth" DATE,
  PRIMARY KEY ("id")
);

CREATE TABLE "medical_histories" (
  "id" INT,
  "admitted" TIMESTAMP,
  "patient_id" INT,
  "status" VARCHAR(60),
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_medical_histories.patient_id"
    FOREIGN KEY ("patient_id")
      REFERENCES "patients"("id")
);

-- create treatments table
CREATE TABLE "treatments" (
  "id" INT,
  "type" VARCHAR(60),
  "name" VARCHAR(60),
  PRIMARY KEY ("id")
);

-- create invoices table
CREATE TABLE "invoices" (
  "id" INT,
  "total_amount" DECIMAL,
  "generated_at" TIMESTAMP,
  "payed_at" TIMESTAMP,
  "medical_history_id" INT,
  PRIMARY KEY ("id")
);