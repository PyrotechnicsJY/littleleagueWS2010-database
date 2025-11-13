-- Little League Game Import SQL

-- Step 1: Insert game record
INSERT INTO Games (game_date, location, home_team_id, away_team_id, home_score, away_score, total_innings)
VALUES ('2010-08-20', 'TBD',
  (SELECT team_id FROM Teams WHERE team_name = 'New England'),
  (SELECT team_id FROM Teams WHERE team_name = 'Northwest'),
  3, 1, 6);

SET @game_id = LAST_INSERT_ID();

UPDATE Games SET
  winning_team_id = (SELECT team_id FROM Teams WHERE team_name = 'New England'),
  losing_team_id = (SELECT team_id FROM Teams WHERE team_name = 'Northwest')
WHERE game_id = @game_id;

-- Step 2: Insert inning scores
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 1, 0, 0);
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 2, 1, 0);
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 3, 0, 0);
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 4, 0, 1);
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 5, 2, 0);
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 6, 0, 0);

-- Step 3: Insert batting statistics
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Tan' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Northwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Northwest'),
  3, 0, 1, 0, 0, 0, 0, 0, 0.333);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Nahaku' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Northwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Northwest'),
  3, 0, 2, 0, 1, 0, 0, 0, 0.667);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Hatch' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Northwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Northwest'),
  3, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'OGrady' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Northwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Northwest'),
  3, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Manning' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Northwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Northwest'),
  3, 1, 1, 0, 0, 0, 0, 0, 0.333);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Byorick' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Northwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Northwest'),
  3, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Lacey' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Northwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Northwest'),
  1, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Wilson' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Northwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Northwest'),
  3, 0, 2, 1, 1, 0, 0, 0, 0.667);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Michalek' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Northwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Northwest'),
  2, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Row' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Northwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Northwest'),
  1, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Davis' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Northwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Northwest'),
  2, 0, 0, 0, 0, 0, 0, 0, 0.000);

-- Step 4: Insert pitching statistics
INSERT INTO PlayerGamePitching (player_id, game_id, team_id, innings_pitched, hits_allowed, runs_allowed, earned_runs, walks_allowed, strikeouts, home_runs_allowed, win_loss_save, era)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Manning' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Northwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Northwest'),
  3.0, 4, 1, 1, 3, 3, 0, NULL, 2.00);
INSERT INTO PlayerGamePitching (player_id, game_id, team_id, innings_pitched, hits_allowed, runs_allowed, earned_runs, walks_allowed, strikeouts, home_runs_allowed, win_loss_save, era)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Hatch' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Northwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Northwest'),
  1.2, 1, 2, 1, 1, 4, 0, 'L', 3.60);
INSERT INTO PlayerGamePitching (player_id, game_id, team_id, innings_pitched, hits_allowed, runs_allowed, earned_runs, walks_allowed, strikeouts, home_runs_allowed, win_loss_save, era)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'OGrady' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Northwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Northwest'),
  0.1, 0, 0, 0, 0, 0, 0, NULL, 0.00);
INSERT INTO PlayerGamePitching (player_id, game_id, team_id, innings_pitched, hits_allowed, runs_allowed, earned_runs, walks_allowed, strikeouts, home_runs_allowed, win_loss_save, era)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Nardone' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'New England')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'New England'),
  5.2, 6, 1, 1, 0, 10, 0, 'W', 1.06);
