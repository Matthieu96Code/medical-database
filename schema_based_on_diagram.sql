-- create medical database
CREATE DATABASE medical

-- create patients table
CREATE TABLE "patients" (
  "id" INT,
  "name" VARCHAR(60),
  "date_of_birth" DATE,
  PRIMARY KEY ("id")
);

-- create medical_histories table
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

-- create invoice_items table
CREATE TABLE "invoice_items" (
  "id" INT,
  "unit_price" DECIMAL,
  "quantity" INT,
  "total_price" DeCIMAL,
  "invoice_id" INT,
  "treatment_id" INT,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_invoice_items.treatment_id"
    FOREIGN KEY ("treatment_id")
      REFERENCES "treatments"("id"),
  CONSTRAINT "FK_invoice_items.invoice_id"
    FOREIGN KEY ("invoice_id")
      REFERENCES "invoices"("id")
);

CREATE TABLE medical_histories_has_treatments (
    medical_history_id int refrences medical_histories(id),
    treatment_id int refrences treatments(id),
    );
    
CREATE INDEX ON medical_histories (patient_id);
CREATE INDEX ON invoices (medical_history_id);
CREATE INDEX ON invoice_items (invoice_id);
CREATE INDEX ON invoice_items (treatment_id);
CREATE INDEX ON medical_histories_has_treatments (medical_history_id);
CREATE INDEX ON medical_histories_has_treatments (treatment_id);
