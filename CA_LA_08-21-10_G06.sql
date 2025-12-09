-- Little League Game Import SQL

-- Step 1: Insert game record
INSERT INTO Games (game_date, location, home_team_id, away_team_id, home_score, away_score, total_innings)
VALUES ('2010-08-21', 'TBD',
  (SELECT team_id FROM Teams WHERE team_name = 'Latin America'),
  (SELECT team_id FROM Teams WHERE team_name = 'Canada'),
  2, 4, 6);

SET @game_id = LAST_INSERT_ID();

UPDATE Games SET
  winning_team_id = (SELECT team_id FROM Teams WHERE team_name = 'Canada'),
  losing_team_id = (SELECT team_id FROM Teams WHERE team_name = 'Latin America')
WHERE game_id = @game_id;

-- Step 2: Insert inning scores
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 1, 0, 0);
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 2, 0, 1);
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 3, 1, 2);
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 4, 0, 0);
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 5, 1, 1);
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 6, 0, 0);

-- Step 3: Insert batting statistics
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Soper' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Canada')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Canada'),
  3, 2, 2, 0, 0, 0, 0, 0, 0.667);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Reyes' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Canada')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Canada'),
  2, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Quito' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Canada')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Canada'),
  3, 1, 2, 2, 1, 0, 0, 0, 0.667);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Greer' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Canada')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Canada'),
  1, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Hunter' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Canada')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Canada'),
  1, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'DeGuzman' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Canada')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Canada'),
  3, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Skolrood' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Canada')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Canada'),
  1, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Jenkin' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Canada')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Canada'),
  0, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Chaba' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Canada')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Canada'),
  3, 0, 1, 0, 0, 0, 0, 0, 0.333);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Jenkins' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Canada')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Canada'),
  1, 1, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Ikeda' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Canada')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Canada'),
  1, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Gonzalez' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Canada')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Canada'),
  2, 2, 2, 1, 1, 0, 0, 0, 1.000);

-- Step 4: Insert pitching statistics
INSERT INTO PlayerGamePitching (player_id, game_id, team_id, innings_pitched, hits_allowed, runs_allowed, earned_runs, walks_allowed, strikeouts, home_runs_allowed, win_loss_save, era)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Soper' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Canada')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Canada'),
  6.0, 6, 2, 2, 0, 2, 1, 'W', 2.00);
INSERT INTO PlayerGamePitching (player_id, game_id, team_id, innings_pitched, hits_allowed, runs_allowed, earned_runs, walks_allowed, strikeouts, home_runs_allowed, win_loss_save, era)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Garcia' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Canada')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Canada'),
  5.1, 6, 4, 2, 2, 10, 0, 'L', 2.25);
INSERT INTO PlayerGamePitching (player_id, game_id, team_id, innings_pitched, hits_allowed, runs_allowed, earned_runs, walks_allowed, strikeouts, home_runs_allowed, win_loss_save, era)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Carrizo' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Canada')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Canada'),
  0.2, 0, 0, 0, 0, 1, 0, NULL, 0.00);
