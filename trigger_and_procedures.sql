USE little_league_world_series;

-- clean slate
DROP TRIGGER IF EXISTS trg_games_set_winner_before_insert;
DROP TRIGGER IF EXISTS trg_games_set_winner_before_update;

-- sets winning_team_id / losing_team_id based on scores on insert
DELIMITER //
CREATE TRIGGER trg_games_set_winner_before_insert
BEFORE INSERT ON games
FOR EACH ROW
BEGIN
  IF NEW.home_score IS NOT NULL AND NEW.away_score IS NOT NULL THEN
    IF NEW.home_score > NEW.away_score THEN
      SET NEW.winning_team_id = NEW.home_team_id;
      SET NEW.losing_team_id  = NEW.away_team_id;
    ELSEIF NEW.away_score > NEW.home_score THEN
      SET NEW.winning_team_id = NEW.away_team_id;
      SET NEW.losing_team_id  = NEW.home_team_id;
    ELSE
      -- tie
      SET NEW.winning_team_id = NULL;
      SET NEW.losing_team_id  = NULL;
    END IF;
  END IF;
END//
DELIMITER ;

-- reevaluates winner/loser whenever scores change on update
DELIMITER //
CREATE TRIGGER trg_games_set_winner_before_update
BEFORE UPDATE ON games
FOR EACH ROW
BEGIN
  IF (NEW.home_score <> OLD.home_score) OR (NEW.away_score <> OLD.away_score)
     OR (NEW.home_score IS NOT NULL AND OLD.home_score IS NULL)
     OR (NEW.away_score IS NOT NULL AND OLD.away_score IS NULL) THEN
    IF NEW.home_score IS NOT NULL AND NEW.away_score IS NOT NULL THEN
      IF NEW.home_score > NEW.away_score THEN
        SET NEW.winning_team_id = NEW.home_team_id;
        SET NEW.losing_team_id  = NEW.away_team_id;
      ELSEIF NEW.away_score > NEW.home_score THEN
        SET NEW.winning_team_id = NEW.away_team_id;
        SET NEW.losing_team_id  = NEW.home_team_id;
      ELSE
        SET NEW.winning_team_id = NULL;
        SET NEW.losing_team_id  = NULL;
      END IF;
    END IF;
  END IF;
END//
DELIMITER ;
