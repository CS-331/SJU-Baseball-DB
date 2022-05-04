package SJUBaseball;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PlayDao {
	public static int addPlay(Play p) {
		int status = 0;
		String queryString = "Insert into play values(?,?,?,?,?,?,?,?)";
		
		try {
			Connection myConnection = ConnectionProvider.getCon();
			PreparedStatement preparedStmt = myConnection.prepareStatement(queryString);
			preparedStmt.clearParameters();
			preparedStmt.setInt(1,p.getPitcherId());
			preparedStmt.setString(2,p.getOpposingTeam());
			preparedStmt.setInt(3,p.getInningId());
			preparedStmt.setString(4,p.getPitchType());
			preparedStmt.setInt(5,p.getStrike());
			preparedStmt.setFloat(6,p.getSpeed());
			preparedStmt.setInt(7,p.getPitchCount());
			preparedStmt.setString(8,p.getPlayResult());
			status = preparedStmt.executeUpdate();
			preparedStmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}
	
	public List<Play> getPlays() throws SQLException {
		// an array list that will be populated with game objects that are created using jdbc
        List<Play> playList = new ArrayList<>();
         
        try {
        	Connection connection = ConnectionProvider.createConnection();
            String queryString = "select * from play";
            PreparedStatement prep = connection.prepareStatement(queryString);
         
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
	
	public List<Pitcher> getPitchers() throws SQLException {
		// an array list that will be populated with pitcher objects that are created using jdbc
        List<Pitcher> pitcherList = new ArrayList<>();
         
        try {
        	Connection connection = ConnectionProvider.createConnection();
            String queryString = "select * from pitcher";
            PreparedStatement prep = connection.prepareStatement(queryString);
         
            ResultSet result  = prep.executeQuery();
             
            while (result.next()) {
            	int playerId = result.getInt("playerID");
            	String fname = result.getString("fname");
            	String lname = result.getString("lname");
            	int playerNumber = result.getInt("playerNumber");
                int gamesPlayed = result.getInt("gamesPlayed");
                Pitcher pitcher = new Pitcher(playerId, fname, lname, playerNumber, gamesPlayed);
                
                pitcherList.add(pitcher);
            }  
            connection.close();
             
        } catch (SQLException ex) {
            ex.printStackTrace();
            throw ex;
        }      
         
        return pitcherList;
	}
	public List<Play> getPlaysForPitcher(String pitcherID) throws SQLException {
		// an array list that will be populated with game objects that are created using jdbc
        List<Play> playList = new ArrayList<>();
         
        try {
        	Connection connection = ConnectionProvider.createConnection();
            String queryString = "select * from play where PitcherID = ?";
            PreparedStatement prep = connection.prepareStatement(queryString);
            prep.setString(1,pitcherID);
         
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

}
