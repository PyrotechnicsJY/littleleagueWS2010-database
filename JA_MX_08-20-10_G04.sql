-- Little League Game Import SQL

-- Step 1: Insert game record
INSERT INTO Games (game_date, location, home_team_id, away_team_id, home_score, away_score, total_innings)
VALUES ('2010-08-20', 'TBD',
  (SELECT team_id FROM Teams WHERE team_name = 'Mexico'),
  (SELECT team_id FROM Teams WHERE team_name = 'Japan'),
  2, 4, 6);

SET @game_id = LAST_INSERT_ID();

UPDATE Games SET
  winning_team_id = (SELECT team_id FROM Teams WHERE team_name = 'Japan'),
  losing_team_id = (SELECT team_id FROM Teams WHERE team_name = 'Mexico')
WHERE game_id = @game_id;

-- Step 2: Insert inning scores
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 1, 0, 0);
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 2, 0, 0);
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 3, 1, 0);
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 4, 0, 0);
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 5, 0, 0);
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 6, 1, 4);

-- Step 3: Insert batting statistics
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Maruoka' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Japan')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Japan'),
  3, 1, 1, 3, 1, 0, 0, 0, 0.333);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Fujii' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Japan')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Japan'),
  1, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Norimatsu' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Japan')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Japan'),
  4, 1, 3, 0, 1, 0, 0, 0, 0.750);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Ogasawara' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Japan')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Japan'),
  3, 0, 1, 0, 0, 0, 0, 0, 0.333);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Mizumachi' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Japan')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Japan'),
  2, 0, 1, 0, 0, 0, 0, 1, 0.500);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Ishii' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Japan')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Japan'),
  1, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Kamikura' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Japan')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Japan'),
  1, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Ikeda' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Japan')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Japan'),
  1, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Nagata' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Japan')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Japan'),
  3, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Shinozaki' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Japan')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Japan'),
  1, 1, 1, 0, 0, 0, 0, 0, 1.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Tomori' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Japan')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Japan'),
  2, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Motegi' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Japan')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Japan'),
  1, 0, 0, 0, 0, 0, 0, 0, 0.000);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Saito' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Japan')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Japan'),
  2, 1, 1, 0, 0, 0, 0, 0, 0.500);
INSERT INTO PlayerGameBatting (player_id, game_id, team_id, at_bats, runs, hits, rbi, doubles, triples, home_runs, stolen_bases, batting_avg)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Sugawa' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Japan')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Japan'),
  1, 0, 0, 0, 0, 0, 0, 0, 0.000);

-- Step 4: Insert pitching statistics
INSERT INTO PlayerGamePitching (player_id, game_id, team_id, innings_pitched, hits_allowed, runs_allowed, earned_runs, walks_allowed, strikeouts, home_runs_allowed, win_loss_save, era)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Mizumachi' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Japan')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Japan'),
  5.1, 3, 1, 1, 0, 11, 0, 'W', 1.13);
INSERT INTO PlayerGamePitching (player_id, game_id, team_id, innings_pitched, hits_allowed, runs_allowed, earned_runs, walks_allowed, strikeouts, home_runs_allowed, win_loss_save, era)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Ogasawara' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Japan')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Japan'),
  0.2, 1, 1, 1, 0, 2, 1, NULL, 9.00);
INSERT INTO PlayerGamePitching (player_id, game_id, team_id, innings_pitched, hits_allowed, runs_allowed, earned_runs, walks_allowed, strikeouts, home_runs_allowed, win_loss_save, era)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Penaloza' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Mexico')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Mexico'),
  4.1, 5, 0, 0, 2, 9, 0, NULL, 0.00);
INSERT INTO PlayerGamePitching (player_id, game_id, team_id, innings_pitched, hits_allowed, runs_allowed, earned_runs, walks_allowed, strikeouts, home_runs_allowed, win_loss_save, era)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Puga' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Mexico')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Mexico'),
  0.1, 3, 3, 3, 0, 1, 1, 'L', 54.05);
INSERT INTO PlayerGamePitching (player_id, game_id, team_id, innings_pitched, hits_allowed, runs_allowed, earned_runs, walks_allowed, strikeouts, home_runs_allowed, win_loss_save, era)
VALUES (
  (SELECT player_id FROM Players WHERE last_name = 'Alarcon' AND team_id = (SELECT team_id FROM Teams WHERE team_name = 'Mexico')),
  @game_id,
  (SELECT team_id FROM Teams WHERE team_name = 'Mexico'),
  0.1, 0, 0, 0, 0, 0, 0, NULL, 0.00);
