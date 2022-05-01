package SJUBaseball;

import java.util.Date;

public class Game {
    private int gameId;
    private String opposingTeam;
    private Date date;
    private int cumulativePitches;
 
    public Game(int gameId, String opposingTeam, Date date, int cumulativePitches) {
    	super();
        this.gameId = gameId;
        this.opposingTeam = opposingTeam;
        this.date = date;
        this.cumulativePitches = cumulativePitches;
    }
 
    public int getGameId() {
        return this.gameId;
    }
 
    public void setId(int id) {
        this.gameId = id;
    }
 
    public String getOpposingTeam() {
        return this.opposingTeam;
    }
 
    public void setOpposingTeam(String name) {
        this.opposingTeam = name;
    }
    
    public Date getDate() {
        return this.date;
    }
 
    public void setDate(Date date) {
        this.date = date;
    }
    
    public int getCumulativePitches() {
        return this.cumulativePitches;
    }
 
    public void setCumulativePitches(int pitches) {
        this.cumulativePitches = pitches;
    }
}
