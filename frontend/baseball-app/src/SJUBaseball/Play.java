package SJUBaseball;

public class Play {
	
	int pitcherId;
	String opposingTeam;
	String date;
	int inningId;
	String pitchType;
	int strike;
	float speed;
	int pitchCount;
	String playResult;
	
	public Play() {
		
	}
	
	public Play(String opposingTeam, String date, int pitcherId, int inningId, String pitchType, int strike, int speed, int pitchCount, String playResult)
	{
		this.pitcherId = pitcherId;
		this.opposingTeam = opposingTeam;
		this.date = date;
		this.inningId = inningId;
		this.pitchType = pitchType;
		this.strike = strike;
		this.speed = speed;
		this.pitchCount = pitchCount;
		this.playResult = playResult;
	}
	
	public int getPitcherId()
	{
		return this.pitcherId;
		
	}
	public void setPitcherId(int id)
	{
		this.pitcherId = id;
	}
	
	public String getOpposingTeam()
	{
		return this.opposingTeam;
	}
	public void setOpposingTeam(String team)
	{
		this.opposingTeam = team;
	}
	
	public String getDate()
	{
		return this.date;
	}
	
	public void setDate(String date)
	{
		this.date = date;
	}
	
	public int getInningId()
	{
		return this.inningId;
	}
	public void setInningId(int id)
	{
		this.inningId = id;
	}
	
	public String getPitchType()
	{
		return this.pitchType;
	}
	public void setPitchType(String type)
	{
		this.pitchType = type;
	}
	
	public int getStrike()
	{
		return this.strike;
	}
	public void setStrike(int strike)
	{
		this.strike = strike;
	}
	
	public float getSpeed()
	{
		return this.speed;
	}
	public void setSpeed(float speed)
	{
		this.speed = speed;
	}
	
	public int getPitchCount()
	{
		return this.pitchCount;
	}
	public void setPitchCount(int count)
	{
		this.pitchCount = count;
	}
	
	public String getPlayResult()
	{
		return this.playResult;
	}
	public void setPlayResult(String pr)
	{
		this.playResult = pr;
	}
}
