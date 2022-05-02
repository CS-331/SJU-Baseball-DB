package SJUBaseball;
import java.sql.*;
import oracle.jdbc.driver.OracleDriver;

public class ConnectionProvider {
	private static Connection con=null;
	private static String DRIVER="oracle.jdbc.driver.OracleDriver";  
	private static String CONNECTION_URL = "jdbc:oracle:thin:@//cscioraclerh7srv.ad.csbsju.edu:1521/csci.cscioraclerh7srv.ad.csbsju.edu";
    private static String USERNAME = "TEAM08";
    private static String PASSWORD = "team08";
	static{  
		try{  
		Class.forName(DRIVER);  
		con=DriverManager.getConnection(CONNECTION_URL,USERNAME,PASSWORD);  
		}catch(Exception e){
			e.printStackTrace();
		}  
		}  
		  
	public static Connection getCon(){  
		    return con;  
		}  
}
