-- Little League Game Import SQL

-- Step 1: Insert game record
INSERT INTO Games (game_date, location, home_team_id, away_team_id, home_score, away_score, total_innings)
VALUES ('2010-08-20', 'TBD',
  (SELECT team_id FROM Teams WHERE team_name = 'Midwest'),
  (SELECT team_id FROM Teams WHERE team_name = 'Southwest'),
  8, 10, 6);

SET @game_id = LAST_INSERT_ID();

UPDATE Games SET
  winning_team_id = (SELECT team_id FROM Teams WHERE team_name = 'Southwest'),
  losing_team_id = (SELECT team_id FROM Teams WHERE team_name = 'Midwest')
WHERE game_id = @game_id;

-- Step 2: Insert inning scores
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 1, 0, 3);
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 2, 0, 5);
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 3, 2, 0);
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 4, 2, 1);
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 5, 0, 1);
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 6, 4, 0);

-- Step 3: Insert batting statistics
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Orlando' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Southwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Southwest'),
  4, 1, 1, 0, 0, 0, 0, 0, 0.250);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Toler' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Southwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Southwest'),
  4, 2, 2, 1, 1, 0, 0, 0, 0.500);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Gu' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Southwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Southwest'),
  4, 2, 2, 3, 0, 0, 0, 0, 0.500);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Van Noort' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Southwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Southwest'),
  3, 1, 1, 0, 0, 0, 0, 0, 0.333);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Leger' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Southwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Southwest'),
  1, 1, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Orlando' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Southwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Southwest'),
  4, 3, 4, 5, 0, 0, 0, 0, 1.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Maly' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Southwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Southwest'),
  2, 0, 2, 1, 0, 0, 0, 0, 1.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Smith' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Southwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Southwest'),
  3, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Besh' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Southwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Southwest'),
  3, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Roblyer' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Southwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Southwest'),
  0, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Bettencour' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Southwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Southwest'),
  2, 0, 0, 0, 0, 0, 0, 0, 0.000);

-- Step 4: Insert pitching statistics
INSERT INTO PlayerGamePitching (player_id, game_id, team_id, innings_pitched, hits_allowed, runs_allowed, earned_runs, walks_allowed, strikeouts, home_runs_allowed, win_loss_save, era)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Van Noort' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Southwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Southwest'),
  2.1, 0, 0, 0, 1, 5, 0, 'W', 0.00);
INSERT INTO PlayerGamePitching (player_id, game_id, team_id, innings_pitched, hits_allowed, runs_allowed, earned_runs, walks_allowed, strikeouts, home_runs_allowed, win_loss_save, era)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Roblyer' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Southwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Southwest'),
  0.2, 1, 2, 2, 2, 1, 0, NULL, 17.99);
INSERT INTO PlayerGamePitching (player_id, game_id, team_id, innings_pitched, hits_allowed, runs_allowed, earned_runs, walks_allowed, strikeouts, home_runs_allowed, win_loss_save, era)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Gutierrez' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Southwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Southwest'),
  0.2, 0, 2, 0, 3, 1, 0, NULL, 0.00);
INSERT INTO PlayerGamePitching (player_id, game_id, team_id, innings_pitched, hits_allowed, runs_allowed, earned_runs, walks_allowed, strikeouts, home_runs_allowed, win_loss_save, era)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Orlando' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Southwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Southwest'),
  2.0, 1, 2, 2, 1, 3, 0, NULL, 6.00);
INSERT INTO PlayerGamePitching (player_id, game_id, team_id, innings_pitched, hits_allowed, runs_allowed, earned_runs, walks_allowed, strikeouts, home_runs_allowed, win_loss_save, era)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Toler' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Southwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Southwest'),
  0.0, 1, 2, 2, 2, 0, 1, NULL, 99.99);
INSERT INTO PlayerGamePitching (player_id, game_id, team_id, innings_pitched, hits_allowed, runs_allowed, earned_runs, walks_allowed, strikeouts, home_runs_allowed, win_loss_save, era)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Tuel' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Southwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Southwest'),
  1.2, 5, 7, 7, 3, 0, 2, 'L', 25.20);
INSERT INTO PlayerGamePitching (player_id, game_id, team_id, innings_pitched, hits_allowed, runs_allowed, earned_runs, walks_allowed, strikeouts, home_runs_allowed, win_loss_save, era)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Blustin' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Southwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Southwest'),
  0.0, 2, 1, 1, 1, 0, 0, NULL, 99.99);
INSERT INTO PlayerGamePitching (player_id, game_id, team_id, innings_pitched, hits_allowed, runs_allowed, earned_runs, walks_allowed, strikeouts, home_runs_allowed, win_loss_save, era)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Vecere' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Southwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Southwest'),
  1.1, 2, 1, 1, 1, 2, 1, NULL, 4.50);
INSERT INTO PlayerGamePitching (player_id, game_id, team_id, innings_pitched, hits_allowed, runs_allowed, earned_runs, walks_allowed, strikeouts, home_runs_allowed, win_loss_save, era)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Ripley' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Southwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Southwest'),
  2.0, 3, 1, 1, 1, 0, 1, NULL, 3.00);
INSERT INTO PlayerGamePitching (player_id, game_id, team_id, innings_pitched, hits_allowed, runs_allowed, earned_runs, walks_allowed, strikeouts, home_runs_allowed, win_loss_save, era)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'McDonough' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Southwest')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Southwest'),
  1.0, 0, 0, 0, 0, 1, 0, NULL, 0.00);
