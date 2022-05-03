package SJUBaseball;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/new-game")
public class NewGameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GameDAO dao = new GameDAO();
		String opposingTeam = request.getParameter("opposingTeam");
		String gameDate = request.getParameter("gameDate");
		Game newGame = new Game(opposingTeam, gameDate, 0);
		
		PrintWriter out = response.getWriter();
		out.println("SERVLET STARTED");
		out.close();
		try {
			Connection connection2 = ConnectionProvider.createConnection();
	        
	        //Insert into GAME table
	        //System.out.println(opposingTeam);
	        String insertString = "INSERT INTO GAME values(?,?,?)";
	        PreparedStatement prep2 = connection2.prepareStatement(insertString);
	        prep2.setString(1, opposingTeam);
	        prep2.setString(2, gameDate);
	        prep2.setInt(3, 0);
	        
	        int rowsAffected = prep2.executeUpdate();
	        prep2.close();
	        connection2.close();
	    }catch (SQLException ex) {
	    	ex.printStackTrace();
	    }
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("game-screen.jsp");
		request.setAttribute("newGameAdded", newGame);
		dispatcher.forward(request, response);
		return;
	}
}
