USE little_league_world_series;

-- trigger: auto-set winner and loser for games

DELIMITER //
CREATE TRIGGER trg_set_winner
BEFORE INSERT ON games
FOR EACH ROW
BEGIN
  IF NEW.home_score IS NOT NULL AND NEW.away_score IS NOT NULL THEN
    
    IF NEW.home_score > NEW.away_score THEN
      -- home team wins
      SET NEW.winning_team_id = NEW.home_team_id;
      SET NEW.losing_team_id  = NEW.away_team_id;

    ELSEIF NEW.away_score > NEW.home_score THEN
      -- away team wins
      SET NEW.winning_team_id = NEW.away_team_id;
      SET NEW.losing_team_id  = NEW.home_team_id;

    ELSE
      -- tie game
      SET NEW.winning_team_id = NULL;
      SET NEW.losing_team_id  = NULL;
    END IF;

  END IF;
END//
DELIMITER ;

-- stored procedure: team summary (wins/losses)

DELIMITER //
CREATE PROCEDURE sp_team_summary (IN p_team_id INT)
BEGIN
  SELECT
    t.team_id,
    t.team_name,
    SUM(CASE WHEN g.winning_team_id = t.team_id THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN g.losing_team_id  = t.team_id THEN 1 ELSE 0 END) AS losses
  FROM teams t
  LEFT JOIN games g
    ON g.home_team_id = t.team_id
    OR g.away_team_id = t.team_id
  WHERE t.team_id = p_team_id
  GROUP BY t.team_id, t.team_name;
END//
DELIMITER ;
