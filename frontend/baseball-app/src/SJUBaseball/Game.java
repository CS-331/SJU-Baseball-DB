package SJUBaseball;


public class Game {
    private String opposingTeam;
    private String date;
    private int cumulativePitches;
 
    public Game(String opposingTeam, String date, int cumulativePitches) {
        this.opposingTeam = opposingTeam;
        this.date = date;
        this.cumulativePitches = cumulativePitches;
    }
 
    public Game() {
		// TODO Auto-generated constructor stub
	}
 
    public String getOpposingTeam() {
        return this.opposingTeam;
    }
 
    public void setOpposingTeam(String name) {
        this.opposingTeam = name;
    }
    
    public String getDate() {
        return this.date;
    }
 
    public void setDate(String date) {
        this.date = date;
    }
    
    public int getCumulativePitches() {
        return this.cumulativePitches;
    }
 
    public void setCumulativePitches(int pitches) {
        this.cumulativePitches = pitches;
    }
}
