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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        String opposingTeam = request.getParameter("game");
        request.setAttribute("team", opposingTeam);
        String date = request.getParameter("gameDate");
        request.setAttribute("date", date);

        String option= request.getParameter("options");
        request.setAttribute("option", option);
        
        
        GameDAO dao = new GameDAO();
        
    	try {

            List<Play> playList = dao.getGamePlays(opposingTeam, date);
            request.setAttribute("playList", playList);
            
            float strike_per = dao.getGameStrikePer(opposingTeam, date);
            request.setAttribute("percent", strike_per);
 
            RequestDispatcher dispatcher = request.getRequestDispatcher("plays.jsp");
            dispatcher.forward(request, response);
 
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
     
    }

}
