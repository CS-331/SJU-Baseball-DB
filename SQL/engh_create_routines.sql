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
