package SJUBaseball;

public class Pitcher {
	
	int playerId;
	String fname;
	String lname;
	int playerNumber;
	int gamesPlayed;
	
	public Pitcher() {
		
	}
	
	public Pitcher(int playerId, String fname, String lname, int playerNumber, int gamesPlayed)
	{
		this.playerId = playerId;
		this.fname = fname;
		this.lname = lname;
		this.playerNumber = playerNumber;
		this.gamesPlayed = gamesPlayed;
	}
	
	public int getPlayerId()
	{
		return this.playerId;
		
	}
	public void setPlayerId(int id)
	{
		this.playerId = id;
	}
	
	public String getFirstName()
	{
		return this.fname;
	}
	public void setFirstName(String first)
	{
		this.fname = first;
	}
	
	public String getLastName()
	{
		return this.lname;
	}
	public void setLastName(String last)
	{
		this.lname = last;
	}
	
	public int getPlayerNumber()
	{
		return this.playerNumber;
	}
	public void setPlayerNumber(int num)
	{
		this.playerNumber = num;
	}
	
	public int getGamesPlayed()
	{
		return this.gamesPlayed;
	}
	public void setGamesPlayed(int num)
	{
		this.gamesPlayed = num;
	}
}
