package SJUBaseball;
import java.sql.*;

public class PlayDao {
	public static int addPlay(Play p) {
		int status = 0;
		String queryString = "Insert into play values(?,?,?,?,?,?,?,?,?)";
		
		try {
			Connection myConnection = ConnectionProvider.createConnection();
			PreparedStatement preparedStmt = myConnection.prepareStatement(queryString);
			preparedStmt.clearParameters();
			preparedStmt.setInt(1,p.getPitcherId());
			preparedStmt.setString(2,p.getOpposingTeam());
			preparedStmt.setString(3,p.getDate());
			preparedStmt.setInt(4,p.getInningId());
			preparedStmt.setString(5,p.getPitchType());
			preparedStmt.setInt(6,p.getStrike());
			preparedStmt.setFloat(7,p.getSpeed());
			preparedStmt.setInt(8,p.getPitchCount());
			preparedStmt.setString(9,p.getPlayResult());
			status = preparedStmt.executeUpdate();
			preparedStmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}

}
