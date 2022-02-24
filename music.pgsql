-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artist
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE album
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE producer
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE song
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album_id INTEGER REFERENCES album ON DELETE CASCADE
);

CREATE TABLE song_artist
(
  song_id INTEGER REFERENCES song ON DELETE SET NULL,
  artist_id INTEGER REFERENCES artist ON DELETE SET NULL
);

CREATE TABLE song_producer
(
  song_id INTEGER REFERENCES song ON DELETE SET NULL,
  producer_id INTEGER REFERENCES producer ON DELETE SET NULL
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


INSERT INTO song
  (title, duration_in_seconds, release_date, album_id)
VALUES
  ('MMMBop', 238, '04-15-1997', 1),
  ('Bohemian Rhapsody', 355, '10-31-1975', 2),
  ('One Sweet Day', 282, '11-14-1995', 3),
  ('Shallow', 216, '09-27-2018', 4),
  ('New York State of Mind', 276, '10-20-2009', 6),
  ('Dark Horse', 215, '12-17-2013' ,7),
  ('Moves Like Jagger', 201, '06-21-2011', 8),
  ('Complicated', 244, '05-14-2002', 9),
  ('Say My Name', 240, '11-07-1999', 10);


-- INSERT INTO song_artist
--   (song_id, artist_id)
-- VALUES



-- INSERT INTO song_producer
--   (song_id, producer_id)
-- VALUES