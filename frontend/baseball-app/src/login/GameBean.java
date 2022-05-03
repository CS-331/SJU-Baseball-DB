package login;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
/**
*
* 
*/
public class GameBean implements Serializable{
	
    public GameBean()
    {
       
    }
    
	private static final long serialVersionUID = 1L;
    String opposingTeam ;
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



	public boolean createNewGame() throws SQLException { 
	    String databaseURL = "jdbc:oracle:thin:@//cscioraclerh7srv.ad.csbsju.edu:1521/csci.cscioraclerh7srv.ad.csbsju.edu";
	    String user = "cbjork001";
	    String pass = "900238244";
	    
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
            try {
            Connection connection2 = DriverManager.getConnection(databaseURL, user, pass);
            
            //Insert into GAME table
            String insertString = "insert into GAME (OpposingTeam, GameDate, cumulativePitches) values(?,?,?)";
            PreparedStatement prep2 = connection2.prepareStatement(insertString);
            prep2.setString(1, opposingTeam);
            prep2.setString(2, gameDate);
            prep2.setInt(3, 0);
            
            int rowsAffected = prep2.executeUpdate();
            prep2.close();
            connection2.close();
            
            if (rowsAffected > 0) {
            	return true;
            } else {
            	return false;
            } 
        }catch (SQLException ex) {
        	ex.printStackTrace();
        	throw ex;
		}
	}
    
    
}
