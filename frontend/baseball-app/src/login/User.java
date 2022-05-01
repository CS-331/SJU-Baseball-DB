package login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * 
 */
public class User {
    String firstName = "";
    String lastName = "";
    String id = "";
    String password = "";
    Integer type;
   
    boolean loggedIn = false;
   
    public User()
    {
       
    }
   
   public boolean isLoggedIn()
   {
       return loggedIn;
   }
  
  
   public  String getFirstName()
    {
      return firstName;
    }
  
   public void setFirstName(String f)
   {
     firstName = f;
   }
  
    public  String getLastName()
    {
      return lastName;
    }
  
   public void setLastName(String l)
   {
     lastName = l;
   }
  
    public  String getId()
    {
      return id;
    }
  
   public void setId(String i)
   {
     id = i;
   }
    public  String getPassword()
    {
      return password;
    }
  
   public void setPassword(String p)
   {
     password = p;
   }
   
   public Integer getType()
   {
	   return type;
   }
   
  
   public boolean login(String db_username, String db_password)
   {     
        try{
          Connection con = null;
          Class.forName("oracle.jdbc.OracleDriver");  // load the driver
          con = DriverManager.getConnection("jdbc:oracle:thin:@//cscioraclerh7srv.ad.csbsju.edu:1521/csci.cscioraclerh7srv.ad.csbsju.edu", db_username, db_password);
     
          String queryString = "select lastname, firstname, usertype from login where username=? and pass=? ";
          PreparedStatement prep = con.prepareStatement(queryString); 
          prep.setString(1,id);
          prep.setString(2,password);
       
          ResultSet rs  = prep.executeQuery();
          if(rs.next())
          {
           lastName = rs.getString(1);
           firstName = rs.getString(2);
           type = Integer.valueOf(rs.getString(3));
           loggedIn = true;
          }
          else
            loggedIn = false;
          prep.close();
          con.close();
         
         }
        catch(Exception e)
        {
          e.printStackTrace();
          loggedIn = false; 
        } 
       
        return loggedIn;
   }
  
   public void logOut()
   {
     loggedIn = false;
   }
}