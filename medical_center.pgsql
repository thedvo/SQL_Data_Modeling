DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE center
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE doctor 
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL, 
    center_id INTEGER REFERENCES center ON DELETE CASCADE 
);

CREATE TABLE disease
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE patient
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    doctor_id INTEGER REFERENCES doctor ON DELETE SET NULL,
    disease_id INTEGER REFERENCES disease ON DELETE SET NULL
);


INSERT INTO center (name)
VALUES ('Pokemon Center');

INSERT INTO doctor (first_name, last_name, center_id)
VALUES ('Professor', 'Oak', 1);

INSERT INTO disease (name)
VALUES ('burn');

INSERT INTO patient (first_name, last_name, doctor_id, disease_id)
VALUES 
('Ash', 'Ketchum', 1, 1);
