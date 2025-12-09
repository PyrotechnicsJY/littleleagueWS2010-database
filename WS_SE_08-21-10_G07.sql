-- Little League Game Import SQL

-- WARNING: Inning totals (0) don't match final score (6)
-- This usually means the line score shows cumulative runs, which has been corrected below

-- Step 1: Insert game record
INSERT INTO Games (game_date, location, home_team_id, away_team_id, home_score, away_score, total_innings)
VALUES ('2010-08-21', 'TBD',
  (SELECT team_id FROM Teams WHERE team_name = 'Southeast'),
  (SELECT team_id FROM Teams WHERE team_name = 'West'),
  6, 2, 6);

SET @game_id = LAST_INSERT_ID();

UPDATE Games SET
  winning_team_id = (SELECT team_id FROM Teams WHERE team_name = 'Southeast'),
  losing_team_id = (SELECT team_id FROM Teams WHERE team_name = 'West')
WHERE game_id = @game_id;

-- Step 2: Insert inning scores
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 1, 0, 4);
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 2, 0, 0);
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 3, 0, 0);
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 4, 0, 0);
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 5, 0, 2);
INSERT INTO Innings (game_id, inning_number, home_team_runs, away_team_runs)
VALUES (@game_id, 6, 0, 0);

