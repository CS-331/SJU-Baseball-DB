package SJUBaseball;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PitchListServlet
 */
@WebServlet("/pitches")
public class PitchListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String opposingTeam = request.getParameter("game");
        request.setAttribute("selectedTeam", opposingTeam);
        String date = request.getParameter("gameDate");
        
        GameDAO dao = new GameDAO();
    	try {
            System.out.println(opposingTeam);
            List<Play> playList = dao.getGamePlays(opposingTeam, date);
            request.setAttribute("playList", playList);
 
            RequestDispatcher dispatcher = request.getRequestDispatcher("Pitches.jsp");
            dispatcher.forward(request, response);
 
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
     
    }

}
