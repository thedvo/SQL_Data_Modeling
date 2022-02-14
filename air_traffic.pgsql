-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passenger
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE airline
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE city
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE country
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger_id INTEGER REFERENCES passenger ON DELETE CASCADE,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INTEGER REFERENCES airline ON DELETE SET NULL,
  departure_city_id INTEGER REFERENCES city ON DELETE SET NULL,
  departure_country_id INTEGER REFERENCES country ON DELETE SET NULL,
  arrival_city_id INTEGER REFERENCES city ON DELETE SET NULL,
  arrival_country_id INTEGER REFERENCES country ON DELETE SET NULL
);

INSERT INTO passenger (first_name, last_name)
VALUES 
('Jennifer', 'Finch'), 
('Thadeus', 'Gathercoal'),
('Sonja', 'Pauley'),
('Waneta', 'Skeleton'),
('Berkie', 'Wycliff'),
('Alvin', 'Leathes'),
('Cory', 'Squibbes');


INSERT INTO airline (name)
VALUES
('Air China'),
('American Airlines'),
('Avianca Brazil'),
('British Airways'),
('Delta'),
('TUI Fly Belgium'),
('United');

INSERT INTO city (name)
VALUES
('Beijing'),
('Casablanca'),
('Cedar Rapids'),
('Charlotte'),
('Chicago'),
('Dubai'),
('Las Vegas'),
('London'),
('Los Angeles'),
('Mexico City'),
('New Orleans'),
('New York'),
('Paris'),
('Santiago'),
('Sao Paolo'),
('Seattle'),
('Tokyo'),
('Washington DC');

INSERT INTO country (name)
VALUES
('Brazil'),
('Chile'),
('China'),
('France'),
('Japan'),
('Mexico'),
('Morocco'),
('UAE'),
('United Kingdom'),
('United States');


INSERT INTO tickets
  (passenger_id, seat, departure, arrival, airline_id, departure_city_id, departure_country_id, arrival_city_id, arrival_country_id)
VALUES
  (1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 7, 18, 10 , 16 , 10),
  (2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 4, 17, 5, 8, 9),
  (3, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 5, 9, 10, 7, 10),
  (1, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 5, 16, 10, 10, 6),
  (4, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 6, 13, 4, 2, 7),
  (2, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 1, 6, 8, 1, 3),
  (5, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 7, 12, 10, 4, 10),
  (6, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 2, 3, 10, 5, 10),
  (5, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 2, 4, 10, 11, 10),
  (7, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 3, 15, 1, 14, 2);