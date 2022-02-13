DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE region
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE location
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    region_id INTEGER REFERENCES region ON DELETE SET NULL
);

CREATE TABLE category
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL 
);

CREATE TABLE post
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    post_text TEXT NOT NULL,
    user_id INTEGER REFERENCES users ON DELETE SET NULL,
    category_id INTEGER REFERENCES category ON DELETE SET NULL,
    region_id INTEGER REFERENCES region ON DELETE SET NULL,
    location_id INTEGER REFERENCES location ON DELETE SET NULL
);


INSERT INTO region (name)
VALUES ('San Francisco Bay Area');

INSERT INTO location (name)
VALUES ('San Francisco');

INSERT INTO users (username, region_id)
VALUES ('coolguy', 1);

INSERT INTO category (name)
VALUES ('furniture');

INSERT INTO post (title, post_text, user_id, category_id, region_id, location_id)
VALUES ('Free couch', 'Come pick up this free couch in SF', 1, 1, 1, 1);