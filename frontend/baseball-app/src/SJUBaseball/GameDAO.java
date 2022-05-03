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
 
public class GameDAO {
     
    public List<Game> getGames() throws SQLException, ClassNotFoundException {
    	// an array list that will be populated with game objects that are created using jdbc
        List<Game> gameList = new ArrayList<>();
        
        try {
        	Connection connection = ConnectionProvider.createConnection();
            String sql = "select * from game";
            Statement statement = connection.createStatement();
            ResultSet result = statement.executeQuery(sql);
             
            while (result.next()) {
                String opposingTeam = result.getString("OpposingTeam");
                String date = result.getString("GameDate");
                int numPitches = result.getInt("cumulativePitches");
                
                Game game = new Game(opposingTeam, date, numPitches);
                gameList.add(game);
            }
            connection.close();
             
        } catch (SQLException ex) {
            ex.printStackTrace();
            throw ex;
        }      
         
        return gameList;
    }
    
    public List<Play> getGamePlays(String opposingTeam, String date) throws SQLException
    {
    	// an array list that will be populated with game objects that are created using jdbc
        List<Play> playList = new ArrayList<>();
         
        try {
        	Connection connection = ConnectionProvider.createConnection();
            String queryString = "select * from play where OpposingTeam = ? and GameDate = ?";
            PreparedStatement prep = connection.prepareStatement(queryString); 
            prep.setString(1,opposingTeam);
            prep.setString(2, date);
         
            ResultSet result  = prep.executeQuery();
             
            while (result.next()) {
            	String team= result.getString("OpposingTeam");
            	String d = result.getString("GameDate");
                int pitcherId = result.getInt("pitcherID");
                int inningId = result.getInt("inningID");
                String pitchType = result.getString("pitchType");
                int strike = result.getInt("strike");
                int speed = result.getInt("speed");
                int pitchCount = result.getInt("pitchCount");
                String playResult = result.getString("playResult");
                Play play = new Play(team, d, pitcherId, inningId, pitchType, strike, speed, pitchCount, playResult);
                
                playList.add(play);
            }  
            connection.close();
             
        } catch (SQLException ex) {
            ex.printStackTrace();
            throw ex;
        }      
         
        return playList;
    }
    
    public List<String> getDatesFromGame(String opposingTeam) throws SQLException
    {
    	// an array list that will be populated with game objects that are created using jdbc
        List<String> dateList = new ArrayList<>();
         
        try {
        	Connection connection = ConnectionProvider.createConnection();
            String queryString = "select GameDate from game where OpposingTeam = ?";
            PreparedStatement prep = connection.prepareStatement(queryString); 
            prep.setString(1,opposingTeam);
         
            ResultSet result  = prep.executeQuery();
             
            while (result.next()) {
            	
                String date = result.getString("GameDate");
                
                dateList.add(date);
            }  
            connection.close();
             
        } catch (SQLException ex) {
            ex.printStackTrace();
            throw ex;
        }      
         
        return dateList;
    }
    
	public boolean createNewGame(String opposingTeam, String gameDate) throws SQLException { 
        try {
        Connection connection2 = ConnectionProvider.createConnection();
        
        //Insert into GAME table
        //System.out.println(opposingTeam);
        String insertString = "insert into GAME values(?,?,?)";
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
