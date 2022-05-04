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

public class PitcherDAO {
	
    public List<Pitcher> getPitchers() throws SQLException, ClassNotFoundException {
    	// an array list that will be populated with game objects that are created using jdbc
        List<Pitcher> pitcherList = new ArrayList<>();
        
        try {
        	Connection connection = ConnectionProvider.createConnection();
            String sql = "select * from pitcher";
            Statement statement = connection.createStatement();
            ResultSet result = statement.executeQuery(sql);
             
            while (result.next()) {
            	Pitcher pitcher = new Pitcher();
            	pitcher.setPlayerID(result.getInt("playerID"));
            	pitcher.setfName(result.getString("fName"));
            	pitcher.setlName(result.getString("lName"));
            	pitcher.setPlayerNumber(result.getInt("playerNumber"));
            	pitcher.setGamesPlayed(result.getInt("gamesPlayed"));
                pitcherList.add(pitcher);
            }
            connection.close();
             
        } catch (SQLException ex) {
            ex.printStackTrace();
            throw ex;
        }      
         
        return pitcherList;
    }

}
