DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE medical_center
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    address TEXT NOT NULL,
    city TEXT NOT NULL,
    state TEXT NOT NULL
);

CREATE TABLE doctor 
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL, 
    med_center_id INTEGER REFERENCES medical_center ON DELETE CASCADE 
);

CREATE TABLE disease
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE patient
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    doctor_id INTEGER REFERENCES doctor ON DELETE SET NULL,
    disease_id INTEGER REFERENCES disease ON DELETE SET NULL
);


INSERT INTO medical_center (name, address, city, state)
VALUES ('Stanford Medical', '911 Hospital Street', 'Palo Alto', 'CA');

INSERT INTO doctor (first_name, last_name, med_center_id)
VALUES ('Doctor', 'Help', 1);

INSERT INTO disease (name, description)
VALUES ('COVID-19', 'shortness of breath, chills, headaches');

INSERT INTO patient (first_name, last_name, doctor_id, disease_id)
VALUES 
('John', 'Doe', 1, 1);
