package login;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import SJUBaseball.ConnectionProvider;
/**
*
* 
*/
public class GameBean implements Serializable{
	
    public GameBean()
    {
       
    }
    
	private static final long serialVersionUID = 1L;
    String opposingTeam;
    String gameDate;
    
    
    
	public String getOpposingTeam() {
		return opposingTeam;
	}



	public void setOpposingTeam(String opposingTeam) {
		this.opposingTeam = opposingTeam;
	}



	public String getGameDate() {
		return gameDate;
	}



	public void setGameDate(String gameDate) {
		this.gameDate = gameDate;
	}
    
    
}
