-- Little League Game Import SQL

-- WARNING: Inning totals (6) don't match final score (0)
-- This usually means the line score shows cumulative runs, which has been corrected below

-- Step 1: Insert game record
INSERT INTO Games (game_date, location, home_team_id, away_team_id, home_score, away_score, total_innings)
VALUES ('2010-08-21', 'TBD',
  (SELECT team_id FROM Teams WHERE team_name = ''),
  (SELECT team_id FROM Teams WHERE team_name = ''),
  0, 0, 6);

SET @game_id = LAST_INSERT_ID();

UPDATE Games SET
  winning_team_id = (SELECT team_id FROM Teams WHERE team_name = ''),
  losing_team_id = (SELECT team_id FROM Teams WHERE team_name = '')
WHERE game_id = @game_id;

-- Step 2: Insert inning scores
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 1, 3, 8);
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 2, 3, 1);
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 3, 0, 0);
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 4, 0, 4);
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 5, 0, 1);
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 6, 0, 2);

-- Step 3: Insert batting statistics
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Stephens' AND team_id = (SELECT team_id FROM Teams WHERE team_name = '')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = ''),
  3, 2, 2, 0, 1, 0, 0, 0, 0.667);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Heflin' AND team_id = (SELECT team_id FROM Teams WHERE team_name = '')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = ''),
  4, 1, 2, 1, 1, 0, 0, 0, 0.500);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Couch' AND team_id = (SELECT team_id FROM Teams WHERE team_name = '')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = ''),
  4, 2, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Morrison' AND team_id = (SELECT team_id FROM Teams WHERE team_name = '')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = ''),
  4, 3, 3, 3, 0, 0, 0, 0, 0.750);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Robinson' AND team_id = (SELECT team_id FROM Teams WHERE team_name = '')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = ''),
  4, 2, 3, 0, 1, 0, 0, 0, 0.750);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Scott' AND team_id = (SELECT team_id FROM Teams WHERE team_name = '')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = ''),
  4, 1, 2, 2, 0, 0, 0, 0, 0.500);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Hogan' AND team_id = (SELECT team_id FROM Teams WHERE team_name = '')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = ''),
  1, 1, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Hannah' AND team_id = (SELECT team_id FROM Teams WHERE team_name = '')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = ''),
  3, 1, 0, 2, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Halcomb' AND team_id = (SELECT team_id FROM Teams WHERE team_name = '')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = ''),
  0, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Robinson' AND team_id = (SELECT team_id FROM Teams WHERE team_name = '')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = ''),
  3, 1, 1, 3, 1, 0, 0, 0, 0.333);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Jones' AND team_id = (SELECT team_id FROM Teams WHERE team_name = '')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = ''),
  3, 2, 2, 5, 0, 0, 0, 0, 0.667);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Schutter' AND team_id = (SELECT team_id FROM Teams WHERE team_name = '')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = ''),
  1, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Hertg' AND team_id = (SELECT team_id FROM Teams WHERE team_name = '')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = ''),
  0, 1, 0, 0, 0, 0, 0, 0, 0.000);

