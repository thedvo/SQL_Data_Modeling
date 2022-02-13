-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artist
(
  id SERIAL PRIMARY KEY,
  name TEXT 
);

CREATE TABLE album
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE producer
(
  id SERIAL PRIMARY KEY,
  name TEXT 
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artist_id INTEGER REFERENCES artist ON DELETE SET NULL,
  featured_artist_id INTEGER REFERENCES artist ON DELETE SET NULL,
  album_id INTEGER REFERENCES album ON DELETE CASCADE,
  producer1_id INTEGER REFERENCES producer ON DELETE SET NULL,
  producer2_id INTEGER REFERENCES producer ON DELETE SET NULL
);


INSERT INTO artist (name)
VALUES 
('Alicia Keys'),
('Avril Lavigne'),
('Boyz II Men'),
('Christina Aguilera'),
('Destiny''s Child'),
('Hanson'),
('Jay Z'),
('Juicy J'),
('Katy Perry'),
('Mariah Cary'),
('Maroon 5'),
('Nickelback'),
('Queen'),
('Lady Gaga'),
('Bradley Cooper');


INSERT INTO album (name)
VALUES
('Middle of Nowhere'),
('A Night at the Opera'),
('Daydream'),
('A Star is Born'),
('Silver Side Up'),
('The Blueprint 3'),
('Prism'),
('Hands All Over'),
('Let Go'),
('The Writing on the Wall');


INSERT INTO producer (name)
VALUES
('Dust Brothers'),
('Stephen Lironi'),
('Roy Thomas Baker'),
('Walter Afanasieff'),
('Benjamin Rice'),
('Rick Parashar'),
('Al Shux'),
('Max Martin'),
('Cirkut'),
('Shellback'),
('Benny Blanco'),
('The Matrix'),
('Darkchild');


INSERT INTO songs
  (title, duration_in_seconds, release_date, artist_id, featured_artist_id, album_id, producer1_id, producer2_id)
VALUES
  ('MMMBop', 238, '04-15-1997', 6, NULL, 1, 1, 2),
  ('Bohemian Rhapsody', 355, '10-31-1975', 13, NULL, 2, 3, NULL),
  ('One Sweet Day', 282, '11-14-1995', 10, 3, 3, 4, NULL),
  ('Shallow', 216, '09-27-2018', 14, 15, 4, 5, NULL),
  ('New York State of Mind', 276, '10-20-2009', 7, 1, 6, 7, NULL),
  ('Dark Horse', 215, '12-17-2013', 9, 8, 7, 8, 9),
  ('Moves Like Jagger', 201, '06-21-2011', 11, 4, 8, 10, 11),
  ('Complicated', 244, '05-14-2002', 2, NULL, 9, 12, NULL),
  ('Say My Name', 240, '11-07-1999', 5, NULL, 10, 13, NULL);
