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
