DROP DATABASE IF EXISTS soccer;

CREATE DATABASE soccer;

\c soccer

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams ON DELETE SET NULL
);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE season
(
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    team1_id INTEGER REFERENCES teams ON DELETE SET NULL,
    team2_id INTEGER REFERENCES teams ON DELETE SET NULL,
    referee_id INTEGER REFERENCES referees ON DELETE SET NULL,
    match_date DATE NOT NULL,
    season_id INTEGER REFERENCES season ON DELETE SET NULL
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players ON DELETE SET NULL,
    match_id INTEGER REFERENCES matches ON DELETE SET NULL
); 


INSERT INTO teams (name)
VALUES 
('Liverpool'), 
('Chelsea'), 
('Arsenal');

INSERT INTO players (first_name, last_name, team_id)
VALUES 
('Mohammed', 'Salah', 1),
('Romelu', 'Lukaku', 2),
('Bukayo', 'Saka', 3);

INSERT INTO referees (first_name, last_name)
VALUES ('Mike', 'Dean');

INSERT INTO season (start_date, end_date)
VALUES ('2021-09-12', '2022-05-23');

INSERT INTO matches (team1_id, team2_id, referee_id, match_date, season_id)
VALUES (1, 2, 1, '2021-11-22', 1);


INSERT INTO goals (player_id, match_id)
VALUES (1, 1);