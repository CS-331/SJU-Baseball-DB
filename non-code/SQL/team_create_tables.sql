drop table play;
drop table inning;
drop table pitcher;
drop table game;
drop table login;
CREATE TABLE Game (
    OpposingTeam VARCHAR(20),
    GameDate VARCHAR(10),
    cumulativePitches NUMBER,
  	PRIMARY KEY(OpposingTeam,GameDate)
);

CREATE TABLE inning (
  OpposingTeam VARCHAR(20),
  GameDate VARCHAR(10),
  inningID NUMBER(2,0) NOT NULL CHECK(inningID >= 0),
  PlayerID NUMBER NOT NULL,
  outs NUMBER(1,0) CHECK(outs >= 0),
  numPitches NUMBER,
  PRIMARY KEY(OpposingTeam, GameDate, inningID, PlayerID)
);

CREATE TABLE pitcher (
  playerID NUMBER NOT NULL,
  fName VARCHAR(20),
  lName VARCHAR(20),
  playerNumber NUMBER(3,0) CHECK(playerNumber >= 0),
  gamesPlayed NUMBER,
  PRIMARY KEY(playerID)
);

--PlayResult = Hit-out, Hit-in, Foul Ball, K = Strikeout, Walk, 0 = pitch did not result in play
--pitchCount = starts at 00 -> 01 for strike, 10 for ball, (ball)3 for strikeout, 4(strike) for walk
-- pitch types: FB -> Fastball, CRV -> Curveball, SLD -> Slider, CTR -> Cutter, SPL -> Splitter
CREATE TABLE play (
  pitcherID NUMBER NOT NULL,
  OpposingTeam VarChar(20),
  GameDate VARCHAR(10),
  inningID NUMBER(2,0) NOT NULL CHECK(inningID >= 0),
  pitchType VARCHAR(15) NOT NULL,
  strike NUMBER(1,0) CHECK(strike >= 0),
  speed NUMBER CHECK(speed >= 0),
  pitchCount NUMBER(5,0),
  playResult VARCHAR(15),
  PRIMARY KEY(pitcherID, OpposingTeam, GameDate, pitchCount, inningID)
);

CREATE TABLE login (
  username varchar(45) NOT NULL,
  pass varchar(45) DEFAULT NULL,
  firstname varchar(45) NOT NULL,
  lastname varchar(45) NOT NULL,
  usertype number(1) NOT NULL,
  PRIMARY KEY (username)
);

INSERT INTO login VALUES('phesse001', 'test', 'Patrick', 'Hesse', 0);
INSERT INTO login VALUES('uname', 'pass', 'elon', 'tusk', 1);

ALTER TABLE inning
ADD CONSTRAINT fk_game_inning
FOREIGN KEY (OpposingTeam,GameDate) REFERENCES game(OpposingTeam,GameDate) ON DELETE CASCADE;
ALTER TABLE inning
ADD CONSTRAINT fk_pitcher_inning
FOREIGN KEY (PlayerID) REFERENCES pitcher(playerID) ON DELETE CASCADE;
/* add play foreign key (game, inningID, playerID) */
ALTER TABLE play
ADD CONSTRAINT fk_play_inning
FOREIGN KEY (OpposingTeam, GameDate, inningID, pitcherID) REFERENCES inning(OpposingTeam, GameDate, inningID, playerID) ON DELETE CASCADE;

