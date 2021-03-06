import random

opposingTeams = ["Red Socks", "UST", "Twins", "Nicks", "Astros", "Cardinals", "UMN", "UMD", "Carlton"]
firstNames = ["John", "Patrick", "Joe", "Jack", "Cameron", "Hunter", "Cole", "Derek", "Matthew", "Shawn", "Ezra",
              "Nick", "Connor", "Will", "Elijah", "Dennis", "Alex", "Andrew"]
lastNames = ["Smith", "Johnson", "Uthe", "Hesse", "Laux", "Engh", "Young", "Hellevik", "Burry", "McDonald", "Anderson",
             "Andrews", "Paul", "Suter", "Dugger"]
pitchTypes = ["FASTBALL", "SPLITTER", "CURVEBALL", "CHANGEUP"]
pitchResults = ["STRIKE", "FOUL", "HIT", "BALL"]
NUM_GAMES = 3
NUM_PITCHERS = 3
INNINGS_PER_GAME = 9
PLAYS_PER_INNING = 20


def main():
    with open("dummyData.sql", "w") as file:
        file.write("--File autogenerated\n")
        file.write(f"\n/* {NUM_PITCHERS} pitchers generated */\n")
        for pitcher_id in range(NUM_PITCHERS):
            file.write(gen_pitcher(pitcher_id))
        file.write(f"\n/* {NUM_GAMES} games generated */\n")
        for game_id in range(NUM_GAMES):
            file.write(f"\n--Game {game_id}\n")
            file.write(gen_game(game_id))
            file.write(f"\n/* {INNINGS_PER_GAME} innings generated for game {game_id} */\n")
            for inning in range(1, INNINGS_PER_GAME+1):
                file.write(f"\n--Inning {inning}\n")
                inning_pitcher = random.choice(range(NUM_PITCHERS))
                file.write(gen_inning(game_id, inning, inning_pitcher))
                file.write(f"\n-- {PLAYS_PER_INNING} plays generated for inning {inning} of game {game_id}\n")
                for play in range(PLAYS_PER_INNING):
                    file.write(gen_pitch(game_id, inning, play, inning_pitcher))


def gen_pitch(game, inning, pitch, pitcher):
    game_id = game
    inning_id = inning
    pitch_num = pitch
    pitcher_id = pitcher
    pitch_type = random.choice(pitchTypes)
    pitch_result = random.choice(pitchResults)
    pitch_speed = random.randint(60, 100)
    strike = 1 if (pitch_type == "STRIKE") else 0
    return f"INSERT INTO play VALUES ({pitcher_id}, {game_id}, {inning_id}, '{pitch_type}', {strike}, {pitch_speed}, " \
           f"{pitch_num}, '{pitch_result}');\n"


def gen_inning(game_id, inning_id, pitcher_id):
    out_count = 3
    return f"INSERT INTO inning VALUES ({game_id}, {pitcher_id}, {inning_id}, {out_count});\n"


def gen_pitcher(pitcher_id):
    first = random.choice(firstNames)
    last = random.choice(lastNames)
    shirt = random.randint(0, 100)
    return f"INSERT INTO pitcher VALUES ({pitcher_id}, '{first}', '{last}', {shirt});\n"


def gen_game(game_id):
    opposing_team = random.choice(opposingTeams)
    date = "{year}-{month}-{day}".format(year=random.randint(2019, 2023), month=random.randint(1, 13),
                                         day=random.randint(0, 29))

    return f"INSERT INTO game VALUES ({game_id}, '{opposing_team}', DATE '{date}');\n"


if __name__ == '__main__':
    main()
