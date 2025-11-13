USE little_league_world_series;

INSERT INTO region_types (region_type_name)
VALUES ('International');

INSERT INTO teams (team_name, coach, region_type_id)
VALUES ('Caribbean', NULL, 1),('Japan', NULL, 1);

INSERT INTO players (first_name, last_name, age, primary_position, team_id)
VALUES ('Daytan', 'Biegel', 12, 'LF', 1),('Noriatsu', 'Osaka', 12, '2B', 2);

INSERT INTO games (location, home_team_id, away_team_id, home_score, away_score, total_innings, attendance)
VALUES ('Williamsport', 2, 1, 7, 0, 6, 6120);

INSERT INTO innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (1,1,3,0), (1,2,3,0), (1,3,0,0), (1,4,0,0), (1,5,1,0), (1,6,0,0);
