package SJUBaseball;

import java.sql.Connection;
import SJUBaseball.ConnectionProvider;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class inningDAO {
	
	public static boolean inningExists(String opposingTeam, String gameDate, int inningID, int playerID) {
		return false;
	}
	
	
	
	public static boolean createNewInning(String opposingTeam, String gameDate, int inningID, int playerID) { 
        try {
        Connection connection2 = ConnectionProvider.createConnection();
        
        //Insert into Inning table
        //System.out.println(opposingTeam);
        String insertString = "insert into INNING values(?,?,?,?,?,?)";
        PreparedStatement prep2 = connection2.prepareStatement(insertString);
        prep2.setString(1, opposingTeam);
        prep2.setString(2, gameDate);
        prep2.setInt(3, inningID);
        prep2.setInt(4, playerID);
        prep2.setInt(5, 0);
        prep2.setInt(6, 0);
        
        int rowsAffected = prep2.executeUpdate();
        prep2.close();
        connection2.close();
        
        if (rowsAffected > 0) {
        	return true;
        }
    }catch (SQLException ex) {
    	ex.printStackTrace();
	}
        return false;
}

}
