/* Game */

-- strikes per pitch type (hit, strike, foul, ball)
CREATE OR REPLACE VIEW game_strikes_pitchType AS (
Select GameID,
  Sum(case when pitchType = 'Fastball' AND playResult = 'Strike' THEN 1 ELSE 0 END) As strikesPerFastball,
  Sum(case when pitchType = 'Curveball' AND playResult = 'Strike' THEN 1 ELSE 0 END) As strikesPerCurveball,
  Sum(case when pitchType = 'Slider' AND playResult = 'Strike' THEN 1 ELSE 0 END) As strikesPerSlider,
  Sum(case when pitchType = 'Cutter' AND playResult = 'Strike' THEN 1 ELSE 0 END) As strikesPerCutter,
  Sum(case when pitchType = 'Change Up' AND playResult = 'Strike' THEN 1 ELSE 0 END) As strikesPerChangeUp,
  Sum(case when pitchType = 'Splitter' AND playResult = 'Strike' THEN 1 ELSE 0 END) As strikesPerSplitter
From play p
Group By GameID);

-- balls per pitch type
CREATE OR REPLACE VIEW game_balls_pitchType AS (
Select GameID,
  Sum(case when pitchType = 'Fastball' AND playResult = 'Ball' THEN 1 ELSE 0 END) As strikesPerFastball,
  Sum(case when pitchType = 'Curveball' AND playResult = 'Ball' THEN 1 ELSE 0 END) As strikesPerCurveball,
  Sum(case when pitchType = 'Slider' AND playResult = 'Ball' THEN 1 ELSE 0 END) As strikesPerSlider,
  Sum(case when pitchType = 'Cutter' AND playResult = 'Ball' THEN 1 ELSE 0 END) As strikesPerCutter,
  Sum(case when pitchType = 'Change Up' AND playResult = 'Ball' THEN 1 ELSE 0 END) As strikesPerChangeUp,
  Sum(case when pitchType = 'Splitter' AND playResult = 'Ball' THEN 1 ELSE 0 END) As strikesPerSplitter
From play p
Group By GameID);

-- speed per pitch type
CREATE OR REPLACE VIEW game_speed_pitchType AS (
Select GameID,
  AVG(case when pitchType = 'Fastball' THEN speed ELSE NULL END) As speedFastball,
  AVG(case when pitchType = 'Curveball' THEN speed ELSE NULL END) As speedCurveball,
  AVG(case when pitchType = 'Slider' THEN speed ELSE NULL END) As speedSlider,
  AVG(case when pitchType = 'Cutter' THEN speed ELSE NULL END) As speedCutter,
  AVG(case when pitchType = 'Change Up' THEN speed ELSE NULL END) As speedChangeUp,
  AVG(case when pitchType = 'Splitter' THEN speed ELSE NULL END) As speedSplitter
From play p
Group By GameID);

-- percentage of pitches resulting in ball
CREATE OR REPLACE VIEW game_pitch_ball_percentage AS (
Select GameID, (COUNT(case when playResult = 'Ball' THEN 1 END)/COUNT(*)) AS pitchBall
From play p
Group By GameID);

-- percentage of pitches resulting in strike
CREATE OR REPLACE VIEW game_pitch_strike_percentage AS (
Select GameID, (COUNT(case when playResult = 'Strike' THEN 1 END)/COUNT(*)) AS pitchStrike
From play p
Group By GameID);

-- percentage of pitches resulting in hit
CREATE OR REPLACE VIEW game_hit_percentage AS (
Select GameID, (COUNT(case when playResult = 'Hit' THEN 1 END)/COUNT(*)) AS pitchHit
From play p
Group By GameID);

-- Counts of each pitch type
CREATE OR REPLACE VIEW game_count_pitchType AS (
Select GameID,
  COUNT(case when pitchType = 'Fastball' THEN 1 ELSE NULL END) As Fastball,
  COUNT(case when pitchType = 'Curveball' THEN 1 ELSE NULL END) As Curveball,
  COUNT(case when pitchType = 'Slider' THEN 1 ELSE NULL END) As Slider,
  COUNT(case when pitchType = 'Cutter' THEN 1 ELSE NULL END) As Cutter,
  COUNT(case when pitchType = 'Change Up' THEN 1 ELSE NULL END) As ChangeUp,
  COUNT(case when pitchType = 'Splitter' THEN 1 ELSE NULL END) As Splitter
From play p
Group By GameID);

-- Number of pitches thrown
CREATE OR REPLACE VIEW game_count_pitches AS (
Select GameID,
  COUNT(*) As count
From play p
Group By GameID);


/*Pitcher*/

-- strikes per pitch type (hit, strike, foul, ball)
CREATE OR REPLACE VIEW pitcher_strikes_pitchType AS (
Select pitcherID,
  Sum(case when pitchType = 'Fastball' AND playResult = 'Strike' THEN 1 ELSE 0 END) As strikesPerFastball,
  Sum(case when pitchType = 'Curveball' AND playResult = 'Strike' THEN 1 ELSE 0 END) As strikesPerCurveball,
  Sum(case when pitchType = 'Slider' AND playResult = 'Strike' THEN 1 ELSE 0 END) As strikesPerSlider,
  Sum(case when pitchType = 'Cutter' AND playResult = 'Strike' THEN 1 ELSE 0 END) As strikesPerCutter,
  Sum(case when pitchType = 'Change Up' AND playResult = 'Strike' THEN 1 ELSE 0 END) As strikesPerChangeUp,
  Sum(case when pitchType = 'Splitter' AND playResult = 'Strike' THEN 1 ELSE 0 END) As strikesPerSplitter
From play p
Group By pitcherID);

-- balls per pitch type
CREATE OR REPLACE VIEW pitcher_balls_pitchType AS (
Select pitcherID,
  Sum(case when pitchType = 'Fastball' AND playResult = 'Ball' THEN 1 ELSE 0 END) As BallFastball,
  Sum(case when pitchType = 'Curveball' AND playResult = 'Ball' THEN 1 ELSE 0 END) As BallCurveball,
  Sum(case when pitchType = 'Slider' AND playResult = 'Ball' THEN 1 ELSE 0 END) As BallSlider,
  Sum(case when pitchType = 'Cutter' AND playResult = 'Ball' THEN 1 ELSE 0 END) As BallCutter,
  Sum(case when pitchType = 'Change Up' AND playResult = 'Ball' THEN 1 ELSE 0 END) As BallChangeUp,
  Sum(case when pitchType = 'Splitter' AND playResult = 'Ball' THEN 1 ELSE 0 END) As BallSplitter
From play p
Group By pitcherID);

-- speed per pitch type
CREATE OR REPLACE VIEW pitcher_speed_pitchType AS (
Select pitcherID,
  AVG(case when pitchType = 'Fastball' THEN speed ELSE NULL END) As speedFastball,
  AVG(case when pitchType = 'Curveball' THEN speed ELSE NULL END) As speedCurveball,
  AVG(case when pitchType = 'Slider' THEN speed ELSE NULL END) As speedSlider,
  AVG(case when pitchType = 'Cutter' THEN speed ELSE NULL END) As speedCutter,
  AVG(case when pitchType = 'Change Up' THEN speed ELSE NULL END) As speedChangeUp,
  AVG(case when pitchType = 'Splitter' THEN speed ELSE NULL END) As speedSplitter
From play p
Group By pitcherID);

-- percentage of pitches resulting in ball
CREATE OR REPLACE VIEW pitcher_pitch_ball_percentage AS (
Select pitcherID, (COUNT(case when playResult = 'Ball' THEN 1 END)/COUNT(*)) AS pitchBall
From play p
Group By pitcherID);

-- percentage of pitches resulting in strike
CREATE OR REPLACE VIEW pitcher_pitch_strike_percentage AS (
Select pitcherID, (COUNT(case when playResult = 'Strike' THEN 1 END)/COUNT(*)) AS pitchStrike
From play p
Group By pitcherID);

-- percentage of pitches resulting in hit
CREATE OR REPLACE VIEW pitcher_hit_percentage AS (
Select pitcherID, (COUNT(case when playResult = 'Hit' THEN 1 END)/COUNT(*)) AS pitchHit
From play p
Group By pitcherID);

-- Counts of each pitch type
CREATE OR REPLACE VIEW pitcher_count_pitchType AS (
Select pitcherID,
  COUNT(case when pitchType = 'Fastball' THEN 1 ELSE NULL END) As Fastball,
  COUNT(case when pitchType = 'Curveball' THEN 1 ELSE NULL END) As Curveball,
  COUNT(case when pitchType = 'Slider' THEN 1 ELSE NULL END) As Slider,
  COUNT(case when pitchType = 'Cutter' THEN 1 ELSE NULL END) As Cutter,
  COUNT(case when pitchType = 'Change Up' THEN 1 ELSE NULL END) As ChangeUp,
  COUNT(case when pitchType = 'Splitter' THEN 1 ELSE NULL END) As Splitter
From play p
Group By pitcherID);

-- Number of pitches thrown
CREATE OR REPLACE VIEW pitcher_count_pitches AS (
Select pitcherID,
  COUNT(*) As count
From play p
Group By pitcherID);


/* lastly for each inning we want a view of the following information */

-- Number of pitches thrown
CREATE OR REPLACE VIEW inning_count_pitches AS (
Select GameID, inningID,
  COUNT(*) As count
From play p
Group By GameID, inningID);

-- strikes per pitch type (hit, strike, foul, ball)
CREATE OR REPLACE VIEW inning_strikes_pitchType AS (
Select GameID, inningID,
  Sum(case when pitchType = 'Fastball' AND playResult = 'Strike' THEN 1 ELSE 0 END) As strikesPerFastball,
  Sum(case when pitchType = 'Curveball' AND playResult = 'Strike' THEN 1 ELSE 0 END) As strikesPerCurveball,
  Sum(case when pitchType = 'Slider' AND playResult = 'Strike' THEN 1 ELSE 0 END) As strikesPerSlider,
  Sum(case when pitchType = 'Cutter' AND playResult = 'Strike' THEN 1 ELSE 0 END) As strikesPerCutter,
  Sum(case when pitchType = 'Change Up' AND playResult = 'Strike' THEN 1 ELSE 0 END) As strikesPerChangeUp,
  Sum(case when pitchType = 'Splitter' AND playResult = 'Strike' THEN 1 ELSE 0 END) As strikesPerSplitter
From play p
Group By GameID, inningID);

-- balls per pitch type
CREATE OR REPLACE VIEW inning_balls_pitchType AS (
Select GameID, inningID,
  Sum(case when pitchType = 'Fastball' AND playResult = 'Ball' THEN 1 ELSE 0 END) As strikesPerFastball,
  Sum(case when pitchType = 'Curveball' AND playResult = 'Ball' THEN 1 ELSE 0 END) As strikesPerCurveball,
  Sum(case when pitchType = 'Slider' AND playResult = 'Ball' THEN 1 ELSE 0 END) As strikesPerSlider,
  Sum(case when pitchType = 'Cutter' AND playResult = 'Ball' THEN 1 ELSE 0 END) As strikesPerCutter,
  Sum(case when pitchType = 'Change Up' AND playResult = 'Ball' THEN 1 ELSE 0 END) As strikesPerChangeUp,
  Sum(case when pitchType = 'Splitter' AND playResult = 'Ball' THEN 1 ELSE 0 END) As strikesPerSplitter
From play p
Group By GameID, inningID);

-- speed per pitch type
CREATE OR REPLACE VIEW inning_speed_pitchType AS (
Select GameID, inningID,
  AVG(case when pitchType = 'Fastball' THEN speed ELSE NULL END) As speedFastball,
  AVG(case when pitchType = 'Curveball' THEN speed ELSE NULL END) As speedCurveball,
  AVG(case when pitchType = 'Slider' THEN speed ELSE NULL END) As speedSlider,
  AVG(case when pitchType = 'Cutter' THEN speed ELSE NULL END) As speedCutter,
  AVG(case when pitchType = 'Change Up' THEN speed ELSE NULL END) As speedChangeUp,
  AVG(case when pitchType = 'Splitter' THEN speed ELSE NULL END) As speedSplitter
From play p
Group By GameID, inningID);

-- percentage of pitches resulting in ball
CREATE OR REPLACE VIEW inning_pitch_ball_percentage AS (
Select GameID, inningID, (COUNT(case when playResult = 'Ball' THEN 1 END)/COUNT(*)) AS pitchBall
From play p
Group By GameID,inningID);

-- percentage of pitches resulting in strike
CREATE OR REPLACE VIEW inning_pitch_strike_percentage AS (
Select GameID, inningID, (COUNT(case when playResult = 'Strike' THEN 1 END)/COUNT(*)) AS pitchStrike
From play p
Group By GameID, inningID);

-- percentage of pitches resulting in hit
CREATE OR REPLACE VIEW inning_hit_percentage AS (
Select GameID, inningID, (COUNT(case when playResult = 'Hit' THEN 1 END)/COUNT(*)) AS pitchHit
From play p
Group By GameID, inningID);

-- Counts of each pitch type
CREATE OR REPLACE VIEW inning_count_pitchType AS (
Select GameID, inningID,
  COUNT(case when pitchType = 'Fastball' THEN 1 ELSE NULL END) As Fastball,
  COUNT(case when pitchType = 'Curveball' THEN 1 ELSE NULL END) As Curveball,
  COUNT(case when pitchType = 'Slider' THEN 1 ELSE NULL END) As Slider,
  COUNT(case when pitchType = 'Cutter' THEN 1 ELSE NULL END) As Cutter,
  COUNT(case when pitchType = 'Change Up' THEN 1 ELSE NULL END) As ChangeUp,
  COUNT(case when pitchType = 'Splitter' THEN 1 ELSE NULL END) As Splitter
From play p
Group By GameID, inningID);

--Trigger to update NumPitches to NumPitches++ of the inning after a pitch is thrown. Game updated TotalPitches as well
CREATE OR REPLACE TRIGGER AutoUpPitchCount
AFTER INSERT ON play
    FOR EACH ROW BEGIN
    
        --Update for Inning
        UPDATE inning
        SET numPitches = numPitches + 1
        WHERE gameID = :NEW.gameID AND inningID = :NEW.inningID AND playerID = :NEW.pitcherID;
        
        --Update for Game
        UPDATE game
        SET cumulativePitches = cumulativePitches + 1
        WHERE gameID = :NEW.gameID;
    END;
    
--If pitch is deleted, down the pitch count for the inning
CREATE OR REPLACE TRIGGER AutoDownOnDeletePitch
AFTER DELETE ON play
    FOR EACH ROW BEGIN
        
        --Update for Inning
        UPDATE inning
        SET NumPitches = NumPitches - 1
        WHERE gameID = :OLD.gameID AND inningID = :OLD.inningID AND playerID = :OLD.pitcherID;
        
        --Update for Game
        UPDATE game
        SET cumulativePitches = cumulativePitches - 1
        WHERE GameID = :OLD.GameID;
    END;
    
--Called after new pitcher is replaced (Can be during an inning or after), which stores a new player with the same Inning and GameID as the previous pitcher
CREATE OR REPLACE TRIGGER UpGamesPlayed
AFTER INSERT ON inning
    FOR EACH ROW 
    DECLARE numPitchesThrownInGame INT;
    BEGIN
    --Check if the new pitcher has pitched in the game
    SELECT COUNT(*) into numpitchesthrowningame 
    FROM play 
    WHERE :NEW.gameID = gameID AND :NEW.playerID = pitcherID ORDER BY pitcherID;
    IF(numPitchesThrownInGame = 0) THEN
        --Update GamesPlayed + 1
        UPDATE pitcher
        SET gamesPlayed = gamesPlayed + 1
        WHERE :New.playerID = playerID;
        END IF;
    END;

CREATE OR REPLACE TRIGGER UpOutsOnPitchCount
AFTER INSERT ON play
    FOR EACH ROW
    BEGIN
    IF(:NEW.pitchCount = 03 OR :NEW.pitchCount = 13 OR :NEW.pitchCount = 23 OR :NEW.pitchCount = 33) THEN
        UPDATE inning
        SET outs = outs + 1
        WHERE :NEW.pitcherID = playerID AND :NEW.inningID = inningID AND :NEW.gameID = gameID;
    END IF;
    END;
        
-- **********************************************************************************************************************  
-- FULL TEST SUITE FOR TRIGGERS
-- **********************************************************************************************************************
--Test Pitchers
INSERT INTO pitcher VALUES(157,'TestFirtName','TestLastName', 1, 0);
INSERT INTO pitcher VALUES(203,'Baseball','Pitcher', 2, 0);
INSERT INTO pitcher VALUES(379,'SJU','Baseball', 3, 0);

--Test Game
INSERT INTO game VALUES(999, 'St. Thomas', to_date('2022-03-28','YYYY-MM-DD'), 0);

--START INNING w/ PITCHER
INSERT INTO inning VALUES(999, 1, 157, 0, 0);
SELECT * FROM inning where gameID = 999;
--Should return 1 as the pitcher is now in the game for their first in the inning
SELECT gamesPlayed FROM pitcher WHERE playerID = 157;

--THROW PITCHES
INSERT INTO play VALUES(157, 999, 1,'FB', 1, 96, 01, '0');
INSERT INTO play VALUES(157, 999, 1, 'FB', 1, 78, 02, '0');
INSERT INTO play VALUES(157, 999, 1, 'SLD', 1, 60, 03, '0');
SELECT * FROM play WHERE gameID = 999;

--Game and Inning both return 3 in their pitch count. Outs should be 1
SELECT numPitches,outs FROM inning WHERE gameID = 999;
SELECT cumulativePitches FROM GAME WHERE gameID = 999;

--Put in a same pitcher for the next inning, should return gamesPlayed as 1, not 2
INSERT INTO inning VALUES(999,2,157, 0, 0);
SELECT gamesPlayed FROM pitcher WHERE playerID = 157;

--Put in new pitcher for same inning, should return 1 GamesPlayed for pitcher 1 and 2 and 0 GamesPlayed for pitcher 3
INSERT INTO inning VALUES(999,'2', 203, 0, 0);
SELECT playerID,gamesPlayed FROM pitcher where playerID = 157 OR playerID = 203 OR playerID = 379;

--DELETE test pitches, numPitches and cumulativePitches should go down by 3 in inning 1
DELETE FROM play where pitcherID = 157 AND gameID=999;
SELECT numPitches FROM inning WHERE inningID = 1 AND gameID = 999;
SELECT cumulativePitches FROM GAME WHERE GameID = 999;

--Remove test data
DELETE FROM inning WHERE gameID = 999;
DELETE FROM game WHERE gameID = 999;
DELETE FROM pitcher WHERE playerID = 157;
DELETE FROM pitcher WHERE playerID = 203;
DELETE FROM pitcher WHERE playerID = 379;

-- **********************************************************************************************************************
