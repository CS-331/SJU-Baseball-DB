package SJUBaseball;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
 
public class GameDAO {
	// info for connecting to the database
    String databaseURL = "jdbc:oracle:thin:@//cscioraclerh7srv.ad.csbsju.edu:1521/csci.cscioraclerh7srv.ad.csbsju.edu";
    String user = "";
    String password = "";
     
    public List<Game> getGames() throws SQLException {
    	// an array list that will be populated with game objects that are created using jdbc
        List<Game> gameList = new ArrayList<>();
         
        try (Connection connection = DriverManager.getConnection(databaseURL, user, password)) {
            String sql = "select * from game";
            Statement statement = connection.createStatement();
            ResultSet result = statement.executeQuery(sql);
             
            while (result.next()) {
                int gameID = result.getInt("GameID");
                String opposingTeam = result.getString("OpposingTeam");
                Date date = result.getDate("GameDate");
                int numPitches = result.getInt("cumulativePitches");
                
                Game game = new Game(gameID, opposingTeam, date, numPitches);
                gameList.add(game);
            }          
             
        } catch (SQLException ex) {
            ex.printStackTrace();
            throw ex;
        }      
         
        return gameList;
    }
    
    public List<Play> getGamePlays(int gameId) throws SQLException
    {
    	// an array list that will be populated with game objects that are created using jdbc
        List<Play> playList = new ArrayList<>();
         
        try (Connection connection = DriverManager.getConnection(databaseURL, user, password)) {
            String queryString = "select * from play where gameID = ?";
            PreparedStatement prep = connection.prepareStatement(queryString); 
            prep.setInt(1,gameId);
         
            ResultSet result  = prep.executeQuery();
             
            while (result.next()) {
            	
                int gId = result.getInt("gameID");
                int pitcherId = result.getInt("pitcherID");
                int inningId = result.getInt("inningID");
                String pitchType = result.getString("pitchType");
                int strike = result.getInt("strike");
                int speed = result.getInt("speed");
                int pitchCount = result.getInt("pitchCount");
                String playResult = result.getString("playResult");
                Play play = new Play(pitcherId, gId, inningId, pitchType, strike, speed, pitchCount, playResult);
                
                playList.add(play);
            }          
             
        } catch (SQLException ex) {
            ex.printStackTrace();
            throw ex;
        }      
         
        return playList;
    }
}
