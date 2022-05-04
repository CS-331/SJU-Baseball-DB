package SJUBaseball;

public class Pitcher {
	
	private int playerID = 0;
	private String fName = "";
	private String lName = "";
	private int playerNumber = 0;
	private int gamesPlayed = 0;
	
	public Pitcher() {
		
	}
	
	public Pitcher(int playerID, String fName, String lName, int playerNumber, int gamesPlayed) {
		this.playerID = playerID;
		this.fName = fName;
		this.lName = lName;
		this.playerNumber = playerNumber;
		this.gamesPlayed = gamesPlayed;
	}
	
	public int getPlayerID() {
		return playerID;
	}
	public void setPlayerID(int playerID) {
		this.playerID = playerID;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getlName() {
		return lName;
	}
	public void setlName(String lName) {
		this.lName = lName;
	}
	public int getPlayerNumber() {
		return playerNumber;
	}
	public void setPlayerNumber(int playerNumber) {
		this.playerNumber = playerNumber;
	}
	public int getGamesPlayed() {
		return gamesPlayed;
	}
	public void setGamesPlayed(int gamesPlayed) {
		this.gamesPlayed = gamesPlayed;
	}
}
