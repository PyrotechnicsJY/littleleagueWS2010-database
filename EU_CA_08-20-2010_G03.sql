-- Little League Game Import SQL

-- Step 1: Insert game record
INSERT INTO Games (game_date, location, home_team_id, away_team_id, home_score, away_score, total_innings)
VALUES ('2010-08-20', 'TBD',
  (SELECT team_id FROM Teams WHERE team_name = 'Caribbean'),
  (SELECT team_id FROM Teams WHERE team_name = 'Europe'),
  11, 0, 4);

SET @game_id = LAST_INSERT_ID();

UPDATE Games SET
  winning_team_id = (SELECT team_id FROM Teams WHERE team_name = 'Caribbean'),
  losing_team_id = (SELECT team_id FROM Teams WHERE team_name = 'Europe')
WHERE game_id = @game_id;

-- Step 2: Insert inning scores
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 1, 2, 0);
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 2, 5, 0);
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 3, 2, 0);
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 4, 2, 0);

-- Step 3: Insert batting statistics
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Foley' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Europe')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Europe'),
  2, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Hurley' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Europe')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Europe'),
  1, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Steed' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Europe')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Europe'),
  1, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Hufana' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Europe')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Europe'),
  2, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Mueller' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Europe')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Europe'),
  1, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Tujo' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Europe')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Europe'),
  2, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Harrington' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Europe')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Europe'),
  1, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Stokes' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Europe')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Europe'),
  1, 0, 1, 0, 0, 0, 0, 0, 1.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Ullmann' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Europe')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Europe'),
  1, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Hood' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Europe')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Europe'),
  0, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Gonzalez' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Europe')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Europe'),
  1, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Oswald' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Europe')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Europe'),
  0, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Figueroa' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Europe')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Europe'),
  1, 1, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Martinez' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Europe')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Europe'),
  1, 1, 0, 0, 0, 0, 0, 0, 0.000);

-- Step 4: Insert pitching statistics
INSERT INTO PlayerGamePitching (player_id, game_id, team_id, innings_pitched, hits_allowed, runs_allowed, earned_runs, walks_allowed, strikeouts, home_runs_allowed, win_loss_save, era)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Mueller' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Europe')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Europe'),
  1.2, 5, 7, 5, 1, 3, 3, 'L', 18.00);
INSERT INTO PlayerGamePitching (player_id, game_id, team_id, innings_pitched, hits_allowed, runs_allowed, earned_runs, walks_allowed, strikeouts, home_runs_allowed, win_loss_save, era)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Ullmann' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Europe')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Europe'),
  1.1, 2, 2, 2, 2, 0, 1, NULL, 9.00);
INSERT INTO PlayerGamePitching (player_id, game_id, team_id, innings_pitched, hits_allowed, runs_allowed, earned_runs, walks_allowed, strikeouts, home_runs_allowed, win_loss_save, era)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Tujo' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Europe')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Europe'),
  0.0, 1, 2, 2, 1, 0, 1, NULL, 99.99);
INSERT INTO PlayerGamePitching (player_id, game_id, team_id, innings_pitched, hits_allowed, runs_allowed, earned_runs, walks_allowed, strikeouts, home_runs_allowed, win_loss_save, era)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Martinez' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Europe')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Europe'),
  3.0, 1, 0, 0, 0, 7, 0, 'W', 0.00);
INSERT INTO PlayerGamePitching (player_id, game_id, team_id, innings_pitched, hits_allowed, runs_allowed, earned_runs, walks_allowed, strikeouts, home_runs_allowed, win_loss_save, era)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Figueroa' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Europe')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Europe'),
  1.0, 0, 0, 0, 0, 2, 0, NULL, 0.00);
