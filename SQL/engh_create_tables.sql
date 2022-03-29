drop table play;
drop table inning;
drop table pitcher;
drop table game;
/* create game table */
CREATE TABLE game (
  gameID NUMBER NOT NULL,
  opposingTeam VARCHAR(20),
  gameDate DATE,
/*  cumlativePitches NUMBER */
  PRIMARY KEY(gameID)
);
/* create inning table */
CREATE TABLE inning (
  gameID NUMBER NOT NULL,
  inningID NUMBER(2,0) NOT NULL CHECK(inningID >= 0),
  outs NUMBER(1,0) CHECK(outs >= 0),
  status NUMBER,
/*  numPitches NUMBER */
PRIMARY KEY(gameID, inningID)

);
/* create pitcher table */
CREATE TABLE pitcher (
  playerID NUMBER NOT NULL,
  fName VARCHAR(20),
  lName VARCHAR(20),
  playerNumber NUMBER(3,0) CHECK(playerNumber >= 0),
/*  gamesPlayed NUMBER */
  PRIMARY KEY(playerID)
);
/* create play table */
CREATE TABLE play(
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
/* add inning foreign key */
ALTER TABLE inning
ADD CONSTRAINT fk_game_inning
FOREIGN KEY (gameID) REFERENCES game(gameID);
/* add play foreign key pitcher */
ALTER TABLE play
ADD CONSTRAINT fk_play_pitcher
FOREIGN KEY (pitcherID) REFERENCES pitcher(playerID);
/* add play foreign key (game, inningID) */
ALTER TABLE play
ADD CONSTRAINT fk_play_inning
FOREIGN KEY (gameID, inningID) REFERENCES inning(gameID, inningID);
