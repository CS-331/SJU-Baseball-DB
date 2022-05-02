package SJUBaseball;
import java.sql.*;

public class PlayDao {
	public static int addPlay(Play p) {
		int status = 0;
		String queryString = "Insert into play values(?,?,?,?,?,?,?,?)";
		
		try {
			Connection myConnection = ConnectionProvider.getCon();
			PreparedStatement preparedStmt = myConnection.prepareStatement(queryString);
			preparedStmt.clearParameters();
			preparedStmt.setInt(1,p.getPitcherId());
			preparedStmt.setInt(2,p.getGameId());
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

}
