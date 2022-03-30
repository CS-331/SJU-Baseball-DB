CREATE TABLE Game (
GameID NUMBER NOT NULL
OpposingTeam VARCHAR(20)
GameDate DATE,
cumlativePitches NUMBER
  	PRIMARY KEY(gameID)
);

CREATE TABLE inning (
  gameID NUMBER NOT NULL,
  inningID NUMBER(2,0) NOT NULL CHECK(inningID >= 0),
  PlayerID NUMBER NOT NULL,
  outs NUMBER(1,0) CHECK(outs >= 0),
  numPitches NUMBER
  PRIMARY KEY(gameID, inningID, PlayerID)
);

CREATE TABLE pitcher (
  playerID NUMBER NOT NULL,
  fName VARCHAR(20),
  lName VARCHAR(20),
  playerNumber NUMBER(3,0) CHECK(playerNumber >= 0),
  gamesPlayed NUMBER
  PRIMARY KEY(playerID)
);

**PlayResult = Hit, Foul Ball, Looking, Swinging
CREATE TABLE play (
  pitcherID NUMBER NOT NULL,
  gameID NUMBER NOT NULL,
  inningID NUMBER(2,0) NOT NULL CHECK(inningID >= 0),
  pitchType VARCHAR(15) NOT NULL,
  strike NUMBER(1,0) CHECK(strike >= 0),
  speed NUMBER CHECK(speed >= 0),
  pitchCount NUMBER(5,0),
  playResult VARCHAR(15),
  PRIMARY KEY(pitcherID, gameID, pitchCount, inningID)
);

ALTER TABLE inning
ADD CONSTRAINT fk_game_inning
FOREIGN KEY (gameID) REFERENCES game(gameID) ON DELETE CASCADE;
ADD CONSTRAINT fk_pitcher_inning
FOREIGN KEY (PlayerID) REFERENECES pitcher(playerID) ON DELETE CASCADE;
/* add play foreign key pitcher */
ALTER TABLE play
ADD CONSTRAINT fk_play_pitcher
FOREIGN KEY (pitcherID) REFERENCES pitcher(playerID) ON DELETE CASCADE;
/* add play foreign key (game, inningID) */
ALTER TABLE play
ADD CONSTRAINT fk_play_inning
FOREIGN KEY (gameID, inningID) REFERENCES inning(gameID, inningID) ON DELETE CASCADE;

